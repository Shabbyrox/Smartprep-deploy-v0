-- Level 1: Quantitative Basics (Easy MCQ)
INSERT INTO quizzes (title, description, role, level, questions) VALUES (
  'Quantitative Basics',
  'Arithmetic, Simplification, Percentages, and Profit & Loss.',
  'General Aptitude',
  1,
  '[
    {"type": "mcq", "question": "What is 15% of 200?", "options": ["20", "25", "30", "35"], "answer": "30"},
    {"type": "mcq", "question": "Simplify: 12 + 8 / 4 * 3", "options": ["15", "18", "6", "20"], "answer": "18"},
    {"type": "mcq", "question": "If a shirt costs $50 and is sold for $60, what is the profit percentage?", "options": ["10%", "20%", "25%", "15%"], "answer": "20%"},
    {"type": "mcq", "question": "What is the square root of 144?", "options": ["10", "11", "12", "13"], "answer": "12"},
    {"type": "mcq", "question": "Convert 0.75 to a fraction.", "options": ["1/2", "2/3", "3/4", "4/5"], "answer": "3/4"},
    {"type": "mcq", "question": "If 20% of a number is 40, what is the number?", "options": ["100", "150", "200", "250"], "answer": "200"},
    {"type": "mcq", "question": "A car travels 60 km in 1 hour. How far does it travel in 3.5 hours?", "options": ["180 km", "200 km", "210 km", "220 km"], "answer": "210 km"},
    {"type": "mcq", "question": "Simplify: (5 + 3) * 2 - 4", "options": ["10", "12", "14", "16"], "answer": "12"},
    {"type": "mcq", "question": "What is the value of pi (approx)?", "options": ["3.12", "3.14", "3.16", "3.18"], "answer": "3.14"},
    {"type": "mcq", "question": "If you buy an item for $80 and sell it for $60, what is the loss percentage?", "options": ["20%", "25%", "30%", "15%"], "answer": "25%"}
  ]'::jsonb
);

-- Level 2: Numerical Ability (Easy MCQ)
INSERT INTO quizzes (title, description, role, level, questions) VALUES (
  'Numerical Ability',
  'Averages, Ratios & Proportions, LCM/HCF, and Simple Interest.',
  'General Aptitude',
  2,
  '[
    {"type": "mcq", "question": "What is the average of 10, 20, 30, 40, 50?", "options": ["25", "30", "35", "40"], "answer": "30"},
    {"type": "mcq", "question": "Find the LCM of 4 and 6.", "options": ["10", "12", "24", "8"], "answer": "12"},
    {"type": "mcq", "question": "If the ratio of A:B is 2:3 and A is 10, what is B?", "options": ["10", "12", "15", "20"], "answer": "15"},
    {"type": "mcq", "question": "Calculate Simple Interest on $1000 at 5% for 2 years.", "options": ["$50", "$100", "$150", "$200"], "answer": "$100"},
    {"type": "mcq", "question": "Find the HCF of 12 and 18.", "options": ["3", "6", "9", "12"], "answer": "6"},
    {"type": "mcq", "question": "Divide 500 in the ratio 3:2.", "options": ["300:200", "250:250", "350:150", "200:300"], "answer": "300:200"},
    {"type": "mcq", "question": "What is the average of the first 5 prime numbers?", "options": ["5.6", "5.8", "6.2", "4.8"], "answer": "5.6"},
    {"type": "mcq", "question": "If P=1000, R=10%, T=3 years, what is the Simple Interest?", "options": ["300", "331", "330", "310"], "answer": "300"},
    {"type": "mcq", "question": "A:B = 3:4, B:C = 8:9. What is A:C?", "options": ["1:2", "3:8", "2:3", "1:3"], "answer": "2:3"},
    {"type": "mcq", "question": "The average of 5 numbers is 20. If one number is removed, the average becomes 15. What was the removed number?", "options": ["30", "35", "40", "45"], "answer": "40"}
  ]'::jsonb
);

