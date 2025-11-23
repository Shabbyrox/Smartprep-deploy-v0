-- Level 1: Web Protocols (Easy MCQ)
INSERT INTO quizzes (title, description, role, level, questions) VALUES (
  'Web Protocols',
  'HTTP Methods, Status Codes, and Cookies vs Sessions.',
  'Backend Developer',
  1,
  '[
    {"type": "mcq", "question": "Which HTTP method is used to request data from a server?", "options": ["POST", "GET", "PUT", "DELETE"], "answer": "GET"},
    {"type": "mcq", "question": "What does HTTP Status Code 404 mean?", "options": ["Internal Server Error", "Unauthorized", "Not Found", "Bad Request"], "answer": "Not Found"},
    {"type": "mcq", "question": "Which status code indicates a successful request?", "options": ["200", "201", "400", "500"], "answer": "200"},
    {"type": "mcq", "question": "Where are cookies stored?", "options": ["Server-side", "Client-side (Browser)", "Database", "CDN"], "answer": "Client-side (Browser)"},
    {"type": "mcq", "question": "Which HTTP method is typically used to create a new resource?", "options": ["GET", "POST", "PUT", "PATCH"], "answer": "POST"},
    {"type": "mcq", "question": "What is the main difference between PUT and PATCH?", "options": ["PUT updates partial resource, PATCH replaces entire resource", "PUT replaces entire resource, PATCH updates partial resource", "No difference", "PUT is faster"], "answer": "PUT replaces entire resource, PATCH updates partial resource"},
    {"type": "mcq", "question": "What does Status Code 500 indicate?", "options": ["Not Found", "Forbidden", "Internal Server Error", "Created"], "answer": "Internal Server Error"},
    {"type": "mcq", "question": "Which header is used to send an authentication token?", "options": ["Authorization", "Auth-Token", "Cookie", "Accept"], "answer": "Authorization"},
    {"type": "mcq", "question": "Sessions are typically stored where?", "options": ["Client-side", "Server-side", "URL parameters", "HTML Body"], "answer": "Server-side"},
    {"type": "mcq", "question": "Which status code means ''Unauthorized''?", "options": ["400", "401", "403", "404"], "answer": "401"}
  ]'::jsonb
);

-- Level 2: Database Basics (Easy MCQ)
INSERT INTO quizzes (title, description, role, level, questions) VALUES (
  'Database Basics',
  'SQL Syntax, Primary/Foreign Keys, and SQL vs NoSQL differences.',
  'Backend Developer',
  2,
  '[
    {"type": "mcq", "question": "Which SQL statement is used to retrieve data?", "options": ["GET", "SELECT", "FETCH", "RETRIEVE"], "answer": "SELECT"},
    {"type": "mcq", "question": "What is a Primary Key?", "options": ["A unique identifier for a record", "A key to encrypt data", "A foreign link", "A backup key"], "answer": "A unique identifier for a record"},
    {"type": "mcq", "question": "Which SQL clause is used to filter records?", "options": ["FILTER", "WHERE", "HAVING", "LIMIT"], "answer": "WHERE"},
    {"type": "mcq", "question": "What does NoSQL stand for?", "options": ["No SQL", "Not Only SQL", "New SQL", "Non-Structured Query Language"], "answer": "Not Only SQL"},
    {"type": "mcq", "question": "Which is a relational database?", "options": ["MongoDB", "Redis", "PostgreSQL", "Cassandra"], "answer": "PostgreSQL"},
    {"type": "mcq", "question": "What is a Foreign Key?", "options": ["A key that links two tables", "A primary key of another table", "A unique key", "Both A and B"], "answer": "Both A and B"},
    {"type": "mcq", "question": "Which command is used to add a new record?", "options": ["ADD", "INSERT INTO", "CREATE", "UPDATE"], "answer": "INSERT INTO"},
    {"type": "mcq", "question": "Which is a characteristic of NoSQL databases?", "options": ["Fixed Schema", "Flexible Schema", "Complex Joins", "ACID compliance by default"], "answer": "Flexible Schema"},
    {"type": "mcq", "question": "How do you select all columns from a table named ''Users''?", "options": ["SELECT all FROM Users", "SELECT * FROM Users", "GET Users", "SELECT Users"], "answer": "SELECT * FROM Users"},
    {"type": "mcq", "question": "Which command modifies existing data?", "options": ["CHANGE", "MODIFY", "UPDATE", "ALTER"], "answer": "UPDATE"}
  ]'::jsonb
);

