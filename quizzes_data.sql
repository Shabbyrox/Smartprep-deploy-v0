-- Level 1: Fundamentals I (Easy MCQ)
INSERT INTO quizzes (title, description, role, level, questions) VALUES (
  'Fundamentals I',
  'Basic Computer Science concepts including Binary, Hex, Data Types, and Boolean Logic.',
  'Software Engineer',
  1,
  '[
    {"type": "mcq", "question": "What is the binary representation of the decimal number 10?", "options": ["1010", "1001", "1100", "1110"], "answer": "1010"},
    {"type": "mcq", "question": "Which of the following is a hexadecimal digit?", "options": ["G", "H", "F", "Z"], "answer": "F"},
    {"type": "mcq", "question": "What is the result of TRUE AND FALSE?", "options": ["TRUE", "FALSE", "NULL", "Undefined"], "answer": "FALSE"},
    {"type": "mcq", "question": "Which data type is best suited for storing a simple True/False value?", "options": ["Integer", "String", "Boolean", "Float"], "answer": "Boolean"},
    {"type": "mcq", "question": "What is 1 byte equal to?", "options": ["4 bits", "8 bits", "16 bits", "32 bits"], "answer": "8 bits"},
    {"type": "mcq", "question": "What is the result of NOT TRUE?", "options": ["TRUE", "FALSE", "NULL", "1"], "answer": "FALSE"},
    {"type": "mcq", "question": "Which number system uses base 16?", "options": ["Binary", "Octal", "Decimal", "Hexadecimal"], "answer": "Hexadecimal"},
    {"type": "mcq", "question": "What is the output of 1 OR 0 in boolean logic?", "options": ["0", "1", "NULL", "False"], "answer": "1"},
    {"type": "mcq", "question": "Which of these is NOT a primitive data type in most languages?", "options": ["Integer", "Float", "Boolean", "Tree"], "answer": "Tree"},
    {"type": "mcq", "question": "What does ASCII stand for?", "options": ["American Standard Code for Information Interchange", "American Scientific Code for Internet Interchange", "Apple Standard Code for Information Interchange", "Advanced Standard Code for Information Interchange"], "answer": "American Standard Code for Information Interchange"}
  ]'::jsonb
);

-- Level 2: Fundamentals II (Easy MCQ)
INSERT INTO quizzes (title, description, role, level, questions) VALUES (
  'Fundamentals II',
  'Basic Data Structures theory: Arrays, Linked Lists, Stacks, and Queues.',
  'Software Engineer',
  2,
  '[
    {"type": "mcq", "question": "Which data structure uses LIFO (Last In First Out) principle?", "options": ["Queue", "Stack", "Array", "Tree"], "answer": "Stack"},
    {"type": "mcq", "question": "What is the time complexity to access an element by index in an Array?", "options": ["O(1)", "O(n)", "O(log n)", "O(n^2)"], "answer": "O(1)"},
    {"type": "mcq", "question": "Which data structure uses FIFO (First In First Out) principle?", "options": ["Stack", "Queue", "Graph", "Heap"], "answer": "Queue"},
    {"type": "mcq", "question": "In a Singly Linked List, each node contains data and a pointer to?", "options": ["Previous node", "Next node", "Root node", "Null only"], "answer": "Next node"},
    {"type": "mcq", "question": "Which operation adds an item to the top of a Stack?", "options": ["Pop", "Push", "Enqueue", "Dequeue"], "answer": "Push"},
    {"type": "mcq", "question": "Which operation removes an item from the front of a Queue?", "options": ["Push", "Pop", "Enqueue", "Dequeue"], "answer": "Dequeue"},
    {"type": "mcq", "question": "What is a disadvantage of an Array compared to a Linked List?", "options": ["Slow access time", "Fixed size", "Complex implementation", "Uses pointers"], "answer": "Fixed size"},
    {"type": "mcq", "question": "In a Doubly Linked List, a node has pointers to?", "options": ["Next node only", "Previous node only", "Both Next and Previous nodes", "None"], "answer": "Both Next and Previous nodes"},
    {"type": "mcq", "question": "What happens when you try to pop from an empty stack?", "options": ["Stack Overflow", "Stack Underflow", "Success", "Memory Leak"], "answer": "Stack Underflow"},
    {"type": "mcq", "question": "Which data structure is best for implementing a browser back button?", "options": ["Queue", "Stack", "Array", "Hash Map"], "answer": "Stack"}
  ]'::jsonb
);

