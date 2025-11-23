-- Clear existing quizzes for a clean slate (optional, but good for this demo)
truncate table quizzes cascade;

-- JAVASCRIPT PATH (10 Levels)

-- Level 1: Basics (Easy Theory)
insert into quizzes (title, description, role, level, questions) values
(
  'JS Level 1: Variables & Types',
  'Fundamental concepts of variables and data types.',
  'JavaScript Developer',
  1,
  '[
    {
      "type": "mcq",
      "question": "Which keyword is used to declare a block-scoped variable?",
      "options": ["var", "let", "global", "int"],
      "answer": "let"
    },
    {
      "type": "mcq",
      "question": "What is the type of `NaN`?",
      "options": ["Number", "String", "Object", "Undefined"],
      "answer": "Number"
    },
    {
      "type": "mcq",
      "question": "Which is a primitive data type?",
      "options": ["Array", "Object", "Boolean", "Function"],
      "answer": "Boolean"
    },
    {
      "type": "mcq",
      "question": "How do you write a single line comment?",
      "options": ["//", "/* */", "#", "<!-- -->"],
      "answer": "//"
    },
    {
      "type": "mcq",
      "question": "What is the output of `typeof null`?",
      "options": ["null", "object", "undefined", "number"],
      "answer": "object"
    },
    {
      "type": "mcq",
      "question": "Which operator is used for strict equality?",
      "options": ["==", "===", "=", "!="],
      "answer": "==="
    },
    {
      "type": "mcq",
      "question": "What is the correct way to declare a constant?",
      "options": ["const x = 10;", "let x = 10;", "var x = 10;", "constant x = 10;"],
      "answer": "const x = 10;"
    },
    {
      "type": "mcq",
      "question": "Which method converts a string to an integer?",
      "options": ["parseInt()", "toInteger()", "parseString()", "int()"],
      "answer": "parseInt()"
    },
    {
      "type": "mcq",
      "question": "What is the value of `undefined == null`?",
      "options": ["true", "false", "error", "undefined"],
      "answer": "true"
    },
    {
      "type": "mcq",
      "question": "Which symbol is used for template literals?",
      "options": ["Single quote", "Double quote", "Backtick", "Tilde"],
      "answer": "Backtick"
    }
  ]'::jsonb
);

-- Level 2: Functions & Scope (Easy Theory)
insert into quizzes (title, description, role, level, questions) values
(
  'JS Level 2: Functions & Scope',
  'Understanding functions, scope, and hoisting.',
  'JavaScript Developer',
  2,
  '[
    {
      "type": "mcq",
      "question": "What is a closure?",
      "options": ["A function bundled with its lexical environment", "A block of code", "A variable type", "An error"],
      "answer": "A function bundled with its lexical environment"
    },
    {
      "type": "mcq",
      "question": "Which keyword refers to the current object?",
      "options": ["self", "this", "object", "me"],
      "answer": "this"
    },
    {
      "type": "mcq",
      "question": "What is hoisting?",
      "options": ["Moving declarations to top", "Moving assignments to top", "Deleting variables", "Optimizing code"],
      "answer": "Moving declarations to top"
    },
    {
      "type": "mcq",
      "question": "Which function syntax preserves `this` context?",
      "options": ["Arrow function", "Function declaration", "Function expression", "Generator"],
      "answer": "Arrow function"
    },
    {
      "type": "mcq",
      "question": "What is the scope of a `var` variable?",
      "options": ["Function scope", "Block scope", "Global scope only", "Module scope"],
      "answer": "Function scope"
    },
    {
      "type": "mcq",
      "question": "How do you define a default parameter?",
      "options": ["function(x=1){}", "function(x:1){}", "function(x){x=1}", "function(x default 1){}"],
      "answer": "function(x=1){}"
    },
    {
      "type": "mcq",
      "question": "What is an IIFE?",
      "options": ["Immediately Invoked Function Expression", "Internal Interface For Events", "Infinite Iteration Function Error", "None"],
      "answer": "Immediately Invoked Function Expression"
    },
    {
      "type": "mcq",
      "question": "Which method calls a function with a given `this` value and arguments provided individually?",
      "options": ["call()", "apply()", "bind()", "map()"],
      "answer": "call()"
    },
    {
      "type": "mcq",
      "question": "What does `bind()` return?",
      "options": ["A new function", "The result of the function", "undefined", "boolean"],
      "answer": "A new function"
    },
    {
      "type": "mcq",
      "question": "Can arrow functions be used as constructors?",
      "options": ["No", "Yes", "Only in strict mode", "Sometimes"],
      "answer": "No"
    }
  ]'::jsonb
);