-- Level 3: API & Auth (Hard MCQ)
INSERT INTO quizzes (title, description, role, level, questions) VALUES (
  'API & Auth',
  'REST vs GraphQL, Authentication (JWT, OAuth), Idempotency, and API Versioning.',
  'Backend Developer',
  3,
  '[
    {"type": "mcq", "question": "What is a key benefit of GraphQL over REST?", "options": ["Caching is easier", "Over-fetching and under-fetching are minimized", "It uses standard HTTP status codes", "It is older and more stable"], "answer": "Over-fetching and under-fetching are minimized"},
    {"type": "mcq", "question": "What does JWT stand for?", "options": ["Java Web Token", "JSON Web Token", "JavaScript Web Token", "JSON Web Ticket"], "answer": "JSON Web Token"},
    {"type": "mcq", "question": "Which HTTP method is Idempotent?", "options": ["POST", "PUT", "PATCH (usually)", "CONNECT"], "answer": "PUT"},
    {"type": "mcq", "question": "In OAuth 2.0, which grant type is used for server-to-server communication?", "options": ["Authorization Code", "Implicit", "Client Credentials", "Password"], "answer": "Client Credentials"},
    {"type": "mcq", "question": "What is the purpose of a Refresh Token?", "options": ["To log the user out", "To obtain a new Access Token without re-login", "To verify email", "To encrypt the password"], "answer": "To obtain a new Access Token without re-login"},
    {"type": "mcq", "question": "How is API versioning commonly implemented?", "options": ["URL path (/v1/)", "Header", "Query Parameter", "All of the above"], "answer": "All of the above"},
    {"type": "mcq", "question": "Which part of a JWT contains the claims?", "options": ["Header", "Payload", "Signature", "Footer"], "answer": "Payload"},
    {"type": "mcq", "question": "What does ''Stateless'' mean in REST?", "options": ["Server stores no client context between requests", "No database is used", "No authentication is required", "Server restarts after every request"], "answer": "Server stores no client context between requests"},
    {"type": "mcq", "question": "Which is NOT a safe HTTP method?", "options": ["GET", "HEAD", "OPTIONS", "DELETE"], "answer": "DELETE"},
    {"type": "mcq", "question": "What is the signature in a JWT used for?", "options": ["To encrypt the data", "To verify the sender and ensure integrity", "To store user role", "To compress the token"], "answer": "To verify the sender and ensure integrity"}
  ]'::jsonb
);

-- Level 4: Advanced Database (Hard MCQ)
INSERT INTO quizzes (title, description, role, level, questions) VALUES (
  'Advanced Database',
  'ACID Properties, Normalization, Indexing, Transactions, and N+1 Problem.',
  'Backend Developer',
  4,
  '[
    {"type": "mcq", "question": "What does ''Isolation'' in ACID ensure?", "options": ["Transactions are completed fully or not at all", "Transactions occur independently without interference", "Data remains consistent", "Data is saved permanently"], "answer": "Transactions occur independently without interference"},
    {"type": "mcq", "question": "Which Normal Form deals with multi-valued dependencies?", "options": ["2NF", "3NF", "4NF", "BCNF"], "answer": "4NF"},
    {"type": "mcq", "question": "What is the N+1 problem?", "options": ["An error in loop indexing", "Executing 1 query for parent and N queries for children", "A memory leak", "A recursion limit"], "answer": "Executing 1 query for parent and N queries for children"},
    {"type": "mcq", "question": "What is a downside of too many indexes?", "options": ["Slower reads", "Slower writes/updates", "Less storage used", "Data corruption"], "answer": "Slower writes/updates"},
    {"type": "mcq", "question": "What is a Database Transaction?", "options": ["A single SQL query", "A unit of work treated as a whole", "A backup process", "A connection attempt"], "answer": "A unit of work treated as a whole"},
    {"type": "mcq", "question": "Which isolation level prevents Dirty Reads?", "options": ["Read Uncommitted", "Read Committed", "Serializable", "Repeatable Read"], "answer": "Read Committed"},
    {"type": "mcq", "question": "What is Denormalization used for?", "options": ["To save space", "To improve read performance", "To ensure data integrity", "To reduce redundancy"], "answer": "To improve read performance"},
    {"type": "mcq", "question": "What is a Composite Key?", "options": ["A key made of multiple columns", "A foreign key", "A primary key", "An encrypted key"], "answer": "A key made of multiple columns"},
    {"type": "mcq", "question": "Which index type is default in most SQL databases?", "options": ["B-Tree", "Hash", "Bitmap", "GiST"], "answer": "B-Tree"},
    {"type": "mcq", "question": "What does ''Atomicity'' guarantee?", "options": ["All operations in a transaction succeed or none do", "Data is accurate", "Transactions are isolated", "System is available"], "answer": "All operations in a transaction succeed or none do"}
  ]'::jsonb
);

