-- Level 1: Web Fundamentals (Easy MCQ)
INSERT INTO quizzes (title, description, role, level, questions) VALUES (
  'Web Fundamentals',
  'HTML5 Semantics, Basic DOM elements, and SEO basics.',
  'Frontend Developer',
  1,
  '[
    {"type": "mcq", "question": "Which HTML tag is used to define an independent, self-contained content?", "options": ["<section>", "<article>", "<div>", "<aside>"], "answer": "<article>"},
    {"type": "mcq", "question": "What does the <meta name=\"viewport\"> tag control?", "options": ["SEO keywords", "Page scaling and dimensions", "Character encoding", "External stylesheets"], "answer": "Page scaling and dimensions"},
    {"type": "mcq", "question": "Which attribute is mandatory for an <img> tag for accessibility and SEO?", "options": ["src", "title", "alt", "id"], "answer": "alt"},
    {"type": "mcq", "question": "What is the correct HTML5 element for the main navigation block?", "options": ["<navigation>", "<nav>", "<menu>", "<ul>"], "answer": "<nav>"},
    {"type": "mcq", "question": "Which method is used to select an element by its unique ID?", "options": ["getElementByClass", "querySelector", "getElementById", "getElement"], "answer": "getElementById"},
    {"type": "mcq", "question": "What does DOM stand for?", "options": ["Data Object Model", "Document Object Model", "Digital Ordinance Model", "Document Orientation Module"], "answer": "Document Object Model"},
    {"type": "mcq", "question": "Which tag is used to embed a video in HTML5?", "options": ["<media>", "<movie>", "<video>", "<embed>"], "answer": "<video>"},
    {"type": "mcq", "question": "What is the purpose of the <head> section?", "options": ["To display main content", "To contain metadata and links", "To show the header", "To run scripts only"], "answer": "To contain metadata and links"},
    {"type": "mcq", "question": "Which input type is best for a slider control?", "options": ["number", "slider", "range", "scroll"], "answer": "range"},
    {"type": "mcq", "question": "Which HTML element represents the main content of the document?", "options": ["<main>", "<body>", "<content>", "<section>"], "answer": "<main>"}
  ]'::jsonb
);

-- Level 2: CSS Basics (Easy MCQ)
INSERT INTO quizzes (title, description, role, level, questions) VALUES (
  'CSS Basics',
  'Box Model, Selectors, Specificity, Colors & Fonts.',
  'Frontend Developer',
  2,
  '[
    {"type": "mcq", "question": "In the CSS Box Model, which layer is immediately outside the content?", "options": ["Border", "Margin", "Padding", "Outline"], "answer": "Padding"},
    {"type": "mcq", "question": "Which selector targets all <p> elements inside a <div>?", "options": ["div + p", "div > p", "div p", "div ~ p"], "answer": "div p"},
    {"type": "mcq", "question": "Which property changes the text color?", "options": ["text-color", "font-color", "color", "background-color"], "answer": "color"},
    {"type": "mcq", "question": "Which selector has the highest specificity?", "options": ["#id", ".class", "element", "*"], "answer": "#id"},
    {"type": "mcq", "question": "How do you select an element with the class \"active\"?", "options": ["#active", ".active", "active", "*active"], "answer": ".active"},
    {"type": "mcq", "question": "What is the default value of the position property?", "options": ["relative", "absolute", "fixed", "static"], "answer": "static"},
    {"type": "mcq", "question": "Which unit is relative to the font-size of the root element?", "options": ["em", "rem", "px", "%"], "answer": "rem"},
    {"type": "mcq", "question": "Which property controls the boldness of text?", "options": ["font-style", "text-decoration", "font-weight", "font-variant"], "answer": "font-weight"},
    {"type": "mcq", "question": "What does `box-sizing: border-box` do?", "options": ["Adds border to width", "Includes padding and border in the element''s total width and height", "Removes the border", "Makes the box square"], "answer": "Includes padding and border in the element''s total width and height"},
    {"type": "mcq", "question": "How do you make a list not display bullet points?", "options": ["list-style-type: none", "bullet: none", "text-decoration: none", "list: none"], "answer": "list-style-type: none"}
  ]'::jsonb
);