-- Level 3: Advanced Theory I (Hard MCQ)
INSERT INTO quizzes (title, description, role, level, questions) VALUES (
  'Advanced Theory I',
  'Algorithms & Complexity: Big O, Sorting, Searching, and Recursion.',
  'Software Engineer',
  3,
  '[
    {"type": "mcq", "question": "What is the worst-case time complexity of Bubble Sort?", "options": ["O(n)", "O(n log n)", "O(n^2)", "O(1)"], "answer": "O(n^2)"},
    {"type": "mcq", "question": "Binary Search requires the array to be?", "options": ["Sorted", "Unsorted", "Hashed", "Linked"], "answer": "Sorted"},
    {"type": "mcq", "question": "What is the average time complexity of Merge Sort?", "options": ["O(n^2)", "O(n log n)", "O(n)", "O(log n)"], "answer": "O(n log n)"},
    {"type": "mcq", "question": "Which algorithm uses the Divide and Conquer strategy?", "options": ["Bubble Sort", "Insertion Sort", "Merge Sort", "Selection Sort"], "answer": "Merge Sort"},
    {"type": "mcq", "question": "What is the base case in recursion used for?", "options": ["To call the function again", "To terminate the recursion", "To increase complexity", "To sort data"], "answer": "To terminate the recursion"},
    {"type": "mcq", "question": "What is the time complexity of accessing a value in a Hash Map (average case)?", "options": ["O(n)", "O(log n)", "O(1)", "O(n^2)"], "answer": "O(1)"},
    {"type": "mcq", "question": "Which sorting algorithm is generally considered the fastest in practice for random data?", "options": ["Bubble Sort", "Quick Sort", "Insertion Sort", "Selection Sort"], "answer": "Quick Sort"},
    {"type": "mcq", "question": "What does Big O notation describe?", "options": ["Exact execution time", "Upper bound of complexity", "Lower bound of complexity", "Memory usage only"], "answer": "Upper bound of complexity"},
    {"type": "mcq", "question": "Which search algorithm works on unsorted arrays?", "options": ["Binary Search", "Linear Search", "Interpolation Search", "Exponential Search"], "answer": "Linear Search"},
    {"type": "mcq", "question": "What is the space complexity of Merge Sort?", "options": ["O(1)", "O(n)", "O(log n)", "O(n^2)"], "answer": "O(n)"}
  ]'::jsonb
);

