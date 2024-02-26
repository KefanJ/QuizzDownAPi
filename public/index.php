<?php

use App\Models\DB;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Selective\BasePath\BasePathMiddleware;
use Slim\Factory\AppFactory;


require_once __DIR__ . '/../vendor/autoload.php';



$app = AppFactory::create();
$app->addBodyParsingMiddleware();

$app->addRoutingMiddleware();
$app->add(new BasePathMiddleware($app));
$app->addErrorMiddleware(true, true, true);


$app->get('/', function (Request $request, Response $response) {
   $response->getBody()->write('Hello World!');
   return $response;
});

$app->get('/users', function (Request $request, Response $response) {
  $sql = "SELECT * FROM utilisateur";
 
  try {
    $db = new Db();
    $conn = $db->connect();
    $stmt = $conn->query($sql);
    $customers = $stmt->fetchAll(PDO::FETCH_OBJ);
    $db = null;
   
    $response->getBody()->write(json_encode($customers));
    return $response
      ->withHeader('content-type', 'application/json')
      ->withStatus(200);
  } catch (PDOException $e) {
    $error = array(
      "message" => $e->getMessage()
    );
 
    $response->getBody()->write(json_encode($error));
    return $response
      ->withHeader('content-type', 'application/json')
      ->withStatus(500);
  }
 });



 $app->post('/users/authenticate', function (Request $request, Response $response) {
  // Récupérer le login et le mot de passe à partir du corps de la requête
  $data = $request->getParsedBody();
  $login = $data['login'];
  $password = $data['password']; // Considérez l'utilisation de hachage pour les mots de passe

  // SQL pour vérifier l'existence de l'utilisateur avec le login et le mot de passe fournis
  $sql = "SELECT * FROM utilisateur WHERE Login = :login AND Password = :password"; // Remplacer par votre vrai nom de colonne pour le mot de passe

  try {
      $db = new DB();
      $conn = $db->connect();

      $stmt = $conn->prepare($sql);
      $stmt->bindParam(':login', $login);
      $stmt->bindParam(':password', $password); // Si vous utilisez le hachage, appliquez-le ici avant de comparer
      $stmt->execute();

      $user = $stmt->fetch(PDO::FETCH_OBJ);

      if ($user) {
          // Utilisateur trouvé, renvoyer une réponse positive
          $response->getBody()->write(json_encode(['success' => true, 'user' => $user]));
          return $response->withHeader('Content-Type', 'application/json')->withHeader('Access-Control-Allow-Origin', '*')->withStatus(200);
      } else {
          // Utilisateur non trouvé, renvoyer une erreur
          $response->getBody()->write(json_encode(['success' => false, 'message' => 'Invalid login or password']));
          return $response->withHeader('Content-Type', 'application/json')->withStatus(401); // 401 Non autorisé
      }
  } catch (PDOException $e) {
      $error = ["message" => $e->getMessage()];
      $response->getBody()->write(json_encode($error));
      return $response->withHeader('Content-Type', 'application/json')->withStatus(500);
  }
});


$app->put('/users/saveScore/{id}', function (Request $request, Response $response) {
    $id = $request->getAttribute('id');
    $data = $request->getParsedBody();
    $score = $data['score'];

    $sqlUpdate = "UPDATE utilisateur SET score = :score WHERE id_utilisateur = :id";
    $sqlSelect = "SELECT score FROM utilisateur WHERE id_utilisateur = :id";

    try {
        $db = new DB();
        $conn = $db->connect();

        // Mise à jour du score
        $stmtUpdate = $conn->prepare($sqlUpdate);
        $stmtUpdate->bindParam(':score', $score);
        $stmtUpdate->bindParam(':id', $id);
        $stmtUpdate->execute();

        // Sélection du score mis à jour
        $stmtSelect = $conn->prepare($sqlSelect);
        $stmtSelect->bindParam(':id', $id);
        $stmtSelect->execute();
        $updatedScore = $stmtSelect->fetch(PDO::FETCH_OBJ);

        $db = null;
        
        if ($updatedScore) {
            // Envoi du score mis à jour
            $response->getBody()->write(json_encode(['success' => true, 'updatedScore' => $updatedScore->score]));
        } else {
            // Gestion de l'erreur si le score n'est pas trouvé
            $response->getBody()->write(json_encode(['success' => false, 'message' => 'Score not updated']));
        }

        return $response->withHeader('content-type', 'application/json')->withStatus(200);
    } catch (PDOException $e) {
        $error = ['message' => $e->getMessage()];
        $response->getBody()->write(json_encode($error));
        return $response->withHeader('content-type', 'application/json')->withStatus(500);
    }
});