-- Level 3: Modern Layouts (Hard MCQ)
INSERT INTO quizzes (title, description, role, level, questions) VALUES (
  'Modern Layouts',
  'Flexbox, Grid, Responsive Design (Media Queries), and CSS Variables.',
  'Frontend Developer',
  3,
  '[
    {"type": "mcq", "question": "In Flexbox, which property aligns items along the main axis?", "options": ["align-items", "justify-content", "align-content", "flex-direction"], "answer": "justify-content"},
    {"type": "mcq", "question": "Which CSS Grid property defines the columns?", "options": ["grid-template-rows", "grid-columns", "grid-template-columns", "display-grid"], "answer": "grid-template-columns"},
    {"type": "mcq", "question": "What is the correct syntax for a media query targeting screens smaller than 600px?", "options": ["@media (max-width: 600px)", "@media (min-width: 600px)", "@screen < 600px", "@media screen 600px"], "answer": "@media (max-width: 600px)"},
    {"type": "mcq", "question": "How do you define a global CSS variable?", "options": ["root { --var: val; }", ":root { --var: val; }", "html { $var: val; }", "var { name: val; }"], "answer": ":root { --var: val; }"},
    {"type": "mcq", "question": "In Flexbox, what does `flex-grow: 1` do?", "options": ["Shrinks the item", "Allows the item to grow to fill available space", "Sets the initial size", "Aligns the item"], "answer": "Allows the item to grow to fill available space"},
    {"type": "mcq", "question": "Which value of `display` enables Flexbox?", "options": ["box", "flex", "flexbox", "grid"], "answer": "flex"},
    {"type": "mcq", "question": "What does `gap` property do in Flexbox and Grid?", "options": ["Adds margin around the container", "Adds space between rows and columns", "Adds padding inside items", "Nothing"], "answer": "Adds space between rows and columns"},
    {"type": "mcq", "question": "How do you access a CSS variable?", "options": ["var(--name)", "$name", "variable(name)", "@name"], "answer": "var(--name)"},
    {"type": "mcq", "question": "Which Grid unit represents a fraction of the available space?", "options": ["%", "px", "fr", "em"], "answer": "fr"},
    {"type": "mcq", "question": "What is the default `flex-direction`?", "options": ["column", "row", "row-reverse", "column-reverse"], "answer": "row"}
  ]'::jsonb
);

-- Level 4: Framework Theory (Hard MCQ)
INSERT INTO quizzes (title, description, role, level, questions) VALUES (
  'Framework Theory',
  'React.js Core: Virtual DOM, JSX, Props vs State, Lifecycle/Hooks theory.',
  'Frontend Developer',
  4,
  '[
    {"type": "mcq", "question": "What is the Virtual DOM?", "options": ["A direct copy of the browser DOM", "A lightweight JavaScript representation of the DOM", "A browser plugin", "A CSS file"], "answer": "A lightweight JavaScript representation of the DOM"},
    {"type": "mcq", "question": "What is the main difference between Props and State?", "options": ["Props are mutable, State is immutable", "Props are passed from parent, State is managed internally", "State is passed from parent, Props are internal", "Both are the same"], "answer": "Props are passed from parent, State is managed internally"},
    {"type": "mcq", "question": "Which hook is used to handle side effects in functional components?", "options": ["useState", "useReducer", "useEffect", "useContext"], "answer": "useEffect"},
    {"type": "mcq", "question": "What is JSX?", "options": ["Java Syntax Extension", "JavaScript XML", "JSON Style XML", "JavaScript Extension"], "answer": "JavaScript XML"},
    {"type": "mcq", "question": "Why must list items in React have a unique ''key'' prop?", "options": ["For styling purposes", "To help React identify which items have changed, added, or removed", "To sort the list", "It is optional"], "answer": "To help React identify which items have changed, added, or removed"},
    {"type": "mcq", "question": "What happens when you call `setState`?", "options": ["It updates the DOM immediately", "It schedules a re-render of the component", "It reloads the page", "It does nothing"], "answer": "It schedules a re-render of the component"},
    {"type": "mcq", "question": "Which lifecycle method is equivalent to `useEffect` with an empty dependency array `[]`?", "options": ["componentDidUpdate", "componentWillUnmount", "componentDidMount", "shouldComponentUpdate"], "answer": "componentDidMount"},
    {"type": "mcq", "question": "What is the purpose of `useMemo`?", "options": ["To memorize a function", "To memoize a value and prevent unnecessary recalculations", "To store state", "To handle errors"], "answer": "To memoize a value and prevent unnecessary recalculations"},
    {"type": "mcq", "question": "Can you update props directly inside a child component?", "options": ["Yes", "No, props are read-only", "Only if defined as mutable", "Yes, using setProps"], "answer": "No, props are read-only"},
    {"type": "mcq", "question": "What is Prop Drilling?", "options": ["Passing data through multiple levels of components", "A tool to debug props", "Creating new props", "Deleting props"], "answer": "Passing data through multiple levels of components"}
  ]'::jsonb
);