-- Level 4: Advanced Theory II (Hard MCQ)
INSERT INTO quizzes (title, description, role, level, questions) VALUES (
  'Advanced Theory II',
  'OOP & Design Patterns: SOLID, Inheritance, Polymorphism, Singleton.',
  'Software Engineer',
  4,
  '[
    {"type": "mcq", "question": "Which OOP principle allows a child class to provide a specific implementation of a method already provided by its parent class?", "options": ["Encapsulation", "Polymorphism", "Abstraction", "Inheritance"], "answer": "Polymorphism"},
    {"type": "mcq", "question": "What does the ''S'' in SOLID stand for?", "options": ["Single Responsibility Principle", "Simple Object Principle", "Static Typing Principle", "Secure Coding Principle"], "answer": "Single Responsibility Principle"},
    {"type": "mcq", "question": "Which design pattern ensures a class has only one instance?", "options": ["Factory", "Observer", "Singleton", "Strategy"], "answer": "Singleton"},
    {"type": "mcq", "question": "Hiding internal details and showing only functionality is known as?", "options": ["Polymorphism", "Inheritance", "Abstraction", "Encapsulation"], "answer": "Abstraction"},
    {"type": "mcq", "question": "Which design pattern defines a one-to-many dependency between objects?", "options": ["Singleton", "Observer", "Adapter", "Decorator"], "answer": "Observer"},
    {"type": "mcq", "question": "What is the main purpose of the Factory Pattern?", "options": ["To ensure one instance", "To create objects without specifying the exact class", "To add functionality dynamically", "To interface incompatible classes"], "answer": "To create objects without specifying the exact class"},
    {"type": "mcq", "question": "Which principle states that software entities should be open for extension but closed for modification?", "options": ["Single Responsibility", "Open/Closed", "Liskov Substitution", "Interface Segregation"], "answer": "Open/Closed"},
    {"type": "mcq", "question": "In Inheritance, what is the relationship between a Child and Parent class?", "options": ["Has-a", "Is-a", "Uses-a", "Was-a"], "answer": "Is-a"},
    {"type": "mcq", "question": "Which concept wraps data and methods into a single unit?", "options": ["Abstraction", "Polymorphism", "Encapsulation", "Inheritance"], "answer": "Encapsulation"},
    {"type": "mcq", "question": "Dependency Injection is a technique to achieve?", "options": ["Tighter coupling", "Inversion of Control", "Multiple Inheritance", "Static Polymorphism"], "answer": "Inversion of Control"}
  ]'::jsonb
);

-- Level 5: Code Prediction I (Code Output MCQ)
INSERT INTO quizzes (title, description, role, level, questions) VALUES (
  'Code Prediction I',
  'Predict the output of code snippets focusing on scope, loops, and references.',
  'Software Engineer',
  5,
  '[
    {"type": "mcq", "question": "What is the output? \n int x = 5; \n if(x = 10) print(x); else print(5);", "options": ["5", "10", "Error", "None"], "answer": "10"},
    {"type": "mcq", "question": "What is the output? \n for(int i=0; i<3; i++) print(i); print(i);", "options": ["0123", "0122", "012 Error", "012"], "answer": "012 Error"},
    {"type": "mcq", "question": "What is the output? \n String a = \"hello\"; \n String b = a; \n a = \"world\"; \n print(b);", "options": ["hello", "world", "null", "error"], "answer": "hello"},
    {"type": "mcq", "question": "What is the output? \n int[] arr = {1, 2}; \n int[] b = arr; \n b[0] = 5; \n print(arr[0]);", "options": ["1", "5", "2", "Error"], "answer": "5"},
    {"type": "mcq", "question": "What is the output? \n int x = 10; \n System.out.println(x++ + ++x);", "options": ["20", "21", "22", "23"], "answer": "22"},
    {"type": "mcq", "question": "What is the output? \n boolean b = false; \n if(b = true) print(\"True\"); else print(\"False\");", "options": ["True", "False", "Error", "None"], "answer": "True"},
    {"type": "mcq", "question": "What is the output? \n int i = 5; \n while(i-- > 0) print(i);", "options": ["54321", "43210", "543210", "4321"], "answer": "43210"},
    {"type": "mcq", "question": "What is the output? \n String s = \"1\" + 2 + 3;", "options": ["6", "123", "15", "Error"], "answer": "123"},
    {"type": "mcq", "question": "What is the output? \n int x = 5; \n { int x = 10; print(x); } \n print(x);", "options": ["10 5", "10 10", "5 5", "Error"], "answer": "Error"},
    {"type": "mcq", "question": "What is the output? \n int x = 0; \n for(int i=0; i<5; i++) x += i; \n print(x);", "options": ["10", "15", "5", "0"], "answer": "10"}
  ]'::jsonb
);