$app->get('/fetch-trivia', function (Request $request, Response $response, array $args) {
  // Utilisation de cURL pour obtenir les données de l'API
  $curl = curl_init("https://opentdb.com/api.php?amount=20");
  curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
  $apiResponse = curl_exec($curl);
  curl_close($curl);

  if ($apiResponse) {
      $data = json_decode($apiResponse, true);

      try {
          $db = new DB();
          $pdo = $db->connect();

          foreach ($data["results"] as $result) {
              // Vérifier si la question existe déjà
              $checkStmt = $pdo->prepare("SELECT id FROM questions WHERE question = ?");
              $checkStmt->execute([$result["question"]]);
              $exists = $checkStmt->fetch(PDO::FETCH_ASSOC);

              if (!$exists) {
                  // Insertion dans la table `questions`
                  $stmt = $pdo->prepare("INSERT INTO questions (type, difficulty, category, question) VALUES (?, ?, ?, ?)");
                  $stmt->execute([$result["type"], $result["difficulty"], $result["category"], $result["question"]]);
                  $question_id = $pdo->lastInsertId();

                  // Insertion dans la table `answers` pour la bonne réponse
                  $stmt = $pdo->prepare("INSERT INTO answers (question_id, answer, is_correct) VALUES (?, ?, ?)");
                  $stmt->execute([$question_id, $result["correct_answer"], true]);

                  // Insertion pour les réponses incorrectes
                  foreach ($result["incorrect_answers"] as $answer) {
                      $stmt->execute([$question_id, $answer, false]);
                  }
              }
          }

          $response->getBody()->write("Importation des questions effectuée.");
      } catch (PDOException $e) {
          $error = ["message" => $e->getMessage()];
          $response->getBody()->write(json_encode($error));
          return $response->withHeader('Content-Type', 'application/json')->withStatus(500);
      }
  } else {
      $response->getBody()->write("Échec de l'importation des questions.");
      return $response->withHeader('Content-Type', 'application/json')->withStatus(500);
  }

  return $response;
});