-- Level 5: Component Logic (Code Output MCQ)
INSERT INTO quizzes (title, description, role, level, questions) VALUES (
  'Component Logic',
  'Predict the render output of simple React components or JS functions.',
  'Frontend Developer',
  5,
  '[
    {"type": "mcq", "question": "Output? \n const x = true; \n return <div>{x && <p>Hello</p>}</div>;", "options": ["<p>Hello</p>", "true", "false", "Nothing"], "answer": "<p>Hello</p>"},
    {"type": "mcq", "question": "Output? \n const x = 0; \n return <div>{x && <p>Hello</p>}</div>;", "options": ["<p>Hello</p>", "0", "Nothing", "Error"], "answer": "0"},
    {"type": "mcq", "question": "Output? \n const items = [1, 2]; \n return <ul>{items.map(i => <li>{i}</li>)}</ul>;", "options": ["<ul><li>1</li><li>2</li></ul>", "<ul>12</ul>", "Error (missing key)", "<ul>[1, 2]</ul>"], "answer": "<ul><li>1</li><li>2</li></ul>"},
    {"type": "mcq", "question": "What renders? \n function App() { const [count, setCount] = useState(0); return <button onClick={() => setCount(count + 1)}>{count}</button>; } \n (After 1 click)", "options": ["0", "1", "2", "Error"], "answer": "1"},
    {"type": "mcq", "question": "Output? \n const show = false; \n return <div>{show ? ''Yes'' : ''No''}</div>;", "options": ["Yes", "No", "false", "Nothing"], "answer": "No"},
    {"type": "mcq", "question": "Output? \n return <div>{undefined}</div>;", "options": ["undefined", "null", "Nothing (empty div)", "Error"], "answer": "Nothing (empty div)"},
    {"type": "mcq", "question": "Output? \n const val = ''0''; \n return <div>{val ? ''True'' : ''False''}</div>;", "options": ["True", "False", "0", "Error"], "answer": "True"},
    {"type": "mcq", "question": "Output? \n return <>{[<div key=''1''>A</div>, <div key=''2''>B</div>]}</>;", "options": ["AB", "A,B", "Error", "[Object object]"], "answer": "AB"},
    {"type": "mcq", "question": "Output? \n const props = { name: ''John'' }; \n return <div>{props.age || ''Unknown''}</div>;", "options": ["John", "Unknown", "undefined", "Error"], "answer": "Unknown"},
    {"type": "mcq", "question": "Output? \n return <div style={{ color: ''red'' }}>Text</div>;", "options": ["Red Text", "Error", "Black Text", "Text with style attribute"], "answer": "Red Text"}
  ]'::jsonb
);