-- Level 3: Logical Reasoning I (Hard MCQ)
INSERT INTO quizzes (title, description, role, level, questions) VALUES (
  'Logical Reasoning I',
  'Number Series, Letter Series, Coding-Decoding, and Analogies.',
  'General Aptitude',
  3,
  '[
    {"type": "mcq", "question": "Find the next number: 2, 6, 12, 20, 30, ?", "options": ["40", "42", "44", "46"], "answer": "42"},
    {"type": "mcq", "question": "Complete the series: AZ, CX, EV, GT, ?", "options": ["IR", "HS", "JQ", "KP"], "answer": "IR"},
    {"type": "mcq", "question": "If CAT is coded as 3120, how is DOG coded?", "options": ["4157", "4137", "3157", "4120"], "answer": "4157"},
    {"type": "mcq", "question": "Bird is to Fly as Fish is to ?", "options": ["Water", "Swim", "Gill", "Fin"], "answer": "Swim"},
    {"type": "mcq", "question": "Find the missing number: 1, 4, 9, 16, ?", "options": ["20", "24", "25", "36"], "answer": "25"},
    {"type": "mcq", "question": "If RED is coded as 27, what is BLUE?", "options": ["30", "40", "50", "48"], "answer": "40"},
    {"type": "mcq", "question": "Doctor : Hospital :: Teacher : ?", "options": ["School", "Student", "Class", "Book"], "answer": "School"},
    {"type": "mcq", "question": "Find the next term: 3F, 6G, 11I, 18L, ?", "options": ["25O", "27P", "27Q", "25N"], "answer": "27P"},
    {"type": "mcq", "question": "Which word does not belong? Apple, Banana, Carrot, Grape.", "options": ["Apple", "Banana", "Carrot", "Grape"], "answer": "Carrot"},
    {"type": "mcq", "question": "If A=1, B=2, ..., Z=26, what is the sum of letters in BAD?", "options": ["5", "6", "7", "8"], "answer": "7"}
  ]'::jsonb
);

-- Level 4: Logical Reasoning II (Hard MCQ)
INSERT INTO quizzes (title, description, role, level, questions) VALUES (
  'Logical Reasoning II',
  'Blood Relations, Direction Sense, Seating Arrangements, Calendars/Clocks.',
  'General Aptitude',
  4,
  '[
    {"type": "mcq", "question": "A is the brother of B. B is the sister of C. How is A related to C?", "options": ["Brother", "Sister", "Cousin", "Father"], "answer": "Brother"},
    {"type": "mcq", "question": "A man walks 5 km North, then turns right and walks 3 km. Which direction is he facing now?", "options": ["North", "South", "East", "West"], "answer": "East"},
    {"type": "mcq", "question": "If today is Monday, what day will it be after 61 days?", "options": ["Tuesday", "Wednesday", "Saturday", "Sunday"], "answer": "Saturday"},
    {"type": "mcq", "question": "Pointing to a photo, a man said, ''She is the daughter of my grandfather''s only son.'' Who is she?", "options": ["Sister", "Mother", "Aunt", "Cousin"], "answer": "Sister"},
    {"type": "mcq", "question": "At what time between 3 and 4 o''clock will the hands of a clock coincide?", "options": ["3:15", "3:16 4/11", "3:16", "3:17"], "answer": "3:16 4/11"},
    {"type": "mcq", "question": "Five friends are sitting in a row. A is to the left of B but right of C. D is to the right of B. Who is in the middle?", "options": ["A", "B", "C", "D"], "answer": "B"},
    {"type": "mcq", "question": "If South-East becomes North, North-East becomes West, what will West become?", "options": ["South-East", "North-East", "South-West", "North-West"], "answer": "South-East"},
    {"type": "mcq", "question": "A is B''s sister. C is B''s mother. D is C''s father. How is A related to D?", "options": ["Granddaughter", "Grandson", "Daughter", "Aunt"], "answer": "Granddaughter"},
    {"type": "mcq", "question": "Which year is a leap year?", "options": ["2014", "2018", "2020", "2022"], "answer": "2020"},
    {"type": "mcq", "question": "In a queue, A is 10th from the front and 15th from the back. How many people are there?", "options": ["24", "25", "23", "26"], "answer": "24"}
  ]'::jsonb
);