-- Level 5: Code Prediction I (Code Output MCQ)
INSERT INTO quizzes (title, description, role, level, questions) VALUES (
  'Code Prediction I',
  'Server-side logic flow, middleware execution order, and async/await handling.',
  'Backend Developer',
  5,
  '[
    {"type": "mcq", "question": "Output? \n async function f() { return 1; } \n console.log(f());", "options": ["1", "Promise { 1 }", "undefined", "Error"], "answer": "Promise { 1 }"},
    {"type": "mcq", "question": "Output? \n console.log(1); \n process.nextTick(() => console.log(2)); \n console.log(3);", "options": ["1 2 3", "1 3 2", "3 2 1", "1 3"], "answer": "1 3 2"},
    {"type": "mcq", "question": "Middleware order: \n app.use((req, res, next) => { console.log(1); next(); }); \n app.use((req, res, next) => { console.log(2); }); \n app.use((req, res, next) => { console.log(3); });", "options": ["1 2 3", "1 2", "1", "3 2 1"], "answer": "1 2"},
    {"type": "mcq", "question": "Output? \n setTimeout(() => console.log(1), 0); \n setImmediate(() => console.log(2)); \n (In Node.js I/O cycle)", "options": ["1 2", "2 1", "Random", "Error"], "answer": "2 1"},
    {"type": "mcq", "question": "Output? \n Promise.resolve().then(() => console.log(1)); \n setTimeout(() => console.log(2), 0);", "options": ["1 2", "2 1", "Random", "Error"], "answer": "1 2"},
    {"type": "mcq", "question": "What happens if `next()` is not called in a middleware?", "options": ["Request hangs", "Error is thrown", "Next middleware runs automatically", "Response is sent"], "answer": "Request hangs"},
    {"type": "mcq", "question": "Output? \n async function foo() { throw new Error(''oops''); } \n foo().catch(e => console.log(''caught''));", "options": ["Uncaught Error", "caught", "oops", "Nothing"], "answer": "caught"},
    {"type": "mcq", "question": "Output? \n const fs = require(''fs''); \n fs.readFile(''file'', () => console.log(1)); \n console.log(2);", "options": ["1 2", "2 1", "1", "2"], "answer": "2 1"},
    {"type": "mcq", "question": "What is `req.body` if body-parser is not used (in Express)?", "options": ["Object", "undefined", "null", "String"], "answer": "undefined"},
    {"type": "mcq", "question": "Output? \n (async () => { \n   console.log(await Promise.resolve(1)); \n   console.log(2); \n })();", "options": ["1 2", "2 1", "1", "2"], "answer": "1 2"}
  ]'::jsonb
);