-- Level 6: Browser & Performance (Hard MCQ)
INSERT INTO quizzes (title, description, role, level, questions) VALUES (
  'Browser & Performance',
  'Critical Rendering Path, Event Bubbling/Capturing, LocalStorage/Cookies, CORS, Web Vitals.',
  'Frontend Developer',
  6,
  '[
    {"type": "mcq", "question": "What is the Critical Rendering Path?", "options": ["HTML -> DOM -> CSSOM -> Render Tree -> Layout -> Paint", "HTML -> CSS -> JS -> Paint", "DOM -> HTML -> Paint", "Network -> Cache -> Paint"], "answer": "HTML -> DOM -> CSSOM -> Render Tree -> Layout -> Paint"},
    {"type": "mcq", "question": "In Event Bubbling, the event propagates from?", "options": ["Target to Window (upwards)", "Window to Target (downwards)", "Target only", "Siblings only"], "answer": "Target to Window (upwards)"},
    {"type": "mcq", "question": "Which storage persists even after the browser is closed?", "options": ["SessionStorage", "LocalStorage", "Cookies (Session)", "Memory"], "answer": "LocalStorage"},
    {"type": "mcq", "question": "What does CORS stand for?", "options": ["Cross-Origin Resource Sharing", "Cross-Origin Request Security", "Central Origin Resource System", "Computer Origin Resource Sharing"], "answer": "Cross-Origin Resource Sharing"},
    {"type": "mcq", "question": "Which Web Vital measures loading performance (Largest Contentful Paint)?", "options": ["FID", "CLS", "LCP", "TTFB"], "answer": "LCP"},
    {"type": "mcq", "question": "How do you stop event propagation?", "options": ["event.preventDefault()", "event.stopPropagation()", "event.halt()", "event.stop()"], "answer": "event.stopPropagation()"},
    {"type": "mcq", "question": "What is the maximum size of LocalStorage (approx)?", "options": ["4KB", "5MB", "50MB", "Unlimited"], "answer": "5MB"},
    {"type": "mcq", "question": "Which attribute allows a script to download in parallel but execute after HTML parsing?", "options": ["async", "defer", "sync", "parallel"], "answer": "defer"},
    {"type": "mcq", "question": "What causes Layout Thrashing?", "options": ["Reading and writing DOM properties in a loop", "Using Flexbox", "Loading too many images", "Using CSS variables"], "answer": "Reading and writing DOM properties in a loop"},
    {"type": "mcq", "question": "Which cookie flag prevents access via JavaScript?", "options": ["Secure", "HttpOnly", "SameSite", "NoScript"], "answer": "HttpOnly"}
  ]'::jsonb
);

-- Level 7: Debugging (Error Finding MCQ)
INSERT INTO quizzes (title, description, role, level, questions) VALUES (
  'Debugging',
  'Identify bugs in React code: mutating state, missing keys, infinite loops.',
  'Frontend Developer',
  7,
  '[
    {"type": "mcq", "question": "Identify the error: \n const [count, setCount] = useState(0); \n count = 5;", "options": ["Syntax Error", "Direct State Mutation", "Logic Error", "No Error"], "answer": "Direct State Mutation"},
    {"type": "mcq", "question": "Identify the error: \n useEffect(() => { setCount(count + 1) });", "options": ["Syntax Error", "Infinite Loop (Missing dependency array)", "Stale Closure", "No Error"], "answer": "Infinite Loop (Missing dependency array)"},
    {"type": "mcq", "question": "Identify the error: \n <ul>{items.map(item => <li>{item}</li>)}</ul>", "options": ["Syntax Error", "Missing ''key'' prop", "Invalid HTML", "No Error"], "answer": "Missing ''key'' prop"},
    {"type": "mcq", "question": "Identify the error: \n if (condition) { const [val, setVal] = useState(0); }", "options": ["Hook called conditionally", "Syntax Error", "Variable scope error", "No Error"], "answer": "Hook called conditionally"},
    {"type": "mcq", "question": "Identify the error: \n <button onclick={handleClick}>Click</button>", "options": ["Should be onClick (camelCase)", "Should be on-click", "Missing quotes", "No Error"], "answer": "Should be onClick (camelCase)"},
    {"type": "mcq", "question": "Identify the error: \n const ref = useRef(); \n ref = 5;", "options": ["Direct assignment to ref variable", "Should assign to ref.current", "Syntax Error", "No Error"], "answer": "Should assign to ref.current"},
    {"type": "mcq", "question": "Identify the error: \n return <h1>Hi</h1><h2>Bye</h2>;", "options": ["Adjacent JSX elements must be wrapped", "Syntax Error", "Invalid HTML", "No Error"], "answer": "Adjacent JSX elements must be wrapped"},
    {"type": "mcq", "question": "Identify the error: \n useEffect(async () => { await fetchData(); }, []);", "options": ["useEffect callback cannot be async", "Syntax Error", "Logic Error", "No Error"], "answer": "useEffect callback cannot be async"},
    {"type": "mcq", "question": "Identify the error: \n <input value={val} /> (without onChange)", "options": ["Uncontrolled component", "Read-only field (Console warning)", "Syntax Error", "No Error"], "answer": "Read-only field (Console warning)"},
    {"type": "mcq", "question": "Identify the error: \n style=\"color: red;\"", "options": ["Invalid JSX style syntax", "Should use className", "Missing braces", "No Error"], "answer": "Invalid JSX style syntax"}
  ]'::jsonb
);