-- Level 5: Pattern Recognition (Output MCQ)
INSERT INTO quizzes (title, description, role, level, questions) VALUES (
  'Pattern Recognition',
  'What comes next in the sequence? Complex numeric or alpha-numeric patterns.',
  'General Aptitude',
  5,
  '[
    {"type": "mcq", "question": "What comes next? 2, 3, 5, 7, 11, ?", "options": ["12", "13", "14", "15"], "answer": "13"},
    {"type": "mcq", "question": "What comes next? 1, 1, 2, 3, 5, 8, ?", "options": ["11", "12", "13", "14"], "answer": "13"},
    {"type": "mcq", "question": "What comes next? J, F, M, A, M, J, ?", "options": ["J", "A", "S", "O"], "answer": "J"},
    {"type": "mcq", "question": "What comes next? 1, 8, 27, 64, ?", "options": ["100", "121", "125", "144"], "answer": "125"},
    {"type": "mcq", "question": "What comes next? 10, 100, 200, 310, ?", "options": ["400", "410", "420", "430"], "answer": "430"},
    {"type": "mcq", "question": "What comes next? Z, X, V, T, ?", "options": ["R", "S", "Q", "P"], "answer": "R"},
    {"type": "mcq", "question": "What comes next? O, T, T, F, F, S, S, ?", "options": ["E", "N", "T", "S"], "answer": "E"},
    {"type": "mcq", "question": "What comes next? 2, 5, 10, 17, 26, ?", "options": ["35", "36", "37", "38"], "answer": "37"},
    {"type": "mcq", "question": "What comes next? 24, 60, 120, 210, ?", "options": ["300", "336", "343", "350"], "answer": "336"},
    {"type": "mcq", "question": "What comes next? A1, C3, F6, J10, ?", "options": ["O15", "N14", "M13", "P16"], "answer": "O15"}
  ]'::jsonb
);

-- Level 6: Advanced Quant (Hard MCQ)
INSERT INTO quizzes (title, description, role, level, questions) VALUES (
  'Advanced Quant',
  'Probability, Permutations & Combinations, Time Speed & Distance, Work & Time.',
  'General Aptitude',
  6,
  '[
    {"type": "mcq", "question": "What is the probability of getting a head when tossing a coin?", "options": ["1/2", "1/3", "1/4", "1"], "answer": "1/2"},
    {"type": "mcq", "question": "In how many ways can the letters of the word ''CAT'' be arranged?", "options": ["3", "6", "9", "12"], "answer": "6"},
    {"type": "mcq", "question": "A train 100m long is running at 72 km/hr. How long does it take to cross a pole?", "options": ["5s", "10s", "15s", "20s"], "answer": "5s"},
    {"type": "mcq", "question": "A can do a work in 10 days, B in 15 days. Working together, how long will they take?", "options": ["5 days", "6 days", "7 days", "8 days"], "answer": "6 days"},
    {"type": "mcq", "question": "What is the probability of rolling a 7 with two dice?", "options": ["1/6", "1/12", "1/36", "5/36"], "answer": "1/6"},
    {"type": "mcq", "question": "How many ways can a committee of 3 be chosen from 5 people?", "options": ["10", "15", "20", "60"], "answer": "10"},
    {"type": "mcq", "question": "Speed = 60 km/hr. Time = 2.5 hrs. Distance = ?", "options": ["120 km", "140 km", "150 km", "160 km"], "answer": "150 km"},
    {"type": "mcq", "question": "If 5 men can do a job in 10 days, how many days will 10 men take?", "options": ["2", "5", "10", "20"], "answer": "5"},
    {"type": "mcq", "question": "A bag contains 3 red and 5 blue balls. Probability of drawing a red ball?", "options": ["3/5", "3/8", "5/8", "1/3"], "answer": "3/8"},
    {"type": "mcq", "question": "Two trains running in opposite directions cross each other. Their relative speed is?", "options": ["Sum of speeds", "Difference of speeds", "Product of speeds", "Ratio of speeds"], "answer": "Sum of speeds"}
  ]'::jsonb
);