-- Level 3: Arrays & Objects (Medium Theory)
insert into quizzes (title, description, role, level, questions) values
(
  'JS Level 3: Arrays & Objects',
  'Working with data structures.',
  'JavaScript Developer',
  3,
  '[
    {
      "type": "mcq",
      "question": "Which method creates a new array with results of calling a function on every element?",
      "options": ["map()", "forEach()", "filter()", "reduce()"],
      "answer": "map()"
    },
    {
      "type": "mcq",
      "question": "Does `push()` modify the original array?",
      "options": ["Yes", "No", "Only if assigned", "Depends on browser"],
      "answer": "Yes"
    },
    {
      "type": "mcq",
      "question": "How do you check if a key exists in an object?",
      "options": ["\"key\" in obj", "obj.has(\"key\")", "obj.contains(\"key\")", "obj.exists(\"key\")"],
      "answer": "\"key\" in obj"
    },
    {
      "type": "mcq",
      "question": "Which method removes the last element of an array?",
      "options": ["pop()", "shift()", "splice()", "slice()"],
      "answer": "pop()"
    },
    {
      "type": "mcq",
      "question": "What does `Object.keys()` return?",
      "options": ["Array of keys", "Array of values", "Array of entries", "Object copy"],
      "answer": "Array of keys"
    },
    {
      "type": "mcq",
      "question": "Which method flattens nested arrays?",
      "options": ["flat()", "flatten()", "smooth()", "reduce()"],
      "answer": "flat()"
    },
    {
      "type": "mcq",
      "question": "What is the result of `[1, 2] + [3, 4]`?",
      "options": ["\"1,23,4\"", "[1, 2, 3, 4]", "Error", "NaN"],
      "answer": "\"1,23,4\""
    },
    {
      "type": "mcq",
      "question": "How to merge two objects?",
      "options": ["{...a, ...b}", "Object.merge(a, b)", "a + b", "a.append(b)"],
      "answer": "{...a, ...b}"
    },
    {
      "type": "mcq",
      "question": "Which array method returns a single value?",
      "options": ["reduce()", "map()", "filter()", "slice()"],
      "answer": "reduce()"
    },
    {
      "type": "mcq",
      "question": "What is a Set?",
      "options": ["Collection of unique values", "Ordered list", "Key-value pairs", "Immutable array"],
      "answer": "Collection of unique values"
    }
  ]'::jsonb
);

-- Level 4: Async JS (Medium Theory)
insert into quizzes (title, description, role, level, questions) values
(
  'JS Level 4: Asynchronous JavaScript',
  'Promises, Async/Await, and Event Loop.',
  'JavaScript Developer',
  4,
  '[
    {
      "type": "mcq",
      "question": "What does `Promise.all()` do?",
      "options": ["Waits for all promises to resolve", "Waits for first promise", "Runs promises sequentially", "Cancels promises"],
      "answer": "Waits for all promises to resolve"
    },
    {
      "type": "mcq",
      "question": "What keyword pauses execution in an async function?",
      "options": ["await", "wait", "pause", "yield"],
      "answer": "await"
    },
    {
      "type": "mcq",
      "question": "Which queue has higher priority?",
      "options": ["Microtask Queue", "Macrotask Queue", "They are same", "Callback Queue"],
      "answer": "Microtask Queue"
    },
    {
      "type": "mcq",
      "question": "What state is a Promise in initially?",
      "options": ["Pending", "Resolved", "Rejected", "Fulfilled"],
      "answer": "Pending"
    },
    {
      "type": "mcq",
      "question": "How to handle errors in async/await?",
      "options": ["try/catch", ".catch()", "onError", "if/else"],
      "answer": "try/catch"
    },
    {
      "type": "mcq",
      "question": "Is `setTimeout` part of JS engine?",
      "options": ["No, it is Web API", "Yes, core JS", "Yes, V8 feature", "No, it is CSS"],
      "answer": "No, it is Web API"
    },
    {
      "type": "mcq",
      "question": "What happens if you await a non-promise?",
      "options": ["It resolves immediately", "It throws error", "It waits forever", "It converts to null"],
      "answer": "It resolves immediately"
    },
    {
      "type": "mcq",
      "question": "Which runs first?",
      "options": ["Synchronous code", "Promise.then", "setTimeout", "requestAnimationFrame"],
      "answer": "Synchronous code"
    },
    {
      "type": "mcq",
      "question": "What does `Promise.race()` return?",
      "options": ["First settled promise", "First resolved promise", "All promises", "Last promise"],
      "answer": "First settled promise"
    },
    {
      "type": "mcq",
      "question": "Can you use await outside async function?",
      "options": ["Only in top-level modules", "Never", "Always", "In loops only"],
      "answer": "Only in top-level modules"
    }
  ]'::jsonb
);

