import 'package:flutter/material.dart';

import '../models/question.dart';
import '../models/quiz_category.dart';

/// All quiz categories available in the app, each with its own set of
/// questions and a fun fact revealed after every answer.
final List<QuizCategory> quizCategories = [
  QuizCategory(
    id: 'general',
    title: 'General Knowledge',
    icon: Icons.lightbulb,
    color: const Color(0xFFF39C12),
    questions: const [
      Question(
        text: 'What is the largest planet in our solar system?',
        options: ['Earth', 'Jupiter', 'Saturn', 'Mars'],
        correctIndex: 1,
        funFact: 'Jupiter is so large that more than 1,300 Earths could fit inside it.',
      ),
      Question(
        text: 'How many continents are there on Earth?',
        options: ['5', '6', '7', '8'],
        correctIndex: 2,
        funFact: 'Some geographers count only 5 or 6 continents by merging Europe/Asia or the Americas.',
      ),
      Question(
        text: 'What is the chemical symbol for gold?',
        options: ['Au', 'Ag', 'Gd', 'Go'],
        correctIndex: 0,
        funFact: '"Au" comes from the Latin word "aurum," meaning shining dawn.',
      ),
      Question(
        text: 'Which language has the most native speakers worldwide?',
        options: ['English', 'Hindi', 'Spanish', 'Mandarin Chinese'],
        correctIndex: 3,
        funFact: 'Mandarin has over 900 million native speakers, more than any other language.',
      ),
      Question(
        text: 'What is the smallest prime number?',
        options: ['0', '1', '2', '3'],
        correctIndex: 2,
        funFact: '2 is the only even prime number — every other even number is divisible by 2.',
      ),
      Question(
        text: 'Which organ in the human body is the largest?',
        options: ['Liver', 'Skin', 'Brain', 'Lungs'],
        correctIndex: 1,
        funFact: 'The skin makes up about 16% of a person\'s total body weight.',
      ),
      Question(
        text: 'How many colors are there in a rainbow?',
        options: ['5', '6', '7', '8'],
        correctIndex: 2,
        funFact: 'Isaac Newton divided the spectrum into 7 colors to match the 7 notes of a musical scale.',
      ),
      Question(
        text: 'What does "www" stand for in a website address?',
        options: ['World Wide Web', 'World Wide Wire', 'Web Wide World', 'Wide World Web'],
        correctIndex: 0,
        funFact: 'The World Wide Web was invented by Tim Berners-Lee in 1989.',
      ),
    ],
  ),
  QuizCategory(
    id: 'science',
    title: 'Science',
    icon: Icons.science,
    color: const Color(0xFF00B894),
    questions: const [
      Question(
        text: 'What planet is known as the Red Planet?',
        options: ['Venus', 'Mars', 'Jupiter', 'Mercury'],
        correctIndex: 1,
        funFact: 'Mars appears red because of iron oxide (rust) covering its surface.',
      ),
      Question(
        text: 'What gas do plants absorb from the atmosphere for photosynthesis?',
        options: ['Oxygen', 'Nitrogen', 'Carbon Dioxide', 'Hydrogen'],
        correctIndex: 2,
        funFact: 'Plants release oxygen as a byproduct of photosynthesis, essential for most life on Earth.',
      ),
      Question(
        text: 'What is the powerhouse of the cell?',
        options: ['Nucleus', 'Ribosome', 'Mitochondria', 'Golgi apparatus'],
        correctIndex: 2,
        funFact: 'Mitochondria have their own DNA, separate from the cell\'s nucleus.',
      ),
      Question(
        text: 'What is the boiling point of water at sea level in Celsius?',
        options: ['90°C', '100°C', '110°C', '120°C'],
        correctIndex: 1,
        funFact: 'At high altitudes, water boils at a lower temperature due to reduced air pressure.',
      ),
      Question(
        text: 'Which element has the atomic number 1?',
        options: ['Helium', 'Hydrogen', 'Oxygen', 'Carbon'],
        correctIndex: 1,
        funFact: 'Hydrogen is the most abundant element in the universe, about 75% of its mass.',
      ),
      Question(
        text: 'What force keeps planets in orbit around the sun?',
        options: ['Magnetism', 'Friction', 'Gravity', 'Inertia'],
        correctIndex: 2,
        funFact: 'Gravity\'s strength depends on both the mass of objects and the distance between them.',
      ),
      Question(
        text: 'How many bones are in the adult human body?',
        options: ['186', '206', '226', '246'],
        correctIndex: 1,
        funFact: 'Babies are born with about 300 bones, many of which fuse together as they grow.',
      ),
      Question(
        text: 'What is the approximate speed of light in a vacuum?',
        options: ['300,000 km/s', '150,000 km/s', '3,000 km/s', '30,000 km/s'],
        correctIndex: 0,
        funFact: 'Light from the Sun takes about 8 minutes to reach Earth.',
      ),
    ],
  ),
  QuizCategory(
    id: 'history',
    title: 'History',
    icon: Icons.account_balance,
    color: const Color(0xFFA0522D),
    questions: const [
      Question(
        text: 'In which year did World War II end?',
        options: ['1943', '1945', '1947', '1950'],
        correctIndex: 1,
        funFact: 'WWII ended with Japan\'s surrender on September 2, 1945.',
      ),
      Question(
        text: 'Who was the first President of the United States?',
        options: ['Thomas Jefferson', 'John Adams', 'George Washington', 'Abraham Lincoln'],
        correctIndex: 2,
        funFact: 'Washington chose to step down after two terms, setting a democratic precedent.',
      ),
      Question(
        text: 'Which ancient civilization built the pyramids of Giza?',
        options: ['Romans', 'Greeks', 'Egyptians', 'Mayans'],
        correctIndex: 2,
        funFact: 'The Great Pyramid was the tallest man-made structure for over 3,800 years.',
      ),
      Question(
        text: 'The Berlin Wall fell in which year?',
        options: ['1985', '1987', '1989', '1991'],
        correctIndex: 2,
        funFact: 'The fall of the Berlin Wall paved the way for German reunification in 1990.',
      ),
      Question(
        text: 'Who painted the Mona Lisa?',
        options: ['Michelangelo', 'Leonardo da Vinci', 'Raphael', 'Donatello'],
        correctIndex: 1,
        funFact: 'The Mona Lisa has no visible eyebrows, a stylistic trend of the era.',
      ),
      Question(
        text: 'Which empire was ruled by Julius Caesar?',
        options: ['Greek Empire', 'Roman Empire', 'Persian Empire', 'Ottoman Empire'],
        correctIndex: 1,
        funFact: 'Julius Caesar was assassinated on the Ides of March (March 15), 44 BC.',
      ),
      Question(
        text: 'The Titanic sank in which year?',
        options: ['1905', '1912', '1918', '1923'],
        correctIndex: 1,
        funFact: 'The Titanic was called "unsinkable" before its tragic maiden voyage.',
      ),
      Question(
        text: 'Which country gifted the Statue of Liberty to the USA?',
        options: ['England', 'France', 'Spain', 'Italy'],
        correctIndex: 1,
        funFact: 'The statue symbolized friendship between France and the USA after the American Revolution.',
      ),
    ],
  ),
  QuizCategory(
    id: 'geography',
    title: 'Geography',
    icon: Icons.public,
    color: const Color(0xFF16A085),
    questions: const [
      Question(
        text: 'What is the longest river in the world?',
        options: ['Amazon', 'Nile', 'Yangtze', 'Mississippi'],
        correctIndex: 1,
        funFact: 'The Nile flows through 11 countries in northeastern Africa.',
      ),
      Question(
        text: 'Which is the smallest country in the world?',
        options: ['Monaco', 'San Marino', 'Vatican City', 'Liechtenstein'],
        correctIndex: 2,
        funFact: 'Vatican City covers just 0.49 square kilometers.',
      ),
      Question(
        text: 'Mount Everest is located in which mountain range?',
        options: ['Andes', 'Alps', 'Himalayas', 'Rockies'],
        correctIndex: 2,
        funFact: 'Mount Everest grows about 4 mm taller every year due to tectonic activity.',
      ),
      Question(
        text: 'Which desert is the largest in the world?',
        options: ['Sahara', 'Gobi', 'Antarctic', 'Arabian'],
        correctIndex: 2,
        funFact: 'Deserts are defined by low precipitation, not just heat — Antarctica is technically the largest desert on Earth.',
      ),
      Question(
        text: 'What is the capital of Australia?',
        options: ['Sydney', 'Melbourne', 'Canberra', 'Perth'],
        correctIndex: 2,
        funFact: 'Canberra was purpose-built as a compromise capital between rivals Sydney and Melbourne.',
      ),
      Question(
        text: 'Which ocean is the largest?',
        options: ['Atlantic', 'Indian', 'Arctic', 'Pacific'],
        correctIndex: 3,
        funFact: 'The Pacific Ocean covers about one-third of the Earth\'s surface.',
      ),
      Question(
        text: 'Which country has the most time zones?',
        options: ['Russia', 'USA', 'China', 'France'],
        correctIndex: 3,
        funFact: 'Thanks to its overseas territories, France spans 12 time zones.',
      ),
      Question(
        text: 'What is the driest place on Earth?',
        options: ['Sahara Desert', 'Atacama Desert', 'Death Valley', 'Gobi Desert'],
        correctIndex: 1,
        funFact: 'Parts of the Atacama Desert have never recorded a drop of rainfall.',
      ),
    ],
  ),
  QuizCategory(
    id: 'movies',
    title: 'Movies & TV',
    icon: Icons.movie,
    color: const Color(0xFF8E44AD),
    questions: const [
      Question(
        text: 'Which movie won the first Academy Award for Best Picture?',
        options: ['Wings', 'Gone with the Wind', 'Casablanca', 'It Happened One Night'],
        correctIndex: 0,
        funFact: 'Wings won Best Picture at the very first Academy Awards ceremony in 1929.',
      ),
      Question(
        text: 'Who directed the movie "Jaws"?',
        options: ['George Lucas', 'Steven Spielberg', 'James Cameron', 'Martin Scorsese'],
        correctIndex: 1,
        funFact: 'Jaws (1975) is considered the first modern summer blockbuster.',
      ),
      Question(
        text: 'In "The Lord of the Rings," what is the name of Frodo\'s home?',
        options: ['Rivendell', 'The Shire', 'Gondor', 'Rohan'],
        correctIndex: 1,
        funFact: 'The Shire was inspired by the English countryside where Tolkien grew up.',
      ),
      Question(
        text: 'Which fictional company does "The Office" (US) take place in?',
        options: ['Dunder Mifflin', 'Prestige Worldwide', 'Wayne Enterprises', 'Stark Industries'],
        correctIndex: 0,
        funFact: 'Dunder Mifflin is a fictional paper company based in Scranton, Pennsylvania.',
      ),
      Question(
        text: 'Who played Iron Man in the Marvel Cinematic Universe?',
        options: ['Chris Evans', 'Chris Hemsworth', 'Robert Downey Jr.', 'Mark Ruffalo'],
        correctIndex: 2,
        funFact: 'Iron Man (2008) launched the entire Marvel Cinematic Universe.',
      ),
      Question(
        text: 'What is the highest-grossing film of all time (unadjusted for inflation)?',
        options: ['Titanic', 'Avatar', 'Avengers: Endgame', 'Star Wars'],
        correctIndex: 1,
        funFact: 'Avatar reclaimed the top spot after a 2021 re-release in China.',
      ),
      Question(
        text: 'Which animation studio created "Toy Story"?',
        options: ['DreamWorks', 'Illumination', 'Pixar', 'Studio Ghibli'],
        correctIndex: 2,
        funFact: 'Toy Story (1995) was the first fully computer-animated feature film.',
      ),
      Question(
        text: 'In "Breaking Bad," what is Walter White\'s profession at the start of the show?',
        options: ['Doctor', 'Chemistry Teacher', 'Lawyer', 'Engineer'],
        correctIndex: 1,
        funFact: 'The show\'s title is Southern US slang for raising hell or going off the rails.',
      ),
    ],
  ),
  QuizCategory(
    id: 'sports',
    title: 'Sports',
    icon: Icons.sports_soccer,
    color: const Color(0xFF2980B9),
    questions: const [
      Question(
        text: 'How often are the Summer Olympic Games held?',
        options: ['Every 2 years', 'Every 3 years', 'Every 4 years', 'Every 5 years'],
        correctIndex: 2,
        funFact: 'The 2020 Olympics were postponed to 2021 — the first postponement in peacetime history.',
      ),
      Question(
        text: 'In soccer, how many players are on the field per team (excluding substitutes)?',
        options: ['9', '10', '11', '12'],
        correctIndex: 2,
        funFact: 'A standard soccer match lasts 90 minutes, split into two 45-minute halves.',
      ),
      Question(
        text: 'Which country has won the most FIFA World Cups?',
        options: ['Germany', 'Argentina', 'Brazil', 'Italy'],
        correctIndex: 2,
        funFact: 'Brazil is the only country to have played in every FIFA World Cup tournament.',
      ),
      Question(
        text: 'In basketball, how many points is a standard field goal worth?',
        options: ['1', '2', '3', '4'],
        correctIndex: 1,
        funFact: 'A shot made from beyond the three-point line is worth 3 points instead of 2.',
      ),
      Question(
        text: 'What sport is often called "the king of sports" worldwide?',
        options: ['Basketball', 'Soccer', 'Tennis', 'Cricket'],
        correctIndex: 1,
        funFact: 'Soccer (football) is played and watched by more people worldwide than any other sport.',
      ),
      Question(
        text: 'How many players are on a standard volleyball team on the court?',
        options: ['5', '6', '7', '8'],
        correctIndex: 1,
        funFact: 'Volleyball was invented in 1895 as a less physically intense alternative to basketball.',
      ),
      Question(
        text: 'In tennis, what is a score of zero called?',
        options: ['Zero', 'Love', 'Nil', 'Null'],
        correctIndex: 1,
        funFact: 'The term "love" is believed to derive from the French "l\'oeuf" (egg), shaped like a zero.',
      ),
      Question(
        text: 'Which country hosted the first modern Olympic Games in 1896?',
        options: ['France', 'Greece', 'Italy', 'United Kingdom'],
        correctIndex: 1,
        funFact: 'The 1896 Olympics were held in Athens, honoring the ancient Greek origins of the Games.',
      ),
    ],
  ),
];