-- Level 7: Error Detection (Error Finding MCQ)
INSERT INTO quizzes (title, description, role, level, questions) VALUES (
  'Error Detection',
  'Find the wrong number in the series or Identify the Odd One Out.',
  'General Aptitude',
  7,
  '[
    {"type": "mcq", "question": "Find the wrong number: 2, 5, 10, 17, 26, 37, 50, 64", "options": ["50", "37", "64", "26"], "answer": "64"},
    {"type": "mcq", "question": "Find the odd one out: 3, 5, 7, 9, 11, 13", "options": ["3", "9", "11", "13"], "answer": "9"},
    {"type": "mcq", "question": "Find the wrong number: 1, 4, 9, 16, 25, 36, 49, 60", "options": ["49", "36", "60", "25"], "answer": "60"},
    {"type": "mcq", "question": "Find the odd one out: Square, Rectangle, Circle, Triangle", "options": ["Square", "Rectangle", "Circle", "Triangle"], "answer": "Circle"},
    {"type": "mcq", "question": "Find the wrong number: 8, 13, 21, 32, 47, 63, 83", "options": ["21", "32", "47", "83"], "answer": "47"},
    {"type": "mcq", "question": "Find the odd one out: January, May, July, November", "options": ["January", "May", "July", "November"], "answer": "November"},
    {"type": "mcq", "question": "Find the wrong number: 1, 2, 6, 15, 31, 56, 91", "options": ["31", "91", "56", "15"], "answer": "91"},
    {"type": "mcq", "question": "Find the odd one out: Copper, Iron, Zinc, Brass", "options": ["Copper", "Iron", "Zinc", "Brass"], "answer": "Brass"},
    {"type": "mcq", "question": "Find the wrong number: 5, 10, 40, 80, 320, 550, 2560", "options": ["80", "320", "550", "2560"], "answer": "550"},
    {"type": "mcq", "question": "Find the odd one out: 144, 169, 196, 210", "options": ["144", "169", "196", "210"], "answer": "210"}
  ]'::jsonb
);

-- Level 8: Critical Thinking (Tricky Output MCQ)
INSERT INTO quizzes (title, description, role, level, questions) VALUES (
  'Critical Thinking',
  'Data Sufficiency, Syllogisms, Statement & Assumptions.',
  'General Aptitude',
  8,
  '[
    {"type": "mcq", "question": "Statement: All men are mortal. Socrates is a man. Conclusion: Socrates is mortal.", "options": ["True", "False", "Uncertain", "None"], "answer": "True"},
    {"type": "mcq", "question": "Is x > 0? I. x + 5 > 5. II. x - 2 < 0.", "options": ["I alone sufficient", "II alone sufficient", "Both needed", "Neither sufficient"], "answer": "I alone sufficient"},
    {"type": "mcq", "question": "Statement: Some cats are dogs. All dogs are birds. Conclusion: Some cats are birds.", "options": ["Follows", "Does not follow", "Uncertain", "None"], "answer": "Follows"},
    {"type": "mcq", "question": "Assumption: ''Buy pure butter from Company X.'' I. No other company supplies pure butter. II. People want pure butter.", "options": ["Only I implicit", "Only II implicit", "Both implicit", "Neither implicit"], "answer": "Only II implicit"},
    {"type": "mcq", "question": "Is y even? I. y is divisible by 2. II. y is divisible by 4.", "options": ["I alone sufficient", "II alone sufficient", "Both needed", "Neither sufficient"], "answer": "I alone sufficient"},
    {"type": "mcq", "question": "Statement: No A is B. Some B are C. Conclusion: Some C are not A.", "options": ["Follows", "Does not follow", "Uncertain", "None"], "answer": "Follows"},
    {"type": "mcq", "question": "Course of Action: A large number of people die every year due to drinking polluted water. I. The government should make adequate arrangements for safe drinking water. II. People should be educated about the dangers of drinking polluted water.", "options": ["Only I follows", "Only II follows", "Both follow", "Neither follows"], "answer": "Both follow"},
    {"type": "mcq", "question": "Is x an integer? I. 3x is an integer. II. x/3 is an integer.", "options": ["I alone sufficient", "II alone sufficient", "Both needed", "Neither sufficient"], "answer": "II alone sufficient"},
    {"type": "mcq", "question": "Statement: All cars are trains. Some trains are buses. Conclusion: Some cars are buses.", "options": ["Follows", "Does not follow", "Uncertain", "None"], "answer": "Does not follow"},
    {"type": "mcq", "question": "Cause: It rained heavily. Effect: The football match was cancelled.", "options": ["Statement I is cause, II is effect", "Statement II is cause, I is effect", "Both are independent causes", "Both are effects of common cause"], "answer": "Statement I is cause, II is effect"}
  ]'::jsonb
);