-- Level 5: Advanced Concepts (Hard Theory)
insert into quizzes (title, description, role, level, questions) values
(
  'JS Level 5: Advanced Concepts',
  'Prototypes, Generators, and Memory.',
  'JavaScript Developer',
  5,
  '[
    {
      "type": "mcq",
      "question": "What is the prototype chain?",
      "options": ["Mechanism for inheritance", "List of functions", "Event loop order", "API chain"],
      "answer": "Mechanism for inheritance"
    },
    {
      "type": "mcq",
      "question": "What does a generator function return?",
      "options": ["Iterator object", "Array", "Promise", "Value"],
      "answer": "Iterator object"
    },
    {
      "type": "mcq",
      "question": "What causes a memory leak?",
      "options": ["Unwanted references", "Too many variables", "Large arrays", "Comments"],
      "answer": "Unwanted references"
    },
    {
      "type": "mcq",
      "question": "What is `WeakMap`?",
      "options": ["Map with weak key references", "Map with weak values", "Map with small size", "Deprecated Map"],
      "answer": "Map with weak key references"
    },
    {
      "type": "mcq",
      "question": "What is currying?",
      "options": ["Transforming function to take arguments one by one", "Mixing spices", "Merging functions", "Async pattern"],
      "answer": "Transforming function to take arguments one by one"
    },
    {
      "type": "mcq",
      "question": "What is the purpose of `Symbol`?",
      "options": ["Unique identifier", "String constant", "Math operation", "Debug tool"],
      "answer": "Unique identifier"
    },
    {
      "type": "mcq",
      "question": "What is `Object.freeze()`?",
      "options": ["Makes object immutable", "Stops execution", "Pauses object", "Hides object"],
      "answer": "Makes object immutable"
    },
    {
      "type": "mcq",
      "question": "Difference between `__proto__` and `prototype`?",
      "options": ["Instance vs Constructor property", "Same thing", "Private vs Public", "Old vs New"],
      "answer": "Instance vs Constructor property"
    },
    {
      "type": "mcq",
      "question": "What is tail call optimization?",
      "options": ["Memory optimization for recursion", "Sorting algorithm", "API call method", "CSS feature"],
      "answer": "Memory optimization for recursion"
    },
    {
      "type": "mcq",
      "question": "What is a Proxy?",
      "options": ["Object wrapper to intercept operations", "Network server", "VPN", "Copy of object"],
      "answer": "Object wrapper to intercept operations"
    }
  ]'::jsonb
);

-- Level 6: Code Output (Code Based)
insert into quizzes (title, description, role, level, questions) values
(
  'JS Level 6: Code Output Challenge',
  'Predict the output of code snippets.',
  'JavaScript Developer',
  6,
  '[
    {
      "type": "mcq",
      "question": "What is the output?\n```javascript\nconsole.log(1 + \"2\" + \"2\");\n```",
      "options": ["\"122\"", "\"32\"", "\"14\"", "Error"],
      "answer": "\"122\""
    },
    {
      "type": "mcq",
      "question": "What is the output?\n```javascript\nconsole.log(1 + +\"2\" + \"2\");\n```",
      "options": ["\"32\"", "\"122\"", "\"5\"", "Error"],
      "answer": "\"32\""
    },
    {
      "type": "mcq",
      "question": "What is the output?\n```javascript\nlet a = {};\nlet b = a;\na.x = 1;\nconsole.log(b.x);\n```",
      "options": ["1", "undefined", "null", "Error"],
      "answer": "1"
    },
    {
      "type": "mcq",
      "question": "What is the output?\n```javascript\nconsole.log(0.1 + 0.2 === 0.3);\n```",
      "options": ["false", "true", "undefined", "Error"],
      "answer": "false"
    },
    {
      "type": "mcq",
      "question": "What is the output?\n```javascript\n(function(){\n  var a = b = 3;\n})();\nconsole.log(typeof a !== \"undefined\");\nconsole.log(typeof b !== \"undefined\");\n```",
      "options": ["false, true", "true, true", "false, false", "true, false"],
      "answer": "false, true"
    },
    {
      "type": "mcq",
      "question": "What is the output?\n```javascript\nconsole.log(\"b\" + \"a\" + +\"a\" + \"a\");\n```",
      "options": ["\"baNaNa\"", "\"baaa\"", "\"NaN\"", "Error"],
      "answer": "\"baNaNa\""
    },
    {
      "type": "mcq",
      "question": "What is the output?\n```javascript\nconst arr = [1, 2, 3];\narr[10] = 11;\nconsole.log(arr.length);\n```",
      "options": ["11", "3", "10", "4"],
      "answer": "11"
    },
    {
      "type": "mcq",
      "question": "What is the output?\n```javascript\nconsole.log([] == ![]);\n```",
      "options": ["true", "false", "Error", "undefined"],
      "answer": "true"
    },
    {
      "type": "mcq",
      "question": "What is the output?\n```javascript\nfunction foo() {\n  return\n  {\n    bar: \"hello\"\n  };\n}\nconsole.log(foo());\n```",
      "options": ["undefined", "{bar: \"hello\"}", "null", "Error"],
      "answer": "undefined"
    },
    {
      "type": "mcq",
      "question": "What is the output?\n```javascript\nconsole.log(typeof NaN);\n```",
      "options": ["number", "NaN", "undefined", "object"],
      "answer": "number"
    }
  ]'::jsonb
);

