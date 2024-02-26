-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 26 fév. 2024 à 05:04
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `quizz-down`
--

-- --------------------------------------------------------

--
-- Structure de la table `answers`
--

CREATE TABLE `answers` (
  `id` int(11) DEFAULT NULL,
  `question_id` int(11) NOT NULL,
  `answer` varchar(100) NOT NULL,
  `is_correct` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `answers`
--

INSERT INTO `answers` (`id`, `question_id`, `answer`, `is_correct`) VALUES
(NULL, 2, 'Tragedy', 1),
(NULL, 2, 'Night Fever', 0),
(NULL, 2, 'Stayin&#039; Alive', 0),
(NULL, 2, 'You Should Be Dancing', 0),
(NULL, 3, 'True', 1),
(NULL, 3, 'False', 0),
(NULL, 4, 'Envy', 1),
(NULL, 4, 'Pride', 0),
(NULL, 4, 'Sloth', 0),
(NULL, 4, 'Wrath', 0),
(NULL, 5, '2007', 1),
(NULL, 5, '2008', 0),
(NULL, 5, '2009', 0),
(NULL, 5, '2010', 0),
(NULL, 6, 'New Mexico', 1),
(NULL, 6, 'Nevada', 0),
(NULL, 6, 'Arizona', 0),
(NULL, 6, 'Wyoming', 0),
(NULL, 7, 'Finnish', 1),
(NULL, 7, 'English', 0),
(NULL, 7, 'Hindi', 0),
(NULL, 7, 'Russian', 0),
(NULL, 8, 'Alan Alda', 1),
(NULL, 8, 'Eddie Murphy', 0),
(NULL, 8, 'Alec Baldwin', 0),
(NULL, 8, 'Kevin Nealon', 0),
(NULL, 9, 'T-45', 1),
(NULL, 9, 'T-51', 0),
(NULL, 9, 'T-60', 0),
(NULL, 9, 'X-01', 0),
(NULL, 10, 'Limitless Fury', 1),
(NULL, 10, 'Let The Sparks Fly', 0),
(NULL, 10, 'Down', 0),
(NULL, 10, 'Give Up The Ghost', 0),
(NULL, 11, '17', 1),
(NULL, 11, '18', 0),
(NULL, 11, '15', 0),
(NULL, 11, '16', 0),
(NULL, 12, 'True', 1),
(NULL, 12, 'False', 0),
(NULL, 13, 'Wessex', 1),
(NULL, 13, 'Barsetshire', 0),
(NULL, 13, 'Fulchester', 0),
(NULL, 13, 'Ambridge', 0),
(NULL, 14, 'Bratislava', 1),
(NULL, 14, 'Sofia', 0),
(NULL, 14, 'Ljubljana', 0),
(NULL, 14, 'Sarajevo', 0),
(NULL, 15, '&quot;A rainy Lithuanian / Is dancing as an Indian&quot;', 1),
(NULL, 15, '&quot;Fly away on, my zephyr / I feel it more than ever&quot;', 0),
(NULL, 15, '&quot;And I liked the dimple in your chin / Your pale blue eyes&quot;', 0),
(NULL, 15, '&quot;You used to be so warm and affectionate...but now you&#039;re quick to get into your regret&qu', 0),
(NULL, 16, 'False', 1),
(NULL, 16, 'True', 0),
(NULL, 17, 'Fane', 1),
(NULL, 17, 'Lohse', 0),
(NULL, 17, 'The Red Prince', 0),
(NULL, 17, 'There are no skeletal origin characters', 0),
(NULL, 18, 'Bones', 1),
(NULL, 18, 'Skin', 0),
(NULL, 18, 'Brain', 0),
(NULL, 18, 'Heart', 0),
(NULL, 19, 'Jotaro Kujo', 1),
(NULL, 19, 'Giorno Giovanna', 0),
(NULL, 19, 'Joseph Joestar', 0),
(NULL, 19, 'Josuke Higashikata', 0),
(NULL, 20, 'Ace Combat', 1),
(NULL, 20, 'Jet Set Radio', 0),
(NULL, 20, 'Deus Ex', 0),
(NULL, 20, 'Crimson Skies', 0),
(NULL, 21, 'Battle of Adrianople', 1),
(NULL, 21, 'Battle of Thessalonica', 0),
(NULL, 21, 'Battle of Pollentia', 0),
(NULL, 21, 'Battle of Constantinople', 0),
(NULL, 22, 'Edward &quot;Whitebeard&quot; Newgate', 1),
(NULL, 22, 'Former Marine Fleet Admiral Sengoku', 0),
(NULL, 22, 'Pirate King Gol D Roger', 0),
(NULL, 22, 'Silvers Rayleigh', 0),
(NULL, 23, 'Turn to Frog', 1),
(NULL, 23, 'Spore Frog', 0),
(NULL, 23, 'Bloated Toad', 0),
(NULL, 23, 'Frogmite', 0),
(NULL, 24, 'Any god they wanted', 1),
(NULL, 24, 'Athena', 0),
(NULL, 24, 'Zeus', 0),
(NULL, 24, 'Both Athena and Zeus', 0),
(NULL, 25, 'Dog Blood', 1),
(NULL, 25, 'Jack &Uuml;', 0),
(NULL, 25, 'What So Not', 0),
(NULL, 25, 'Noisia', 0),
(NULL, 26, 'Junji Ito', 1),
(NULL, 26, 'Kazuo Umezu', 0),
(NULL, 26, 'Shintaro Kago', 0),
(NULL, 26, 'Sui Ishida', 0),
(NULL, 27, '187', 1),
(NULL, 27, '207', 0),
(NULL, 27, '197', 0),
(NULL, 27, '177', 0),
(NULL, 28, '10', 1),
(NULL, 28, '7', 0),
(NULL, 28, '9', 0),
(NULL, 28, '12', 0),
(NULL, 29, 'Operation Downfall', 1),
(NULL, 29, 'Operation Boarding Party', 0),
(NULL, 29, 'Operation Ironclad', 0),
(NULL, 29, 'Operation Aflame', 0),
(NULL, 30, 'Honey Trees', 1),
(NULL, 30, 'Trading with an NPC', 0),
(NULL, 30, 'Grass on Route 209', 0),
(NULL, 30, 'Wayward Cave', 0),
(NULL, 31, 'Kane', 1),
(NULL, 31, 'Joseph Stalin', 0),
(NULL, 31, 'CABAL', 0),
(NULL, 31, 'Yuri', 0),
(NULL, 32, 'Fastball', 1),
(NULL, 32, 'Slowball', 0),
(NULL, 32, 'Screwball', 0),
(NULL, 32, 'Palmball', 0),
(NULL, 33, 'Leicester City', 1),
(NULL, 33, 'Tottenham Hotspur', 0),
(NULL, 33, 'Watford', 0),
(NULL, 33, 'Stoke City', 0),
(NULL, 34, 'Jackie Robinson', 1),
(NULL, 34, 'Curt Flood', 0),
(NULL, 34, 'Roy Campanella', 0),
(NULL, 34, 'Satchell Paige', 0),
(NULL, 35, '7 - 1', 1),
(NULL, 35, '0 - 1', 0),
(NULL, 35, '3 - 4', 0),
(NULL, 35, '16 - 0', 0),
(NULL, 36, 'Michael Schumacher', 1),
(NULL, 36, 'Ayrton Senna', 0),
(NULL, 36, 'Fernando Alonso', 0),
(NULL, 36, 'Jim Clark', 0),
(NULL, 37, '2009', 1),
(NULL, 37, '2010', 0),
(NULL, 37, '2007', 0),
(NULL, 37, '2006', 0),
(NULL, 38, 'Germany', 1),
(NULL, 38, 'Argentina', 0),
(NULL, 38, 'Brazil', 0),
(NULL, 38, 'Netherlands', 0),
(NULL, 39, '2010', 1),
(NULL, 39, '2008', 0),
(NULL, 39, '2009', 0),
(NULL, 39, '2011', 0),
(NULL, 40, 'Liverpool', 1),
(NULL, 40, 'Real Madrid', 0),
(NULL, 40, 'Chelsea', 0),
(NULL, 40, 'Man City', 0),
(NULL, 41, 'Leicester City', 1),
(NULL, 41, 'Northampton Town', 0),
(NULL, 41, 'Bradford City', 0),
(NULL, 41, 'West Bromwich Albion', 0),
(NULL, 42, 'Badminton', 1),
(NULL, 42, 'Table Tennis', 0),
(NULL, 42, 'Rugby', 0),
(NULL, 42, 'Cricket', 0),
(NULL, 43, 'Leicester City', 1),
(NULL, 43, 'Liverpool', 0),
(NULL, 43, 'Cheslea', 0),
(NULL, 43, 'Manchester United', 0),
(NULL, 44, 'Real Madrid C.F.', 1),
(NULL, 44, 'FC Bayern Munich', 0),
(NULL, 44, 'Atletico Madrid', 0),
(NULL, 44, 'Manchester City F.C.', 0),
(NULL, 45, 'Mike Tyson', 1),
(NULL, 45, 'Roy Jones Jr.', 0),
(NULL, 45, 'Evander Holyfield', 0),
(NULL, 45, 'Lennox Lewis', 0),
(NULL, 46, 'Qatar', 1),
(NULL, 46, 'USA', 0),
(NULL, 46, 'Japan', 0),
(NULL, 46, 'Switzerland', 0),
(NULL, 47, 'Montreal Canadians', 1),
(NULL, 47, 'Chicago Blackhawks', 0),
(NULL, 47, 'Toronto Maple Leafs', 0),
(NULL, 47, 'Detroit Red Wings', 0),
(NULL, 48, '4', 1),
(NULL, 48, '1', 0),
(NULL, 48, '2', 0),
(NULL, 48, '3', 0),
(NULL, 49, 'West Germany', 1),
(NULL, 49, 'Soviet Union', 0),
(NULL, 49, 'Portugal', 0),
(NULL, 49, 'Brazil', 0),
(NULL, 50, 'Don Cherry', 1),
(NULL, 50, 'Don McKellar', 0),
(NULL, 50, 'Don Taylor ', 0),
(NULL, 50, 'Donald Sutherland', 0),
(NULL, 51, '1872', 1),
(NULL, 51, '1880', 0),
(NULL, 51, '1863', 0),
(NULL, 51, '1865', 0),
(NULL, 52, 'Indominus Rex', 1),
(NULL, 52, 'Mosasaurus', 0),
(NULL, 52, 'Pteranodon', 0),
(NULL, 52, 'Tyrannosaurus Rex ', 0),
(NULL, 53, 'Fay Wray', 1),
(NULL, 53, 'Jean Harlow', 0),
(NULL, 53, 'Vivien Leigh', 0),
(NULL, 53, 'Mae West', 0),
(NULL, 54, 'Tommy Lee Jones', 1),
(NULL, 54, 'Harrison Ford', 0),
(NULL, 54, 'Harvey Keitel', 0),
(NULL, 54, 'Martin Landau', 0),
(NULL, 55, 'Uma Thurman', 1),
(NULL, 55, 'Kathy Griffin', 0),
(NULL, 55, 'Pam Grier', 0),
(NULL, 55, 'Bridget Fonda', 0),
(NULL, 56, 'Wilson', 1),
(NULL, 56, 'Carson', 0),
(NULL, 56, 'Jackson', 0),
(NULL, 56, 'Willy', 0),
(NULL, 57, 'November 5th', 1),
(NULL, 57, 'November 6th', 0),
(NULL, 57, 'November 4th', 0),
(NULL, 57, 'September 5th', 0),
(NULL, 58, 'Milla Jovovich', 1),
(NULL, 58, 'Madison Derpe', 0),
(NULL, 58, 'Milla Johnson', 0),
(NULL, 58, 'Kim Demp', 0),
(NULL, 59, 'Dirty Dancing', 1),
(NULL, 59, 'Three Men and a Baby', 0),
(NULL, 59, 'Ferris Bueller&#039;s Day Off', 0),
(NULL, 59, 'Pretty in Pink', 0),
(NULL, 60, 'Apollo 13', 1),
(NULL, 60, 'The Right Stuff', 0),
(NULL, 60, 'Capricorn One', 0),
(NULL, 60, 'Marooned', 0),
(NULL, 61, 'Alejandro G. I&ntilde;&aacute;rritu', 1),
(NULL, 61, 'Christopher Nolan', 0),
(NULL, 61, 'David Fincher', 0),
(NULL, 61, 'Wes Anderson', 0),
(NULL, 62, 'Air', 1),
(NULL, 62, 'The Schwartz', 0),
(NULL, 62, 'Princess Lonestar', 0),
(NULL, 62, 'Meatballs', 0),
(NULL, 63, 'Steven Spielberg', 1),
(NULL, 63, 'Stanley Kubrick', 0),
(NULL, 63, 'James Cameron', 0),
(NULL, 63, 'Tim Burton', 0),
(NULL, 64, 'Casablanca', 1),
(NULL, 64, 'The Maltese Falcon', 0),
(NULL, 64, 'The Treasure of the Sierra Madre', 0),
(NULL, 64, 'Citizen Kane', 0),
(NULL, 65, 'Gordon Shumway', 1),
(NULL, 65, 'Gordon Milipp', 0),
(NULL, 65, 'Gordon Foster', 0),
(NULL, 65, 'Gordon von Gam', 0),
(NULL, 66, 'Bruce Lee', 1),
(NULL, 66, 'Jackie Chan', 0),
(NULL, 66, 'Jet Li', 0),
(NULL, 66, ' Yun-Fat Chow', 0),
(NULL, 67, 'Camp Crystal Lake', 1),
(NULL, 67, 'Packanack', 0),
(NULL, 67, 'Higgins Haven', 0),
(NULL, 67, 'Camp Forest Green', 0),
(NULL, 68, 'Gladiator', 1),
(NULL, 68, 'Independence Day', 0),
(NULL, 68, 'The Rock', 0),
(NULL, 68, 'Mission: Impossible', 0),
(NULL, 69, 'Batman v Superman: Dawn of Justice', 1),
(NULL, 69, 'Batman v Superman: Superapocalypse', 0),
(NULL, 69, 'Batman v Superman: Black of Knight', 0),
(NULL, 69, 'Batman v Superman: Knightfall', 0),
(NULL, 70, 'Anguirus', 1),
(NULL, 70, 'King Kong', 0),
(NULL, 70, 'Mothra', 0),
(NULL, 70, 'King Ghidora', 0),
(NULL, 71, 'Dysentery', 1),
(NULL, 71, 'Anemia', 0),
(NULL, 71, 'Constipation', 0),
(NULL, 71, 'Acid Reflux ', 0),
(NULL, 72, 'The Hateful Eight', 1),
(NULL, 72, 'Tron: Legacy', 0),
(NULL, 72, 'The Giver', 0),
(NULL, 72, 'True Grit', 0),
(NULL, 73, 'Ewan McGregor', 1),
(NULL, 73, 'Alec Guinness', 0),
(NULL, 73, 'Hayden Christensen', 0),
(NULL, 73, 'Liam Neeson', 0),
(NULL, 74, 'Ming Tea', 1),
(NULL, 74, 'Cough Fi', 0),
(NULL, 74, 'Spear Mint', 0),
(NULL, 74, 'Mister E', 0),
(NULL, 75, 'Highlander', 1),
(NULL, 75, 'Flash Gordon', 0),
(NULL, 75, 'Labyrinth', 0),
(NULL, 75, 'Howard the Duck', 0),
(NULL, 76, 'Vanessa Kensington', 1),
(NULL, 76, 'Pam Bouvier', 0),
(NULL, 76, 'Mary Goodnight', 0),
(NULL, 76, 'Wai Lin', 0),
(NULL, 77, 'Kurt Russell', 1),
(NULL, 77, 'Patrick Swayze', 0),
(NULL, 77, 'John Cusack', 0),
(NULL, 77, 'Harrison Ford', 0),
(NULL, 78, 'Wilson', 1),
(NULL, 78, 'Friday', 0),
(NULL, 78, 'Jones', 0),
(NULL, 78, 'Billy', 0),
(NULL, 79, 'Oliver Stone', 1),
(NULL, 79, 'Francis Ford Coppola', 0),
(NULL, 79, 'Stanley Kubrick', 0),
(NULL, 79, 'Michael Cimino', 0),
(NULL, 80, 'My Neighbor Totoro', 1),
(NULL, 80, 'Hop', 0),
(NULL, 80, 'Rise of the Guardians', 0),
(NULL, 80, 'Alice in Wonderland', 0),
(NULL, 81, 'Vincent Vega', 1),
(NULL, 81, 'Jules Winnfield', 0),
(NULL, 81, 'Jimmie Dimmick', 0),
(NULL, 81, 'Butch Coolidge', 0),
(NULL, 82, 'Fight Club', 1),
(NULL, 82, 'The Island', 0),
(NULL, 82, 'Unthinkable', 0),
(NULL, 82, 'American Pie', 0),
(NULL, 83, 'Jack Black', 1),
(NULL, 83, 'Mirana Jonnes', 0),
(NULL, 83, 'McConahey Ramses', 0),
(NULL, 83, 'Jim Petersson', 0);

-- --------------------------------------------------------

--
-- Structure de la table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `difficulty` varchar(50) NOT NULL,
  `category` varchar(100) NOT NULL,
  `question` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `questions`
--

INSERT INTO `questions` (`id`, `type`, `difficulty`, `category`, `question`) VALUES
(1, 'multiple', 'medium', 'Entertainment: Music', 'Which iconic album cover features the pulsar waves of CP 1919 placed in the center of the cover?'),
(2, 'multiple', 'hard', 'Entertainment: Music', 'What song originally performed by The Bee Gees in 1978 had a cover version by Steps 20 years later?'),
(3, 'boolean', 'medium', 'Entertainment: Video Games', 'In &quot;Starbound&quot;, the track played by the Decorated Music Box is named &quot;Atlas&quot;.'),
(4, 'multiple', 'easy', 'Entertainment: Japanese Anime &amp; Manga', 'Satella in &quot;Re:Zero&quot; is the witch of what?'),
(5, 'multiple', 'easy', 'Entertainment: Video Games', 'In what year was the first &quot;Mass Effect&quot; game released?'),
(6, 'multiple', 'medium', 'Entertainment: Video Games', 'In the Half-Life universe, the Black Mesa Research Facility is located in which US state?'),
(7, 'multiple', 'medium', 'History', 'Which of the following is not in the Indo-European language family?'),
(8, 'multiple', 'medium', 'Entertainment: Film', 'Which actor plays the role of the main antagonist in the 2011 movie &quot;Tower Heist?&quot;'),
(9, 'multiple', 'medium', 'Entertainment: Video Games', 'In Fallout 4, which type of power armor is first encountered in the early mission &quot;When Freedom Calls&quot; in a crashed Vertibird?'),
(10, 'multiple', 'hard', 'Entertainment: Music', 'Which of the following is NOT a real song from the band Thousand Foot Krutch?'),
(11, 'multiple', 'medium', 'Entertainment: Video Games', 'In the game Pok&eacute;mon Conquest, how many kingdoms make up the region of Ransei?'),
(12, 'boolean', 'medium', 'Vehicles', 'Arriva is owned by the Deutsche Bahn.'),
(13, 'multiple', 'hard', 'Entertainment: Books', 'Which fictional English county was the setting for Thomas Hardy&#039;s novels?'),
(14, 'multiple', 'medium', 'Geography', 'What is the capital of Slovakia?'),
(15, 'multiple', 'hard', 'Entertainment: Music', 'Which lyric is about Red Hot Chili Peppers frontman Anthony Kiedis?'),
(16, 'boolean', 'medium', 'General Knowledge', 'The French word for &quot;glass&quot; is &quot;glace&quot;.'),
(17, 'multiple', 'easy', 'Entertainment: Video Games', 'In Divinity: Original Sin II, what is the name of the skeletal origin character?'),
(18, 'multiple', 'medium', 'Science &amp; Nature', 'The medical condition osteoporosis affects which part of the body?'),
(19, 'multiple', 'medium', 'Entertainment: Japanese Anime &amp; Manga', 'In the series JoJo&#039;s Bizarre Adventure, which main character makes the greatest number of recurring appearances?'),
(20, 'multiple', 'hard', 'Entertainment: Video Games', '&quot;Strangereal&quot; is a fictitious Earth-like world for which game series?'),
(21, 'multiple', 'medium', 'History', 'Which of the following battles is often considered as marking the beginning of the fall of the Western Roman Empire?'),
(22, 'multiple', 'hard', 'Entertainment: Japanese Anime &amp; Manga', 'In &quot;One Piece&quot;, who confirms the existence of the legendary treasure, One Piece?'),
(23, 'multiple', 'hard', 'Entertainment: Board Games', 'What Magic: The Gathering card&#039;s flavor text is just &#039;Ribbit.&#039;?'),
(24, 'multiple', 'hard', 'History', 'The pantheon in Rome was used to worship what god?'),
(25, 'multiple', 'hard', 'Entertainment: Music', 'Electronic artists Boys Noize and Skrillex have collaborated and released tracks under what name?'),
(26, 'multiple', 'hard', 'Entertainment: Japanese Anime &amp; Manga', 'Who is the horror manga artist who made Uzumaki?'),
(27, 'multiple', 'hard', 'Entertainment: Board Games', 'What is the sum of all the tiles in a standard box of Scrabble?'),
(28, 'multiple', 'medium', 'Entertainment: Music', 'How many studio albums have the heavy metal band, &#039;Metallica&#039; released in the period between 1983 and 2016?'),
(29, 'multiple', 'medium', 'History', 'What was the name of the planned invasion of Japan towards the end of World War II?'),
(30, 'multiple', 'medium', 'Entertainment: Video Games', 'In Pokemon Diamond, Pearl and Platinum, where can a Munchlax be found?'),
(31, 'multiple', 'easy', 'Entertainment: Video Games', 'Who is the leader of the Brotherhood of Nod in the Command and Conquer series?'),
(32, 'multiple', 'easy', 'Sports', 'What is the most common type of pitch thrown by pitchers in baseball?'),
(33, 'multiple', 'easy', 'Sports', 'Who won the premier league title in the 2015-2016 season following a fairy tale run?'),
(34, 'multiple', 'easy', 'Sports', 'Which African American is in part responsible for integrating  Major League baseball?'),
(35, 'multiple', 'easy', 'Sports', 'What was the final score of the Germany vs. Brazil 2014 FIFA World Cup match?'),
(36, 'multiple', 'easy', 'Sports', 'Which driver has been the Formula 1 world champion for a record 7 times?'),
(37, 'multiple', 'easy', 'Sports', 'Which year did Jenson Button won his first ever Formula One World Drivers&#039; Championship?'),
(38, 'multiple', 'easy', 'Sports', 'Which team won 2014 FIFA World Cup in Brazil?'),
(39, 'multiple', 'easy', 'Sports', 'What year did the New Orleans Saints win the Super Bowl?'),
(40, 'multiple', 'easy', 'Sports', 'Who did Steven Gerrard win the Champions League with?'),
(41, 'multiple', 'easy', 'Sports', 'Which English football club has the nickname &#039;The Foxes&#039;?'),
(42, 'multiple', 'easy', 'Sports', 'In what sport is a &quot;shuttlecock&quot; used?'),
(43, 'multiple', 'easy', 'Sports', 'Which team won the 2015-16 English Premier League?'),
(44, 'multiple', 'easy', 'Sports', 'Who won the UEFA Champions League in 2016?'),
(45, 'multiple', 'easy', 'Sports', 'Which boxer was banned for taking a bite out of Evander Holyfield&#039;s ear in 1997?'),
(46, 'multiple', 'easy', 'Sports', 'Which country will host the 2022 FIFA World Cup?'),
(47, 'multiple', 'easy', 'Sports', 'Which team has won the most Stanley Cups in the NHL?'),
(48, 'multiple', 'easy', 'Sports', 'In Baseball, how many times does the ball have to be pitched outside of the strike zone before the batter is walked?'),
(49, 'multiple', 'easy', 'Sports', 'What team did England beat to win in the 1966 World Cup final?'),
(50, 'multiple', 'easy', 'Sports', 'This Canadian television sportscaster is known for his &quot;Hockey Night in Canada&quot; role, a commentary show during hockey games.'),
(51, 'multiple', 'easy', 'Sports', 'When was the first official international game played?'),
(52, 'multiple', 'easy', 'Entertainment: Film', 'In &quot;Jurassic World&quot;, what is the name of the dinosaur that is a genetic hybrid?'),
(53, 'multiple', 'easy', 'Entertainment: Film', 'Who played the female lead in the 1933 film &quot;King Kong&quot;?'),
(54, 'multiple', 'easy', 'Entertainment: Film', 'Who played Deputy Marshal Samuel Gerard in the 1993 film &quot;The Fugitive&quot;?'),
(55, 'multiple', 'easy', 'Entertainment: Film', 'Which actress danced the twist with John Travolta in &#039;Pulp Fiction&#039;?'),
(56, 'multiple', 'easy', 'Entertainment: Film', 'In the movie &quot;Cast Away&quot; the main protagonist&#039;s best friend while on the island is named'),
(57, 'multiple', 'easy', 'Entertainment: Film', 'In the movie &quot;V for Vendetta,&quot; what is the date that masked vigilante &quot;V&quot; urges people to remember?'),
(58, 'multiple', 'easy', 'Entertainment: Film', 'Who plays Alice in the Resident Evil movies?'),
(59, 'multiple', 'easy', 'Entertainment: Film', 'This movie contains the quote, &quot;Nobody puts Baby in a corner.&quot;'),
(60, 'multiple', 'easy', 'Entertainment: Film', 'This movie contains the quote, &quot;Houston, we have a problem.&quot;'),
(61, 'multiple', 'easy', 'Entertainment: Film', 'Who directed the 2015 movie &quot;The Revenant&quot;?'),
(62, 'multiple', 'easy', 'Entertainment: Film', 'In the movie &quot;Spaceballs&quot;, what are the Spaceballs attempting to steal from Planet Druidia?'),
(63, 'multiple', 'easy', 'Entertainment: Film', 'Who directed &quot;E.T. the Extra-Terrestrial&quot; (1982)?'),
(64, 'multiple', 'easy', 'Entertainment: Film', 'In which film does Humphrey Bogart say the famous line, &quot;Here&#039;s looking at you, kid&quot;?'),
(65, 'multiple', 'easy', 'Entertainment: Film', 'In &quot;ALF&quot;, what was ALF&#039;s real name?'),
(66, 'multiple', 'easy', 'Entertainment: Film', 'Who starred in the film 1973 movie &quot;Enter The Dragon&quot;?'),
(67, 'multiple', 'easy', 'Entertainment: Film', 'Where does the original Friday The 13th movie take place?'),
(68, 'multiple', 'easy', 'Entertainment: Film', 'Which of these Movies was NOT released in 1996?'),
(69, 'multiple', 'easy', 'Entertainment: Film', 'Which movie released in 2016 features Superman and Batman fighting?'),
(70, 'multiple', 'easy', 'Entertainment: Film', 'What was the first monster to appear alongside Godzilla?'),
(71, 'multiple', 'easy', 'Entertainment: Film', 'For the film &quot;Raiders of The Lost Ark&quot;, what was Harrison Ford sick with during the filming of the Cairo chase?'),
(72, 'multiple', 'easy', 'Entertainment: Film', 'Which of these movies did Jeff Bridges not star in?'),
(73, 'multiple', 'easy', 'Entertainment: Film', 'Which actor plays Obi-Wan Kenobi in Star Wars Episodes I-lll?'),
(74, 'multiple', 'easy', 'Entertainment: Film', 'What is the name of the fictional retro-mod band starring Austin Powers as the lead vocalist?'),
(75, 'multiple', 'easy', 'Entertainment: Film', 'The Queen song `A Kind Of Magic` is featured in which 1986 film?'),
(76, 'multiple', 'easy', 'Entertainment: Film', 'Which of the following is not the name of a &quot;Bond Girl&quot;? '),
(77, 'multiple', 'easy', 'Entertainment: Film', 'Who plays Jack Burton in the movie &quot;Big Trouble in Little China?&quot;'),
(78, 'multiple', 'easy', 'Entertainment: Film', 'What name did Tom Hanks give to his volleyball companion in the film `Cast Away`?'),
(79, 'multiple', 'easy', 'Entertainment: Film', 'Who wrote and directed the 1986 film &#039;Platoon&#039;?'),
(80, 'multiple', 'easy', 'Entertainment: Film', 'Which movie includes a giant bunny-like spirit who has magic powers including growing trees?'),
(81, 'multiple', 'easy', 'Entertainment: Film', 'Who in Pulp Fiction says &quot;No, they got the metric system there, they wouldn&#039;t know what the f*** a Quarter Pounder is.&quot;'),
(82, 'multiple', 'easy', 'Entertainment: Film', '&quot;The first rule is: you don&#039;t talk about it&quot; is a reference to which movie?'),
(83, 'multiple', 'easy', 'Entertainment: Film', 'Who plays the character of Po in the Kung Fu Panda movies?');

-- --------------------------------------------------------

--
-- Structure de la table `session`
--

CREATE TABLE `session` (
  `Id_session` int(11) NOT NULL,
  `date_debut` date NOT NULL,
  `id_utilisateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `session`
--

INSERT INTO `session` (`Id_session`, `date_debut`, `id_utilisateur`) VALUES
(1, '2024-01-08', 1),
(2, '2024-01-08', 2),
(3, '2024-02-17', 3);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id_utilisateur` int(11) NOT NULL,
  `login` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `score` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id_utilisateur`, `login`, `password`, `score`) VALUES
(1, 'shiv10', '1234', 0),
(2, 'kef10', '1234', 50),
(3, 'jef25', '1234', 26);

--
-- Déclencheurs `utilisateur`
--
DELIMITER $$
CREATE TRIGGER `apres_ajout_utilisateur` AFTER INSERT ON `utilisateur` FOR EACH ROW BEGIN
    INSERT INTO session (id_utilisateur,date_debut) VALUES (NEW.id_utilisateur, NOW());
END
$$
DELIMITER ;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `answers`
--
ALTER TABLE `answers`
  ADD KEY `fk_question_id` (`question_id`);

--
-- Index pour la table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`Id_session`),
  ADD KEY `id_utilisateur` (`id_utilisateur`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id_utilisateur`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT pour la table `session`
--
ALTER TABLE `session`
  MODIFY `Id_session` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id_utilisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `fk_question_id` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`);

--
-- Contraintes pour la table `session`
--
ALTER TABLE `session`
  ADD CONSTRAINT `session_ibfk_1` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