$app->get('/fetch-trivia/sports', function (Request $request, Response $response, array $args) {
  // Utilisation de cURL pour obtenir les données de l'API
  $curl = curl_init("https://opentdb.com/api.php?amount=20&category=21&difficulty=easy&type=multiple");
  curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
  $apiResponse = curl_exec($curl);
  curl_close($curl);

  if ($apiResponse) {
      $data = json_decode($apiResponse, true);

      try {
          $db = new DB();
          $pdo = $db->connect();

          foreach ($data["results"] as $result) {
              // Vérifier si la question existe déjà
              $checkStmt = $pdo->prepare("SELECT id FROM questions WHERE question = ?");
              $checkStmt->execute([$result["question"]]);
              $exists = $checkStmt->fetch(PDO::FETCH_ASSOC);

              if (!$exists) {
                  // Insertion dans la table `questions`
                  $stmt = $pdo->prepare("INSERT INTO questions (type, difficulty, category, question) VALUES (?, ?, ?, ?)");
                  $stmt->execute([$result["type"], $result["difficulty"], $result["category"], $result["question"]]);
                  $question_id = $pdo->lastInsertId();

                  // Insertion dans la table `answers` pour la bonne réponse
                  $stmt = $pdo->prepare("INSERT INTO answers (question_id, answer, is_correct) VALUES (?, ?, ?)");
                  $stmt->execute([$question_id, $result["correct_answer"], true]);

                  // Insertion pour les réponses incorrectes
                  foreach ($result["incorrect_answers"] as $answer) {
                      $stmt->execute([$question_id, $answer, false]);
                  }
              }
          }

          $response->getBody()->write("Importation des questions effectuée.");
      } catch (PDOException $e) {
          $error = ["message" => $e->getMessage()];
          $response->getBody()->write(json_encode($error));
          return $response->withHeader('Content-Type', 'application/json')->withStatus(500);
      }
  } else {
      $response->getBody()->write("Échec de l'importation des questions.");
      return $response->withHeader('Content-Type', 'application/json')->withStatus(500);
  }

  return $response;
});
$app->get('/fetch-trivia/cinema', function (Request $request, Response $response, array $args) {
    // Utilisation de cURL pour obtenir les données de l'API
    $curl = curl_init("https://opentdb.com/api.php?amount=20&category=11&difficulty=easy&type=multiple");
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
    $apiResponse = curl_exec($curl);
    curl_close($curl);
  
    if ($apiResponse) {
        $data = json_decode($apiResponse, true);
  
        try {
            $db = new DB();
            $pdo = $db->connect();
  
            foreach ($data["results"] as $result) {
                // Vérifier si la question existe déjà
                $checkStmt = $pdo->prepare("SELECT id FROM questions WHERE question = ?");
                $checkStmt->execute([$result["question"]]);
                $exists = $checkStmt->fetch(PDO::FETCH_ASSOC);
  
                if (!$exists) {
                    // Insertion dans la table `questions`
                    $stmt = $pdo->prepare("INSERT INTO questions (type, difficulty, category, question) VALUES (?, ?, ?, ?)");
                    $stmt->execute([$result["type"], $result["difficulty"], $result["category"], $result["question"]]);
                    $question_id = $pdo->lastInsertId();
  
                    // Insertion dans la table `answers` pour la bonne réponse
                    $stmt = $pdo->prepare("INSERT INTO answers (question_id, answer, is_correct) VALUES (?, ?, ?)");
                    $stmt->execute([$question_id, $result["correct_answer"], true]);
  
                    // Insertion pour les réponses incorrectes
                    foreach ($result["incorrect_answers"] as $answer) {
                        $stmt->execute([$question_id, $answer, false]);
                    }
                }
            }
  
            $response->getBody()->write("Importation des questions effectuée.");
        } catch (PDOException $e) {
            $error = ["message" => $e->getMessage()];
            $response->getBody()->write(json_encode($error));
            return $response->withHeader('Content-Type', 'application/json')->withStatus(500);
        }
    } else {
        $response->getBody()->write("Échec de l'importation des questions.");
        return $response->withHeader('Content-Type', 'application/json')->withStatus(500);
    }
  
    return $response;
  });

// $app->get('/questions', function (Request $request, Response $response) {
//   $db = new Db();
//   $conn = $db->connect();

//   // Requête pour récupérer toutes les questions
//   $sql = "SELECT * FROM questions";
//   $stmt = $conn->query($sql);
//   $questions = $stmt->fetchAll(PDO::FETCH_ASSOC);

//   // Pour chaque question, récupérer les réponses associées
//   foreach ($questions as $key => $question) {
//       $questionId = $question['id'];
//       $sql = "SELECT * FROM answers WHERE question_id = :questionId";
//       $stmt = $conn->prepare($sql);
//       $stmt->bindParam(':questionId', $questionId);
//       $stmt->execute();
//       $answers = $stmt->fetchAll(PDO::FETCH_ASSOC);

//       // Séparer les réponses correctes et incorrectes
//       $correct_answer = '';
//       $incorrect_answers = [];
//       foreach ($answers as $answer) {
//           if ($answer['is_correct']) {
//               $correct_answer = $answer['answer'];
//           } else {
//               $incorrect_answers[] = $answer['answer'];
//           }
//       }

//       // Ajouter les réponses à la question
//       $questions[$key]['correct_answer'] = $correct_answer;
//       $questions[$key]['incorrect_answers'] = $incorrect_answers;
//   }

//   // Renvoyer les données au format JSON
//   $response->getBody()->write(json_encode($questions));
//   return $response
//       ->withHeader('content-type', 'application/json')
//       ->withStatus(200);
// });