-- Level 6: Systems Theory (Hard MCQ)
INSERT INTO quizzes (title, description, role, level, questions) VALUES (
  'Systems Theory',
  'Operating Systems & Databases concepts including Processes, Threads, SQL, and Normalization.',
  'Software Engineer',
  6,
  '[
    {"type": "mcq", "question": "Which is lightweight: Process or Thread?", "options": ["Process", "Thread", "Both are equal", "Neither"], "answer": "Thread"},
    {"type": "mcq", "question": "What is a Deadlock?", "options": ["Process terminates unexpectedly", "Two processes waiting for each other indefinitely", "Memory leak", "CPU overheating"], "answer": "Two processes waiting for each other indefinitely"},
    {"type": "mcq", "question": "Which SQL constraint uniquely identifies each record in a table?", "options": ["UNIQUE", "PRIMARY KEY", "FOREIGN KEY", "INDEX"], "answer": "PRIMARY KEY"},
    {"type": "mcq", "question": "What does ACID stand for in databases?", "options": ["Atomicity, Consistency, Isolation, Durability", "Accuracy, Consistency, Integrity, Durability", "Atomicity, Concurrency, Isolation, Data", "Access, Control, Input, Delete"], "answer": "Atomicity, Consistency, Isolation, Durability"},
    {"type": "mcq", "question": "Which Normal Form eliminates transitive dependency?", "options": ["1NF", "2NF", "3NF", "BCNF"], "answer": "3NF"},
    {"type": "mcq", "question": "What is Context Switching?", "options": ["Switching between threads/processes by CPU", "Switching variable types", "Switching database connections", "Switching network packets"], "answer": "Switching between threads/processes by CPU"},
    {"type": "mcq", "question": "Which SQL command is used to remove a table structure completely?", "options": ["DELETE", "TRUNCATE", "DROP", "REMOVE"], "answer": "DROP"},
    {"type": "mcq", "question": "What is Virtual Memory?", "options": ["RAM used as Disk", "Disk space used as RAM extension", "Cloud storage", "Cache memory"], "answer": "Disk space used as RAM extension"},
    {"type": "mcq", "question": "Which is a connectionless protocol?", "options": ["TCP", "UDP", "HTTP", "FTP"], "answer": "UDP"},
    {"type": "mcq", "question": "What is the purpose of an Index in a database?", "options": ["To sort data permanently", "To speed up data retrieval", "To secure data", "To compress data"], "answer": "To speed up data retrieval"}
  ]'::jsonb
);

-- Level 7: Debugging (Error Finding MCQ)
INSERT INTO quizzes (title, description, role, level, questions) VALUES (
  'Debugging',
  'Identify syntax, logical, or runtime errors in code snippets.',
  'Software Engineer',
  7,
  '[
    {"type": "mcq", "question": "Identify the error: \n int[] arr = new int[5]; \n arr[5] = 10;", "options": ["Syntax Error", "Array Index Out Of Bounds", "Null Pointer Exception", "No Error"], "answer": "Array Index Out Of Bounds"},
    {"type": "mcq", "question": "Identify the error: \n while(true) { \n   print(\"Hello\"); \n }", "options": ["Syntax Error", "Infinite Loop", "Memory Leak", "Stack Overflow"], "answer": "Infinite Loop"},
    {"type": "mcq", "question": "Identify the error: \n String s = null; \n int len = s.length();", "options": ["Syntax Error", "Null Pointer Exception", "Runtime Error", "Logic Error"], "answer": "Null Pointer Exception"},
    {"type": "mcq", "question": "Identify the error: \n int x = 10 \n print(x);", "options": ["Missing Semicolon", "Undefined Variable", "Type Mismatch", "No Error"], "answer": "Missing Semicolon"},
    {"type": "mcq", "question": "Identify the error: \n int divide(int a, int b) { \n   return a / b; \n } \n divide(10, 0);", "options": ["Syntax Error", "Division by Zero", "Overflow", "Underflow"], "answer": "Division by Zero"},
    {"type": "mcq", "question": "Identify the error: \n if(x = 5) {}", "options": ["Assignment in condition", "Comparison error", "Syntax error", "No error"], "answer": "Assignment in condition"},
    {"type": "mcq", "question": "Identify the error: \n void func() { \n   func(); \n }", "options": ["Infinite Loop", "Stack Overflow", "Syntax Error", "Memory Leak"], "answer": "Stack Overflow"},
    {"type": "mcq", "question": "Identify the error: \n const x = 10; \n x = 20;", "options": ["Reassignment to constant", "Type mismatch", "Syntax error", "Logic error"], "answer": "Reassignment to constant"},
    {"type": "mcq", "question": "Identify the error: \n int x; \n print(x); (in Java)", "options": ["Uninitialized variable", "Null pointer", "Zero value", "No error"], "answer": "Uninitialized variable"},
    {"type": "mcq", "question": "Identify the error: \n for(int i=0; i<10; i--)", "options": ["Infinite Loop", "Syntax Error", "Off by one", "Unreachable code"], "answer": "Infinite Loop"}
  ]'::jsonb
);