-- Level 7: Error Finding (Code Based)
insert into quizzes (title, description, role, level, questions) values
(
  'JS Level 7: Debugging Challenge',
  'Identify errors in the code.',
  'JavaScript Developer',
  7,
  '[
    {
      "type": "mcq",
      "question": "Identify the error:\n```javascript\nconst x;\nx = 10;\n```",
      "options": ["Missing initializer in const declaration", "Cannot assign to const", "Syntax error", "No error"],
      "answer": "Missing initializer in const declaration"
    },
    {
      "type": "mcq",
      "question": "Identify the error:\n```javascript\nif (x = 10) {\n  console.log(\"Equal\");\n}\n```",
      "options": ["Assignment in condition (logic error)", "Syntax error", "Reference error", "Type error"],
      "answer": "Assignment in condition (logic error)"
    },
    {
      "type": "mcq",
      "question": "Identify the error:\n```javascript\nlet x = 10;\nlet x = 20;\n```",
      "options": ["Identifier x has already been declared", "No error", "Type error", "Syntax error"],
      "answer": "Identifier x has already been declared"
    },
    {
      "type": "mcq",
      "question": "Identify the error:\n```javascript\nfunction foo(a, a) {\n  console.log(a);\n}\n```",
      "options": ["Duplicate parameter name not allowed in strict mode", "No error", "Syntax error", "Runtime error"],
      "answer": "Duplicate parameter name not allowed in strict mode"
    },
    {
      "type": "mcq",
      "question": "Identify the error:\n```javascript\nreturn 10;\n```",
      "options": ["Illegal return statement (outside function)", "No error", "Syntax error", "Type error"],
      "answer": "Illegal return statement (outside function)"
    },
    {
      "type": "mcq",
      "question": "Identify the error:\n```javascript\nvar obj = {a: 1};\nobj = null;\nconsole.log(obj.a);\n```",
      "options": ["Cannot read property of null", "undefined", "1", "null"],
      "answer": "Cannot read property of null"
    },
    {
      "type": "mcq",
      "question": "Identify the error:\n```javascript\n[1, 2].forEach(break);\n```",
      "options": ["Illegal break statement", "No error", "Syntax error", "Type error"],
      "answer": "Illegal break statement"
    },
    {
      "type": "mcq",
      "question": "Identify the error:\n```javascript\nlet x = 10;\nconsole.log(x.toUpperCase());\n```",
      "options": ["x.toUpperCase is not a function", "No error", "Syntax error", "10"],
      "answer": "x.toUpperCase is not a function"
    },
    {
      "type": "mcq",
      "question": "Identify the error:\n```javascript\nconst arr = [1, 2];\narr.length = 0;\nconsole.log(arr[0]);\n```",
      "options": ["No error (returns undefined)", "Cannot assign to read only property", "Error", "1"],
      "answer": "No error (returns undefined)"
    },
    {
      "type": "mcq",
      "question": "Identify the error:\n```javascript\nJSON.parse(\"Hello\");\n```",
      "options": ["Unexpected token H in JSON", "No error", "null", "undefined"],
      "answer": "Unexpected token H in JSON"
    }
  ]'::jsonb
);