-- Level 9: Coding Challenge I (Write Code)
INSERT INTO quizzes (title, description, role, level, questions) VALUES (
  'Coding Challenge I',
  'Mathematical Implementation (e.g., Factorial, Fibonacci).',
  'General Aptitude',
  9,
  '[
    {
      "type": "code_challenge",
      "question": "Write a function to calculate the Factorial of N.",
      "starter_code": "function factorial(n) {\n  // Your code here\n}",
      "test_case_description": "Input: 5 -> Output: 120"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to generate the Nth Fibonacci number.",
      "starter_code": "function fibonacci(n) {\n  // Your code here\n}",
      "test_case_description": "Input: 6 -> Output: 8"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to calculate the sum of digits of a number.",
      "starter_code": "function sumDigits(n) {\n  // Your code here\n}",
      "test_case_description": "Input: 123 -> Output: 6"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to find the Greatest Common Divisor (GCD) of two numbers.",
      "starter_code": "function gcd(a, b) {\n  // Your code here\n}",
      "test_case_description": "Input: 12, 18 -> Output: 6"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to check if a number is even or odd.",
      "starter_code": "function isEven(n) {\n  // Your code here\n}",
      "test_case_description": "Input: 4 -> Output: true"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to calculate the power of a number (x^n).",
      "starter_code": "function power(x, n) {\n  // Your code here\n}",
      "test_case_description": "Input: 2, 3 -> Output: 8"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to convert Celsius to Fahrenheit.",
      "starter_code": "function toFahrenheit(c) {\n  // Your code here\n}",
      "test_case_description": "Input: 0 -> Output: 32"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to find the area of a circle given radius.",
      "starter_code": "function areaCircle(r) {\n  // Your code here\n}",
      "test_case_description": "Input: 3 -> Output: ~28.27"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to check if a year is a leap year.",
      "starter_code": "function isLeapYear(year) {\n  // Your code here\n}",
      "test_case_description": "Input: 2020 -> Output: true"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to find the sum of first N natural numbers.",
      "starter_code": "function sumN(n) {\n  // Your code here\n}",
      "test_case_description": "Input: 5 -> Output: 15"
    }
  ]'::jsonb
);

-- Level 10: Coding Challenge II (Write Code)
INSERT INTO quizzes (title, description, role, level, questions) VALUES (
  'Coding Challenge II',
  'Logical Implementation (e.g., Prime, Palindrome).',
  'General Aptitude',
  10,
  '[
    {
      "type": "code_challenge",
      "question": "Write a function to check if a number is Prime.",
      "starter_code": "function isPrime(n) {\n  // Your code here\n}",
      "test_case_description": "Input: 7 -> Output: true"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to check if a number is a Palindrome.",
      "starter_code": "function isPalindrome(n) {\n  // Your code here\n}",
      "test_case_description": "Input: 121 -> Output: true"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to reverse an integer.",
      "starter_code": "function reverseInt(n) {\n  // Your code here\n}",
      "test_case_description": "Input: 123 -> Output: 321"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to check if a number is an Armstrong number.",
      "starter_code": "function isArmstrong(n) {\n  // Your code here\n}",
      "test_case_description": "Input: 153 -> Output: true"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to find the factors of a number.",
      "starter_code": "function getFactors(n) {\n  // Your code here\n}",
      "test_case_description": "Input: 12 -> Output: [1, 2, 3, 4, 6, 12]"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to check if a number is a Perfect Square.",
      "starter_code": "function isPerfectSquare(n) {\n  // Your code here\n}",
      "test_case_description": "Input: 16 -> Output: true"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to swap two numbers without a temporary variable.",
      "starter_code": "function swap(a, b) {\n  // Your code here\n}",
      "test_case_description": "Input: 5, 10 -> Output: 10, 5"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to count the number of set bits in a binary representation.",
      "starter_code": "function countSetBits(n) {\n  // Your code here\n}",
      "test_case_description": "Input: 5 (101) -> Output: 2"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to find the missing number in an array of 1 to N.",
      "starter_code": "function findMissing(arr, n) {\n  // Your code here\n}",
      "test_case_description": "Input: [1, 2, 4], 4 -> Output: 3"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to check if two strings are Anagrams.",
      "starter_code": "function isAnagram(s1, s2) {\n  // Your code here\n}",
      "test_case_description": "Input: \"listen\", \"silent\" -> Output: true"
    }
  ]'::jsonb
);