-- Level 8: Code Prediction II (Tricky Output MCQ)
INSERT INTO quizzes (title, description, role, level, questions) VALUES (
  'Code Prediction II',
  'Complex logic puzzles, edge cases, and order of operations.',
  'Software Engineer',
  8,
  '[
    {"type": "mcq", "question": "Output? \n System.out.println(10 + 20 + \"30\");", "options": ["102030", "3030", "60", "Error"], "answer": "3030"},
    {"type": "mcq", "question": "Output? \n System.out.println(\"10\" + 20 + 30);", "options": ["102030", "60", "1050", "Error"], "answer": "102030"},
    {"type": "mcq", "question": "Output? \n int x = 5; \n System.out.println(x > 2 ? x < 4 ? 10 : 8 : 7);", "options": ["10", "8", "7", "5"], "answer": "8"},
    {"type": "mcq", "question": "Output? \n int x = 0; \n if(x++ > 0) print(x); else print(x);", "options": ["0", "1", "Error", "None"], "answer": "1"},
    {"type": "mcq", "question": "Output? \n boolean a = true, b = false; \n boolean c = a || b && a; \n print(c);", "options": ["true", "false", "Error", "null"], "answer": "true"},
    {"type": "mcq", "question": "Output? \n int x = 10; \n System.out.println(x >> 1);", "options": ["10", "5", "20", "1"], "answer": "5"},
    {"type": "mcq", "question": "Output? \n int x = -1; \n System.out.println(x >>> 29);", "options": ["-1", "7", "1", "0"], "answer": "7"},
    {"type": "mcq", "question": "Output? \n try { return 1; } finally { return 2; }", "options": ["1", "2", "Error", "Both"], "answer": "2"},
    {"type": "mcq", "question": "Output? \n 0.1 + 0.2 == 0.3 (in JS/Python)", "options": ["true", "false", "Error", "Maybe"], "answer": "false"},
    {"type": "mcq", "question": "Output? \n int[] a = {1}; int[] b = {1}; print(a == b);", "options": ["true", "false", "Error", "1"], "answer": "false"}
  ]'::jsonb
);