-- Level 8: Logic Puzzles (Code Based)
insert into quizzes (title, description, role, level, questions) values
(
  'JS Level 8: Logic Puzzles',
  'Tricky logic and algorithm questions.',
  'JavaScript Developer',
  8,
  '[
    {
      "type": "mcq",
      "question": "What is the output?\n```javascript\nconsole.log(1 < 2 < 3);\nconsole.log(3 > 2 > 1);\n```",
      "options": ["true, false", "true, true", "false, true", "false, false"],
      "answer": "true, false"
    },
    {
      "type": "mcq",
      "question": "What is the output?\n```javascript\nlet a = [1, 2, 3];\nlet b = [1, 2, 3];\nconsole.log(a == b);\n```",
      "options": ["false", "true", "Error", "undefined"],
      "answer": "false"
    },
    {
      "type": "mcq",
      "question": "What is the output?\n```javascript\nconsole.log(Math.max());\n```",
      "options": ["-Infinity", "Infinity", "0", "NaN"],
      "answer": "-Infinity"
    },
    {
      "type": "mcq",
      "question": "What is the output?\n```javascript\nconsole.log(1 + - + + + - + 1);\n```",
      "options": ["2", "0", "1", "Error"],
      "answer": "2"
    },
    {
      "type": "mcq",
      "question": "What is the output?\n```javascript\nvar x = 1;\nif (function f(){}) {\n  x += typeof f;\n}\nconsole.log(x);\n```",
      "options": ["1undefined", "1function", "1object", "Error"],
      "answer": "1undefined"
    },
    {
      "type": "mcq",
      "question": "What is the output?\n```javascript\n(function(x) {\n  return (function(y) {\n    console.log(x);\n  })(2)\n})(1);\n```",
      "options": ["1", "2", "undefined", "Error"],
      "answer": "1"
    },
    {
      "type": "mcq",
      "question": "What is the output?\n```javascript\nconsole.log(\"5\" - 3);\nconsole.log(\"5\" + 3);\n```",
      "options": ["2, \"53\"", "2, 8", "NaN, \"53\"", "Error"],
      "answer": "2, \"53\""
    },
    {
      "type": "mcq",
      "question": "What is the output?\n```javascript\nvar a = {}, b = {key: \"b\"}, c = {key: \"c\"};\na[b] = 123;\na[c] = 456;\nconsole.log(a[b]);\n```",
      "options": ["456", "123", "undefined", "Error"],
      "answer": "456"
    },
    {
      "type": "mcq",
      "question": "What is the output?\n```javascript\nconsole.log((() => 0)());\n```",
      "options": ["0", "undefined", "null", "Error"],
      "answer": "0"
    },
    {
      "type": "mcq",
      "question": "What is the output?\n```javascript\nconsole.log(typeof typeof 1);\n```",
      "options": ["string", "number", "undefined", "object"],
      "answer": "string"
    }
  ]'::jsonb
);

-- Level 9: Coding Challenges I (Write Code)
insert into quizzes (title, description, role, level, questions) values
(
  'JS Level 9: Coding Challenges I',
  'Write code to solve problems. AI will grade your solution.',
  'JavaScript Developer',
  9,
  '[
    {
      "type": "code_challenge",
      "question": "Write a function `sum` that takes two numbers and returns their sum.",
      "starter_code": "function sum(a, b) {\n  // Your code here\n}",
      "test_case_description": "sum(2, 3) should return 5"
    },
    {
      "type": "code_challenge",
      "question": "Write a function `isEven` that returns true if a number is even, false otherwise.",
      "starter_code": "function isEven(num) {\n  // Your code here\n}",
      "test_case_description": "isEven(4) -> true, isEven(3) -> false"
    },
    {
      "type": "code_challenge",
      "question": "Write a function `reverseString` that reverses a string.",
      "starter_code": "function reverseString(str) {\n  // Your code here\n}",
      "test_case_description": "reverseString(\"hello\") -> \"olleh\""
    },
    {
      "type": "code_challenge",
      "question": "Write a function `findMax` that returns the largest number in an array.",
      "starter_code": "function findMax(arr) {\n  // Your code here\n}",
      "test_case_description": "findMax([1, 5, 2]) -> 5"
    },
    {
      "type": "code_challenge",
      "question": "Write a function `factorial` that calculates the factorial of a number.",
      "starter_code": "function factorial(n) {\n  // Your code here\n}",
      "test_case_description": "factorial(5) -> 120"
    },
    {
      "type": "code_challenge",
      "question": "Write a function `removeDuplicates` that removes duplicate values from an array.",
      "starter_code": "function removeDuplicates(arr) {\n  // Your code here\n}",
      "test_case_description": "removeDuplicates([1, 1, 2]) -> [1, 2]"
    },
    {
      "type": "code_challenge",
      "question": "Write a function `isPalindrome` that checks if a string is a palindrome.",
      "starter_code": "function isPalindrome(str) {\n  // Your code here\n}",
      "test_case_description": "isPalindrome(\"racecar\") -> true"
    },
    {
      "type": "code_challenge",
      "question": "Write a function `fizzBuzz` that returns \"Fizz\" for multiples of 3, \"Buzz\" for multiples of 5, \"FizzBuzz\" for both, and the number otherwise.",
      "starter_code": "function fizzBuzz(n) {\n  // Your code here\n}",
      "test_case_description": "fizzBuzz(15) -> \"FizzBuzz\""
    },
    {
      "type": "code_challenge",
      "question": "Write a function `countVowels` that returns the number of vowels in a string.",
      "starter_code": "function countVowels(str) {\n  // Your code here\n}",
      "test_case_description": "countVowels(\"hello\") -> 2"
    },
    {
      "type": "code_challenge",
      "question": "Write a function `flatten` that flattens a nested array of any depth.",
      "starter_code": "function flatten(arr) {\n  // Your code here\n}",
      "test_case_description": "flatten([1, [2, [3]]]) -> [1, 2, 3]"
    }
  ]'::jsonb
);