$app->get('/questions/sports-multiple', function (Request $request, Response $response) {
  // Requête SQL pour récupérer les questions de type 'multiple' de la catégorie 'Sports'
  $sql = "SELECT q.id, q.type, q.difficulty, q.category, q.question, 
                 (SELECT a.answer FROM answers a WHERE a.question_id = q.id AND a.is_correct = 1) as correct_answer,
                 (SELECT GROUP_CONCAT(a.answer SEPARATOR ', ') FROM answers a WHERE a.question_id = q.id AND a.is_correct = 0) as incorrect_answers
          FROM questions q 
          WHERE q.category = 'Sports' AND q.type = 'multiple'";

  try {
      // Connexion à la base de données
      $db = new Db();
      $conn = $db->connect();

      // Exécution de la requête
      $stmt = $conn->query($sql);
      $questions = $stmt->fetchAll(PDO::FETCH_OBJ);

      // Transformer les données pour correspondre à la structure JSON souhaitée
      $formattedQuestions = [];
      foreach ($questions as $question) {
          $formattedQuestion = [
              "id" => $question->id,
              "type" => $question->type,
              "difficulty" => $question->difficulty,
              "category" => $question->category,
              "question" => $question->question,
              "correct_answer" => $question->correct_answer,
              "incorrect_answers" => explode(', ', $question->incorrect_answers)
          ];
          array_push($formattedQuestions, $formattedQuestion);
      }

      $db = null;

      // Envoi des données au format JSON
      $response->getBody()->write(json_encode($formattedQuestions));
      return $response
          ->withHeader('content-type', 'application/json')
          ->withStatus(200);
  } catch (PDOException $e) {
      // Gestion des erreurs
      $error = array(
          "message" => $e->getMessage()
      );

      $response->getBody()->write(json_encode($error));
      return $response
          ->withHeader('content-type', 'application/json')
          ->withStatus(500);
  }
});

$app->get('/questions', function (Request $request, Response $response) {


  $categoryMap = [
    21 => 'Sports',
    11 => 'Entertainment: Film',
    31 => 'Entertainment: Japanese Anime &amp; Manga'
    // Ajoutez d'autres catégories ici
];
  // Récupération des paramètres 'amount' et 'category' de l'URL
  $amount = $request->getQueryParams()['amount'] ?? 10; // Valeur par défaut à 10 si 'amount' n'est pas spécifié
  $categoryNumber = $request->getQueryParams()['category'] ?? 21;
  $category = $categoryMap[$categoryNumber] ?? 'Sports';; // Valeur par défaut à 'Sports' si 'category' n'est pas spécifié

  // Requête SQL pour récupérer les questions de la catégorie et du type spécifiés
  $sql = "SELECT q.id, q.type, q.difficulty, q.category, q.question, 
  (SELECT a.answer FROM answers a WHERE a.question_id = q.id AND a.is_correct = 1) as correct_answer,
  (SELECT GROUP_CONCAT(a.answer SEPARATOR ', ') FROM answers a WHERE a.question_id = q.id AND a.is_correct = 0) as incorrect_answers
  FROM questions q 
  WHERE q.category = :category AND q.type = 'multiple'
  ORDER BY RAND()
  LIMIT :amount";


  try {
      // Connexion à la base de données
      $db = new Db();
      $conn = $db->connect();

      // Préparation et exécution de la requête avec les paramètres
      $stmt = $conn->prepare($sql);
      $stmt->bindParam(':category', $category, PDO::PARAM_STR);
      $stmt->bindParam(':amount', $amount, PDO::PARAM_INT);
      $stmt->execute();
      $questions = $stmt->fetchAll(PDO::FETCH_OBJ);
      $formattedQuestions = [];
      foreach ($questions as $question) {
          $formattedQuestion = [
              "id" => $question->id,
              "type" => $question->type,
              "difficulty" => $question->difficulty,
              "category" => $question->category,
              "question" => $question->question,
              "correct_answer" => $question->correct_answer,
              "incorrect_answers" => explode(', ', $question->incorrect_answers)
          ];
          array_push($formattedQuestions, $formattedQuestion);
      }

      $db = null;

      $data = [
        "results" => $formattedQuestions
    ];

      // Envoi des données au format JSON
      $response->getBody()->write(json_encode($data));
      return $response
          ->withHeader('content-type', 'application/json')
          ->withStatus(200);

      // Reste du code...
  } catch (PDOException $e) {
      // Gestion des erreurs
          // Gestion des erreurs
          $error = array(
            "message" => $e->getMessage()
        );
  
        $response->getBody()->write(json_encode($error));
        return $response
            ->withHeader('content-type', 'application/json')
            ->withStatus(500);
  }
});




 $app->run(); 