-- Level 6: System Architecture (Hard MCQ)
INSERT INTO quizzes (title, description, role, level, questions) VALUES (
  'System Architecture',
  'Microservices vs Monolith, Load Balancing, Caching, and Message Queues.',
  'Backend Developer',
  6,
  '[
    {"type": "mcq", "question": "What is a main advantage of Microservices?", "options": ["Easier to debug", "Independent scaling of services", "Simpler deployment", "No network latency"], "answer": "Independent scaling of services"},
    {"type": "mcq", "question": "What does a Load Balancer do?", "options": ["Distributes traffic across multiple servers", "Caches data", "Encrypts requests", "Stores sessions"], "answer": "Distributes traffic across multiple servers"},
    {"type": "mcq", "question": "Which is an in-memory cache?", "options": ["PostgreSQL", "Redis", "MongoDB", "Kafka"], "answer": "Redis"},
    {"type": "mcq", "question": "What is the CAP theorem?", "options": ["Consistency, Availability, Partition Tolerance", "Consistency, Accuracy, Performance", "Cache, API, Protocol", "Control, Access, Permission"], "answer": "Consistency, Availability, Partition Tolerance"},
    {"type": "mcq", "question": "What is a Message Queue (e.g., Kafka) used for?", "options": ["Real-time database", "Asynchronous communication between services", "Load balancing", "Frontend rendering"], "answer": "Asynchronous communication between services"},
    {"type": "mcq", "question": "What is Horizontal Scaling?", "options": ["Adding more power (CPU/RAM) to a machine", "Adding more machines to the pool", "Optimizing code", "Reducing database size"], "answer": "Adding more machines to the pool"},
    {"type": "mcq", "question": "Which strategy is used for Cache Eviction?", "options": ["FIFO", "LRU (Least Recently Used)", "LIFO", "Random"], "answer": "LRU (Least Recently Used)"},
    {"type": "mcq", "question": "What is a Reverse Proxy?", "options": ["A proxy that sits before the client", "A proxy that sits before the server", "A VPN", "A firewall"], "answer": "A proxy that sits before the server"},
    {"type": "mcq", "question": "What is Database Sharding?", "options": ["Replicating the database", "Partitioning data across multiple servers", "Backing up data", "Indexing data"], "answer": "Partitioning data across multiple servers"},
    {"type": "mcq", "question": "What is the purpose of a Circuit Breaker pattern?", "options": ["To stop electricity", "To prevent cascading failures in a distributed system", "To break loops", "To secure the API"], "answer": "To prevent cascading failures in a distributed system"}
  ]'::jsonb
);

-- Level 7: Debugging (Error Finding MCQ)
INSERT INTO quizzes (title, description, role, level, questions) VALUES (
  'Debugging',
  'Identify security risks (SQLi, XSS) or logic errors in backend routes.',
  'Backend Developer',
  7,
  '[
    {"type": "mcq", "question": "Identify the risk: \n db.query(\"SELECT * FROM users WHERE name = ''\" + req.body.name + \"''\");", "options": ["XSS", "SQL Injection", "CSRF", "No Error"], "answer": "SQL Injection"},
    {"type": "mcq", "question": "Identify the error: \n app.get(''/'', (req, res) => { \n   db.find({}, (err, data) => { \n     if(err) throw err; \n     res.send(data); \n   }); \n });", "options": ["Uncaught exception crashes server", "Syntax Error", "Logic Error", "No Error"], "answer": "Uncaught exception crashes server"},
    {"type": "mcq", "question": "Identify the risk: \n res.send(\"<h1>\" + req.query.name + \"</h1>\");", "options": ["SQL Injection", "Reflected XSS", "CSRF", "DoS"], "answer": "Reflected XSS"},
    {"type": "mcq", "question": "Identify the error: \n async function handler(req, res) { \n   const user = await db.getUser(); \n   res.json(user); \n   res.send(''Done''); \n }", "options": ["Sending response twice", "Syntax Error", "Async error", "No Error"], "answer": "Sending response twice"},
    {"type": "mcq", "question": "Identify the missing part: \n app.post(''/login'', (req, res) => { \n   const user = db.find(req.body.id); \n   // ... logic \n }); (No error handling)", "options": ["Missing try-catch or error callback", "Missing return", "Missing await", "No Error"], "answer": "Missing try-catch or error callback"},
    {"type": "mcq", "question": "Identify the risk: \n Storing passwords in plain text.", "options": ["Security Vulnerability", "Performance Issue", "Data Integrity Issue", "No Risk"], "answer": "Security Vulnerability"},
    {"type": "mcq", "question": "Identify the error: \n const conn = db.connect(); \n // ... usage \n // (Connection never closed)", "options": ["Memory/Resource Leak", "Syntax Error", "Logic Error", "No Error"], "answer": "Memory/Resource Leak"},
    {"type": "mcq", "question": "Identify the risk: \n Using `eval(req.body.code)`", "options": ["Remote Code Execution (RCE)", "XSS", "SQL Injection", "DoS"], "answer": "Remote Code Execution (RCE)"},
    {"type": "mcq", "question": "Identify the issue: \n Using `var` instead of `let`/`const` in Node.js modern code.", "options": ["Scope bleeding", "Syntax Error", "Performance", "No issue"], "answer": "Scope bleeding"},
    {"type": "mcq", "question": "Identify the risk: \n Allowing all origins in CORS (`Access-Control-Allow-Origin: *`) with credentials.", "options": ["Security Risk", "Performance Risk", "No Risk", "Syntax Error"], "answer": "Security Risk"}
  ]'::jsonb
);