-- Level 9: Coding Challenge I (Write Code)
INSERT INTO quizzes (title, description, role, level, questions) VALUES (
  'Coding Challenge I',
  'Basic Algorithms: String manipulation and Array logic.',
  'Software Engineer',
  9,
  '[
    {
      "type": "code_challenge",
      "question": "Write a function to reverse a string.",
      "starter_code": "function reverseString(str) {\n  // Your code here\n}",
      "test_case_description": "Input: \"hello\" -> Output: \"olleh\""
    },
    {
      "type": "code_challenge",
      "question": "Write a function to check if a string is a palindrome.",
      "starter_code": "function isPalindrome(str) {\n  // Your code here\n}",
      "test_case_description": "Input: \"racecar\" -> Output: true"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to calculate the factorial of a number.",
      "starter_code": "function factorial(n) {\n  // Your code here\n}",
      "test_case_description": "Input: 5 -> Output: 120"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to find the maximum number in an array.",
      "starter_code": "function findMax(arr) {\n  // Your code here\n}",
      "test_case_description": "Input: [1, 5, 3, 9, 2] -> Output: 9"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to count the number of vowels in a string.",
      "starter_code": "function countVowels(str) {\n  // Your code here\n}",
      "test_case_description": "Input: \"hello\" -> Output: 2"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to remove duplicates from an array.",
      "starter_code": "function removeDuplicates(arr) {\n  // Your code here\n}",
      "test_case_description": "Input: [1, 2, 2, 3] -> Output: [1, 2, 3]"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to return the sum of all elements in an array.",
      "starter_code": "function sumArray(arr) {\n  // Your code here\n}",
      "test_case_description": "Input: [1, 2, 3] -> Output: 6"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to implement Linear Search.",
      "starter_code": "function linearSearch(arr, target) {\n  // Your code here\n}",
      "test_case_description": "Input: ([1, 2, 3], 2) -> Output: 1 (index)"
    },
    {
      "type": "code_challenge",
      "question": "Write a function that prints numbers 1 to n, but for multiples of 3 print \"Fizz\", for 5 print \"Buzz\", for both \"FizzBuzz\".",
      "starter_code": "function fizzBuzz(n) {\n  // Your code here\n}",
      "test_case_description": "Input: 15 -> Output: ...14, FizzBuzz"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to check if a number is prime.",
      "starter_code": "function isPrime(n) {\n  // Your code here\n}",
      "test_case_description": "Input: 7 -> Output: true"
    }
  ]'::jsonb
);

-- Level 10: Coding Challenge II (Write Code)
INSERT INTO quizzes (title, description, role, level, questions) VALUES (
  'Coding Challenge II',
  'Advanced Algorithms: Trees, DP, and Optimization.',
  'Software Engineer',
  10,
  '[
    {
      "type": "code_challenge",
      "question": "Write a function to reverse a Linked List.",
      "starter_code": "function reverseList(head) {\n  // Your code here\n}",
      "test_case_description": "Input: 1->2->3 -> Output: 3->2->1"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to check for valid parentheses.",
      "starter_code": "function isValid(s) {\n  // Your code here\n}",
      "test_case_description": "Input: \"()[]{}\" -> Output: true"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to find the length of the longest substring without repeating characters.",
      "starter_code": "function lengthOfLongestSubstring(s) {\n  // Your code here\n}",
      "test_case_description": "Input: \"abcabcbb\" -> Output: 3"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to find the maximum subarray sum (Kadane''s Algorithm).",
      "starter_code": "function maxSubArray(nums) {\n  // Your code here\n}",
      "test_case_description": "Input: [-2,1,-3,4,-1,2,1,-5,4] -> Output: 6"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to solve the Climbing Stairs problem (DP).",
      "starter_code": "function climbStairs(n) {\n  // Your code here\n}",
      "test_case_description": "Input: 3 -> Output: 3"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to invert a Binary Tree.",
      "starter_code": "function invertTree(root) {\n  // Your code here\n}",
      "test_case_description": "Input: [4,2,7] -> Output: [4,7,2]"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to detect a cycle in a Linked List.",
      "starter_code": "function hasCycle(head) {\n  // Your code here\n}",
      "test_case_description": "Input: head = [3,2,0,-4], pos = 1 -> Output: true"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to merge two sorted lists.",
      "starter_code": "function mergeTwoLists(list1, list2) {\n  // Your code here\n}",
      "test_case_description": "Input: [1,2,4], [1,3,4] -> Output: [1,1,2,3,4,4]"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to find the Kth largest element in an array.",
      "starter_code": "function findKthLargest(nums, k) {\n  // Your code here\n}",
      "test_case_description": "Input: [3,2,1,5,6,4], k = 2 -> Output: 5"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to implement Binary Search.",
      "starter_code": "function search(nums, target) {\n  // Your code here\n}",
      "test_case_description": "Input: [-1,0,3,5,9,12], target = 9 -> Output: 4"
    }
  ]'::jsonb
);