-- Level 8: Advanced JS Triggers (Tricky Output MCQ)
INSERT INTO quizzes (title, description, role, level, questions) VALUES (
  'Advanced JS Triggers',
  'Event Loop, Closures, `this` context, Promise timing, and Asynchronous behavior.',
  'Frontend Developer',
  8,
  '[
    {"type": "mcq", "question": "Output? \n console.log(1); \n setTimeout(() => console.log(2), 0); \n console.log(3);", "options": ["1 2 3", "1 3 2", "3 2 1", "1 3"], "answer": "1 3 2"},
    {"type": "mcq", "question": "Output? \n for(var i=0; i<3; i++) setTimeout(() => console.log(i), 100);", "options": ["0 1 2", "3 3 3", "0 0 0", "Error"], "answer": "3 3 3"},
    {"type": "mcq", "question": "Output? \n console.log(typeof NaN);", "options": ["NaN", "undefined", "number", "object"], "answer": "number"},
    {"type": "mcq", "question": "Output? \n const obj = { a: 1, func: () => console.log(this.a) }; \n obj.func();", "options": ["1", "undefined", "null", "Error"], "answer": "undefined"},
    {"type": "mcq", "question": "Output? \n Promise.resolve(1).then(console.log); \n console.log(2);", "options": ["1 2", "2 1", "1", "2"], "answer": "2 1"},
    {"type": "mcq", "question": "Output? \n console.log([] == ![]);", "options": ["true", "false", "Error", "undefined"], "answer": "true"},
    {"type": "mcq", "question": "Output? \n function foo() { return { bar: \"hello\" }; } \n function bar() { return \n { bar: \"hello\" }; } \n console.log(typeof foo(), typeof bar());", "options": ["object object", "object undefined", "undefined object", "undefined undefined"], "answer": "object undefined"},
    {"type": "mcq", "question": "Output? \n (function(){ var a = b = 3; })(); \n console.log(typeof a, typeof b);", "options": ["undefined number", "number number", "undefined undefined", "number undefined"], "answer": "undefined number"},
    {"type": "mcq", "question": "Output? \n console.log(0.1 + 0.2 === 0.3);", "options": ["true", "false", "Error", "undefined"], "answer": "false"},
    {"type": "mcq", "question": "Output? \n let a = [1, 2, 3]; \n a[10] = 99; \n console.log(a.length);", "options": ["3", "10", "11", "Error"], "answer": "11"}
  ]'::jsonb
);