-- Level 8: Tricky Logic (Tricky Output MCQ)
INSERT INTO quizzes (title, description, role, level, questions) VALUES (
  'Tricky Logic',
  'Concurrency issues, Race conditions, Database isolation levels, and complex logical operators.',
  'Backend Developer',
  8,
  '[
    {"type": "mcq", "question": "What happens if two transactions read and write the same data simultaneously without locking?", "options": ["Race Condition", "Deadlock", "Consistency", "Atomicity"], "answer": "Race Condition"},
    {"type": "mcq", "question": "Output? \n console.log(null == undefined); \n console.log(null === undefined);", "options": ["true true", "true false", "false true", "false false"], "answer": "true false"},
    {"type": "mcq", "question": "What is a Phantom Read?", "options": ["Reading a row that disappears", "A query returning different rows when repeated in same transaction", "Reading uncommitted data", "Reading dirty data"], "answer": "A query returning different rows when repeated in same transaction"},
    {"type": "mcq", "question": "Output? \n console.log(![] + []);", "options": ["\"false\"", "\"true\"", "0", "NaN"], "answer": "\"false\""},
    {"type": "mcq", "question": "If Transaction A holds Lock X and waits for Lock Y, and Transaction B holds Lock Y and waits for Lock X, this is?", "options": ["Deadlock", "Livelock", "Starvation", "Race Condition"], "answer": "Deadlock"},
    {"type": "mcq", "question": "Output? \n console.log(1 < 2 < 3); \n console.log(3 > 2 > 1);", "options": ["true true", "true false", "false true", "false false"], "answer": "true false"},
    {"type": "mcq", "question": "What does `SELECT ... FOR UPDATE` do?", "options": ["Locks the selected rows", "Updates the rows", "Selects updated rows", "Deletes rows"], "answer": "Locks the selected rows"},
    {"type": "mcq", "question": "Output? \n console.log([] + {});", "options": ["\"[object Object]\"", "\"[object Object]\"", "0", "undefined"], "answer": "\"[object Object]\""},
    {"type": "mcq", "question": "In a distributed system, what is Eventual Consistency?", "options": ["Data will become consistent over time", "Data is always consistent", "Data is never consistent", "Data is consistent immediately"], "answer": "Data will become consistent over time"},
    {"type": "mcq", "question": "Output? \n let a = {x:1}; let b = a; a.x = 2; console.log(b.x);", "options": ["1", "2", "undefined", "Error"], "answer": "2"}
  ]'::jsonb
);