-- Level 10: Coding Challenges II (Write Code)
insert into quizzes (title, description, role, level, questions) values
(
  'JS Level 10: Coding Challenges II',
  'Advanced problem solving with code.',
  'JavaScript Developer',
  10,
  '[
    {
      "type": "code_challenge",
      "question": "Write a function `debounce` that limits the rate at which a function can fire.",
      "starter_code": "function debounce(func, wait) {\n  // Your code here\n}",
      "test_case_description": "Should delay function execution"
    },
    {
      "type": "code_challenge",
      "question": "Write a function `deepClone` that creates a deep copy of an object.",
      "starter_code": "function deepClone(obj) {\n  // Your code here\n}",
      "test_case_description": "Should copy nested objects"
    },
    {
      "type": "code_challenge",
      "question": "Implement a `Promise.all` polyfill called `myPromiseAll`.",
      "starter_code": "function myPromiseAll(promises) {\n  // Your code here\n}",
      "test_case_description": "Should resolve when all promises resolve"
    },
    {
      "type": "code_challenge",
      "question": "Write a function `memoize` that caches the results of a function call.",
      "starter_code": "function memoize(fn) {\n  // Your code here\n}",
      "test_case_description": "Should return cached result for same args"
    },
    {
      "type": "code_challenge",
      "question": "Implement a function `curry` that converts a function with multiple arguments into a sequence of functions.",
      "starter_code": "function curry(fn) {\n  // Your code here\n}",
      "test_case_description": "curry(sum)(1)(2) -> 3"
    },
    {
      "type": "code_challenge",
      "question": "Write a function `binarySearch` that finds the index of a target in a sorted array.",
      "starter_code": "function binarySearch(arr, target) {\n  // Your code here\n}",
      "test_case_description": "binarySearch([1, 2, 3], 2) -> 1"
    },
    {
      "type": "code_challenge",
      "question": "Implement an `EventEmitter` class with `on`, `emit`, and `off` methods.",
      "starter_code": "class EventEmitter {\n  // Your code here\n}",
      "test_case_description": "Should handle events"
    },
    {
      "type": "code_challenge",
      "question": "Write a function `groupBy` that groups array elements by a key.",
      "starter_code": "function groupBy(arr, key) {\n  // Your code here\n}",
      "test_case_description": "groupBy([{a:1}, {a:1}], \"a\") -> {1: [{a:1}, {a:1}]}"
    },
    {
      "type": "code_challenge",
      "question": "Implement a function `throttle` that ensures a function is called at most once in a specified time period.",
      "starter_code": "function throttle(func, limit) {\n  // Your code here\n}",
      "test_case_description": "Should limit execution rate"
    },
    {
      "type": "code_challenge",
      "question": "Write a function `validateBST` to check if a binary tree is a valid Binary Search Tree.",
      "starter_code": "function validateBST(root) {\n  // Your code here\n}",
      "test_case_description": "Should validate BST properties"
    }
  ]'::jsonb
);