-- Level 9: Coding Challenge I (Write Code)
INSERT INTO quizzes (title, description, role, level, questions) VALUES (
  'Coding Challenge I',
  'DOM Manipulation or Utility Functions (e.g., debounce, deep clone).',
  'Frontend Developer',
  9,
  '[
    {
      "type": "code_challenge",
      "question": "Write a debounce function.",
      "starter_code": "function debounce(func, wait) {\n  // Your code here\n}",
      "test_case_description": "Input: Call 10 times quickly -> Output: Execute once after wait"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to deep clone an object.",
      "starter_code": "function deepClone(obj) {\n  // Your code here\n}",
      "test_case_description": "Input: {a: {b: 2}} -> Output: New object with same structure"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to flatten a nested array.",
      "starter_code": "function flatten(arr) {\n  // Your code here\n}",
      "test_case_description": "Input: [1, [2, [3]]] -> Output: [1, 2, 3]"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to get URL query parameters as an object.",
      "starter_code": "function getQueryParams(url) {\n  // Your code here\n}",
      "test_case_description": "Input: \"?name=John&age=30\" -> Output: {name: \"John\", age: \"30\"}"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to check if two objects are equal (shallow comparison).",
      "starter_code": "function shallowEqual(obj1, obj2) {\n  // Your code here\n}",
      "test_case_description": "Input: {a:1}, {a:1} -> Output: true"
    },
    {
      "type": "code_challenge",
      "question": "Write a throttle function.",
      "starter_code": "function throttle(func, limit) {\n  // Your code here\n}",
      "test_case_description": "Input: Call constantly -> Output: Execute at most once every limit ms"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to convert a string to camelCase.",
      "starter_code": "function toCamelCase(str) {\n  // Your code here\n}",
      "test_case_description": "Input: \"hello-world\" -> Output: \"helloWorld\""
    },
    {
      "type": "code_challenge",
      "question": "Write a function to generate a random hex color.",
      "starter_code": "function randomHex() {\n  // Your code here\n}",
      "test_case_description": "Output: \"#1A2B3C\" (valid hex)"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to find the unique values in an array.",
      "starter_code": "function unique(arr) {\n  // Your code here\n}",
      "test_case_description": "Input: [1, 2, 2, 3] -> Output: [1, 2, 3]"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to format a date as DD/MM/YYYY.",
      "starter_code": "function formatDate(date) {\n  // Your code here\n}",
      "test_case_description": "Input: Date Object -> Output: \"01/01/2023\""
    }
  ]'::jsonb
);

-- Level 10: Coding Challenge II (Write Code)
INSERT INTO quizzes (title, description, role, level, questions) VALUES (
  'Coding Challenge II',
  'React Logic: Custom hooks, component logic, and state management.',
  'Frontend Developer',
  10,
  '[
    {
      "type": "code_challenge",
      "question": "Write a custom hook `useFetch` to fetch data from a URL.",
      "starter_code": "function useFetch(url) {\n  // Your code here\n}",
      "test_case_description": "Input: url -> Output: { data, loading, error }"
    },
    {
      "type": "code_challenge",
      "question": "Write a Counter component with increment, decrement, and reset.",
      "starter_code": "function Counter() {\n  // Your code here\n}",
      "test_case_description": "UI Logic Check"
    },
    {
      "type": "code_challenge",
      "question": "Write a custom hook `useLocalStorage`.",
      "starter_code": "function useLocalStorage(key, initialValue) {\n  // Your code here\n}",
      "test_case_description": "Input: key, val -> Output: [storedValue, setValue]"
    },
    {
      "type": "code_challenge",
      "question": "Write a Toggle component.",
      "starter_code": "function Toggle() {\n  // Your code here\n}",
      "test_case_description": "Click -> Switch state true/false"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to validate an email address.",
      "starter_code": "function validateEmail(email) {\n  // Your code here\n}",
      "test_case_description": "Input: \"test@test.com\" -> Output: true"
    },
    {
      "type": "code_challenge",
      "question": "Write a custom hook `usePrevious` to get the previous value of a prop/state.",
      "starter_code": "function usePrevious(value) {\n  // Your code here\n}",
      "test_case_description": "Input: current -> Output: previous"
    },
    {
      "type": "code_challenge",
      "question": "Write a Todo List reducer function.",
      "starter_code": "function todoReducer(state, action) {\n  // Your code here\n}",
      "test_case_description": "Input: ADD_TODO -> Output: New state with todo"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to format currency.",
      "starter_code": "function formatCurrency(amount, currency) {\n  // Your code here\n}",
      "test_case_description": "Input: 1000, \"USD\" -> Output: \"$1,000.00\""
    },
    {
      "type": "code_challenge",
      "question": "Write a custom hook `useWindowSize`.",
      "starter_code": "function useWindowSize() {\n  // Your code here\n}",
      "test_case_description": "Output: { width, height } (updates on resize)"
    },
    {
      "type": "code_challenge",
      "question": "Write a simple Context Provider for a Theme (light/dark).",
      "starter_code": "function ThemeProvider({ children }) {\n  // Your code here\n}",
      "test_case_description": "Provides theme context to children"
    }
  ]'::jsonb
);