-- Level 9: Coding Challenge I (Write Code)
INSERT INTO quizzes (title, description, role, level, questions) VALUES (
  'Coding Challenge I',
  'Data Processing: Pagination, Filtering, and Sorting.',
  'Backend Developer',
  9,
  '[
    {
      "type": "code_challenge",
      "question": "Write a function to paginate an array.",
      "starter_code": "function paginate(array, pageSize, pageNumber) {\n  // Your code here\n}",
      "test_case_description": "Input: [1..10], size 3, page 2 -> Output: [4, 5, 6]"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to filter users by age > 18.",
      "starter_code": "function filterAdults(users) {\n  // Your code here\n}",
      "test_case_description": "Input: [{age:10}, {age:20}] -> Output: [{age:20}]"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to sort users by name.",
      "starter_code": "function sortUsers(users) {\n  // Your code here\n}",
      "test_case_description": "Input: [{name:\"B\"}, {name:\"A\"}] -> Output: [{name:\"A\"}, {name:\"B\"}]"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to group items by category.",
      "starter_code": "function groupByCategory(items) {\n  // Your code here\n}",
      "test_case_description": "Input: [{cat:\"A\", val:1}, {cat:\"A\", val:2}] -> Output: {A: [1, 2]}"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to calculate total price of cart items.",
      "starter_code": "function calculateTotal(cart) {\n  // Your code here\n}",
      "test_case_description": "Input: [{price:10, qty:2}] -> Output: 20"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to merge two user objects (deep merge).",
      "starter_code": "function mergeUsers(u1, u2) {\n  // Your code here\n}",
      "test_case_description": "Input: {a:1}, {b:2} -> Output: {a:1, b:2}"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to sanitize a string (remove special chars).",
      "starter_code": "function sanitize(str) {\n  // Your code here\n}",
      "test_case_description": "Input: \"a$b#\" -> Output: \"ab\""
    },
    {
      "type": "code_challenge",
      "question": "Write a function to find duplicate emails in a list.",
      "starter_code": "function findDuplicates(emails) {\n  // Your code here\n}",
      "test_case_description": "Input: [\"a@a.com\", \"a@a.com\"] -> Output: [\"a@a.com\"]"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to transform array of objects to map (by ID).",
      "starter_code": "function arrayToMap(arr) {\n  // Your code here\n}",
      "test_case_description": "Input: [{id:1, val:\"a\"}] -> Output: {1: {id:1, val:\"a\"}}"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to flatten a nested JSON object.",
      "starter_code": "function flattenObject(obj) {\n  // Your code here\n}",
      "test_case_description": "Input: {a: {b: 1}} -> Output: {\"a.b\": 1}"
    }
  ]'::jsonb
);

-- Level 10: Coding Challenge II (Write Code)
INSERT INTO quizzes (title, description, role, level, questions) VALUES (
  'Coding Challenge II',
  'Algorithmic Logic: Rate Limiter, Caching, etc.',
  'Backend Developer',
  10,
  '[
    {
      "type": "code_challenge",
      "question": "Implement a simplified Rate Limiter (Token Bucket logic).",
      "starter_code": "class RateLimiter {\n  allowRequest() {\n    // Your code\n  }\n}",
      "test_case_description": "Limit 5 req/sec"
    },
    {
      "type": "code_challenge",
      "question": "Implement an LRU Cache.",
      "starter_code": "class LRUCache {\n  get(key) {}\n  put(key, value) {}\n}",
      "test_case_description": "Evict least recently used item"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to validate a JSON Web Token (mock).",
      "starter_code": "function verifyJWT(token, secret) {\n  // Your code here\n}",
      "test_case_description": "Check signature and expiry"
    },
    {
      "type": "code_challenge",
      "question": "Implement a simple Pub/Sub system.",
      "starter_code": "class PubSub {\n  subscribe(topic, fn) {}\n  publish(topic, data) {}\n}",
      "test_case_description": "Subscribers receive data"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to detect overlapping time intervals.",
      "starter_code": "function hasOverlap(intervals) {\n  // Your code here\n}",
      "test_case_description": "Input: [[1,5], [4,6]] -> Output: true"
    },
    {
      "type": "code_challenge",
      "question": "Implement a connection pool mock.",
      "starter_code": "class ConnectionPool {\n  getConnection() {}\n  releaseConnection(conn) {}\n}",
      "test_case_description": "Manage limited connections"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to generate a unique ID (UUID-like).",
      "starter_code": "function generateUUID() {\n  // Your code here\n}",
      "test_case_description": "Output: Unique string"
    },
    {
      "type": "code_challenge",
      "question": "Implement a simple URL Shortener logic (hashing).",
      "starter_code": "function shortenURL(url) {\n  // Your code here\n}",
      "test_case_description": "Input: longURL -> Output: shortCode"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to retry a failed promise N times.",
      "starter_code": "async function retry(fn, retries) {\n  // Your code here\n}",
      "test_case_description": "Retries on failure"
    },
    {
      "type": "code_challenge",
      "question": "Implement a basic Round Robin Load Balancer logic.",
      "starter_code": "class LoadBalancer {\n  getServer() {}\n}",
      "test_case_description": "Cycles through servers"
    }
  ]'::jsonb
);
