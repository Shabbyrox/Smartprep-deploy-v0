-- Level 1: Math & Stats Fundamentals (Easy MCQ)
INSERT INTO quizzes (title, description, role, level, questions) VALUES (
  'Math & Stats Fundamentals',
  'Mean/Median/Mode, Standard Deviation, Probability basics, and Types of Data.',
  'Data Scientist',
  1,
  '[
    {"type": "mcq", "question": "What is the ''Mean'' of a dataset?", "options": ["The middle value", "The most frequent value", "The average value", "The range"], "answer": "The average value"},
    {"type": "mcq", "question": "Which measure is most affected by outliers?", "options": ["Median", "Mode", "Mean", "Interquartile Range"], "answer": "Mean"},
    {"type": "mcq", "question": "What type of data is ''Gender'' (Male/Female)?", "options": ["Ordinal", "Nominal", "Interval", "Ratio"], "answer": "Nominal"},
    {"type": "mcq", "question": "What does Standard Deviation measure?", "options": ["Central tendency", "Spread or dispersion", "Skewness", "Kurtosis"], "answer": "Spread or dispersion"},
    {"type": "mcq", "question": "What is the probability of rolling a 6 on a fair die?", "options": ["1/2", "1/6", "1/3", "1/4"], "answer": "1/6"},
    {"type": "mcq", "question": "What type of data is ''Customer Satisfaction Rating'' (1-5 stars)?", "options": ["Nominal", "Ordinal", "Continuous", "Binary"], "answer": "Ordinal"},
    {"type": "mcq", "question": "If events A and B are independent, P(A and B) = ?", "options": ["P(A) + P(B)", "P(A) * P(B)", "P(A) / P(B)", "P(A) - P(B)"], "answer": "P(A) * P(B)"},
    {"type": "mcq", "question": "What is the Median of [1, 3, 3, 6, 7, 8, 9]?", "options": ["3", "6", "7", "5.2"], "answer": "6"},
    {"type": "mcq", "question": "Which distribution is bell-shaped and symmetric?", "options": ["Uniform", "Binomial", "Normal", "Poisson"], "answer": "Normal"},
    {"type": "mcq", "question": "What is the Mode of [2, 4, 4, 6, 8]?", "options": ["2", "4", "6", "8"], "answer": "4"}
  ]'::jsonb
);

-- Level 2: Python for Data (Easy MCQ)
INSERT INTO quizzes (title, description, role, level, questions) VALUES (
  'Python for Data',
  'NumPy arrays, Pandas DataFrames basics, and Matplotlib/Seaborn syntax.',
  'Data Scientist',
  2,
  '[
    {"type": "mcq", "question": "Which library is primarily used for structured data manipulation in Python?", "options": ["NumPy", "Pandas", "Matplotlib", "Scikit-learn"], "answer": "Pandas"},
    {"type": "mcq", "question": "How do you select a column ''Age'' from a DataFrame `df`?", "options": ["df.select(''Age'')", "df[''Age'']", "df.get(''Age'')", "df.col(''Age'')"], "answer": "df[''Age'']"},
    {"type": "mcq", "question": "Which NumPy function creates an array of zeros?", "options": ["np.empty()", "np.zeros()", "np.null()", "np.void()"], "answer": "np.zeros()"},
    {"type": "mcq", "question": "What does `df.head()` do?", "options": ["Returns the first 5 rows", "Returns the column names", "Returns the last 5 rows", "Returns summary statistics"], "answer": "Returns the first 5 rows"},
    {"type": "mcq", "question": "Which function is used to read a CSV file in Pandas?", "options": ["pd.read_file()", "pd.import_csv()", "pd.read_csv()", "pd.load_csv()"], "answer": "pd.read_csv()"},
    {"type": "mcq", "question": "In Matplotlib, which function displays the plot?", "options": ["plt.show()", "plt.display()", "plt.render()", "plt.draw()"], "answer": "plt.show()"},
    {"type": "mcq", "question": "How do you check for missing values in a DataFrame?", "options": ["df.missing()", "df.isnull()", "df.check_na()", "df.empty()"], "answer": "df.isnull()"},
    {"type": "mcq", "question": "Which attribute gives the dimensions of a NumPy array?", "options": [".size", ".shape", ".dim", ".length"], "answer": ".shape"},
    {"type": "mcq", "question": "What is the main difference between a List and a NumPy Array?", "options": ["Arrays are slower", "Arrays are homogeneous (same type)", "Lists are fixed size", "No difference"], "answer": "Arrays are homogeneous (same type)"},
    {"type": "mcq", "question": "How do you drop a row with missing values in Pandas?", "options": ["df.drop_na()", "df.dropna()", "df.remove_null()", "df.delete_na()"], "answer": "df.dropna()"}
  ]'::jsonb
);

-- Level 3: ML Algorithms I (Hard MCQ)
INSERT INTO quizzes (title, description, role, level, questions) VALUES (
  'ML Algorithms I',
  'Supervised Learning (Linear Regression, Logistic Regression, Decision Trees), Overfitting vs Underfitting.',
  'Data Scientist',
  3,
  '[
    {"type": "mcq", "question": "Which algorithm is used for classification problems?", "options": ["Linear Regression", "Logistic Regression", "K-Means", "PCA"], "answer": "Logistic Regression"},
    {"type": "mcq", "question": "What happens when a model has high variance?", "options": ["Underfitting", "Overfitting", "Perfect fit", "Bias"], "answer": "Overfitting"},
    {"type": "mcq", "question": "In Linear Regression, what does the ''slope'' represent?", "options": ["The intercept", "The rate of change of Y with respect to X", "The error term", "The mean of Y"], "answer": "The rate of change of Y with respect to X"},
    {"type": "mcq", "question": "What is the purpose of a Train-Test split?", "options": ["To train the model faster", "To evaluate model performance on unseen data", "To increase data size", "To fix missing values"], "answer": "To evaluate model performance on unseen data"},
    {"type": "mcq", "question": "Which metric is commonly used for Regression problems?", "options": ["Accuracy", "F1 Score", "Mean Squared Error (MSE)", "Precision"], "answer": "Mean Squared Error (MSE)"},
    {"type": "mcq", "question": "Decision Trees split data based on maximizing what?", "options": ["Entropy", "Information Gain", "Gini Impurity", "All of the above"], "answer": "All of the above"},
    {"type": "mcq", "question": "What is Regularization (L1/L2) used for?", "options": ["To increase model complexity", "To prevent overfitting", "To speed up training", "To handle missing data"], "answer": "To prevent overfitting"},
    {"type": "mcq", "question": "High Bias in a model leads to?", "options": ["Overfitting", "Underfitting", "Good generalization", "High variance"], "answer": "Underfitting"},
    {"type": "mcq", "question": "Which of these is a parametric model?", "options": ["K-Nearest Neighbors", "Decision Tree", "Linear Regression", "Random Forest"], "answer": "Linear Regression"},
    {"type": "mcq", "question": "What is the output of Logistic Regression?", "options": ["Continuous value", "Probability (0 to 1)", "Cluster ID", "Image"], "answer": "Probability (0 to 1)"}
  ]'::jsonb
);

-- Level 4: ML Algorithms II (Hard MCQ)
INSERT INTO quizzes (title, description, role, level, questions) VALUES (
  'ML Algorithms II',
  'Unsupervised Learning (K-Means, PCA), SVM, Ensemble Methods.',
  'Data Scientist',
  4,
  '[
    {"type": "mcq", "question": "What is the main goal of PCA (Principal Component Analysis)?", "options": ["Clustering", "Dimensionality Reduction", "Classification", "Regression"], "answer": "Dimensionality Reduction"},
    {"type": "mcq", "question": "How does K-Means clustering work?", "options": ["By finding hyperplanes", "By minimizing distance to centroids", "By building trees", "By maximizing margin"], "answer": "By minimizing distance to centroids"},
    {"type": "mcq", "question": "What is a ''Support Vector'' in SVM?", "options": ["The centroid of a cluster", "Data points closest to the decision boundary", "The output label", "The error term"], "answer": "Data points closest to the decision boundary"},
    {"type": "mcq", "question": "Random Forest is an example of which technique?", "options": ["Boosting", "Bagging", "Clustering", "Dimensionality Reduction"], "answer": "Bagging"},
    {"type": "mcq", "question": "Which algorithm builds models sequentially to correct previous errors?", "options": ["Random Forest", "Gradient Boosting", "K-Means", "Naive Bayes"], "answer": "Gradient Boosting"},
    {"type": "mcq", "question": "What is the ''Elbow Method'' used for?", "options": ["Tuning SVM kernel", "Choosing optimal K in K-Means", "Pruning Decision Trees", "Selecting features"], "answer": "Choosing optimal K in K-Means"},
    {"type": "mcq", "question": "What is the kernel trick in SVM?", "options": ["To handle missing data", "To map data to higher dimensions for linear separation", "To compress data", "To speed up training"], "answer": "To map data to higher dimensions for linear separation"},
    {"type": "mcq", "question": "Which is an Unsupervised Learning algorithm?", "options": ["Linear Regression", "K-Means", "Logistic Regression", "Random Forest"], "answer": "K-Means"},
    {"type": "mcq", "question": "What does t-SNE do?", "options": ["Classification", "Visualizing high-dimensional data", "Regression", "Clustering only"], "answer": "Visualizing high-dimensional data"},
    {"type": "mcq", "question": "Ensemble methods combine multiple models to?", "options": ["Increase bias", "Improve performance and stability", "Reduce training time", "Simplify the model"], "answer": "Improve performance and stability"}
  ]'::jsonb
);

-- Level 5: Code Output (Code Output MCQ)
INSERT INTO quizzes (title, description, role, level, questions) VALUES (
  'Code Output',
  'Predict the output of Pandas operations or NumPy calculations.',
  'Data Scientist',
  5,
  '[
    {"type": "mcq", "question": "Output? \n import numpy as np \n a = np.array([1, 2, 3]) \n print(a + 1)", "options": ["[1, 2, 3]", "[2, 3, 4]", "Error", "123"], "answer": "[2, 3, 4]"},
    {"type": "mcq", "question": "Output? \n df = pd.DataFrame({''A'': [1, 2], ''B'': [3, 4]}) \n print(df.shape)", "options": ["(2, 2)", "(4,)", "2", "(1, 2)"], "answer": "(2, 2)"},
    {"type": "mcq", "question": "Output? \n s = pd.Series([1, 2, 3], index=[''a'', ''b'', ''c'']) \n print(s[''b''])", "options": ["1", "2", "3", "Error"], "answer": "2"},
    {"type": "mcq", "question": "Output? \n import numpy as np \n print(np.arange(3))", "options": ["[1, 2, 3]", "[0, 1, 2]", "[0, 1, 2, 3]", "Error"], "answer": "[0, 1, 2]"},
    {"type": "mcq", "question": "Output? \n df[df[''A''] > 5] (if all A values are < 5)", "options": ["Empty DataFrame", "Error", "None", "All rows"], "answer": "Empty DataFrame"},
    {"type": "mcq", "question": "Output? \n np.mean([1, 2, 3, 4])", "options": ["2.0", "2.5", "3.0", "10"], "answer": "2.5"},
    {"type": "mcq", "question": "Output? \n df.iloc[0] returns?", "options": ["First column", "First row", "First cell", "Header"], "answer": "First row"},
    {"type": "mcq", "question": "Output? \n pd.isna(np.nan)", "options": ["True", "False", "Error", "NaN"], "answer": "True"},
    {"type": "mcq", "question": "Output? \n np.array([1, 2]) * np.array([3, 4])", "options": ["[3, 8]", "[4, 6]", "7", "Error"], "answer": "[3, 8]"},
    {"type": "mcq", "question": "Output? \n df.drop(''A'', axis=1) drops?", "options": ["Row A", "Column A", "Cell A", "Nothing"], "answer": "Column A"}
  ]'::jsonb
);

-- Level 6: Deep Learning & NLP (Hard MCQ)
INSERT INTO quizzes (title, description, role, level, questions) VALUES (
  'Deep Learning & NLP',
  'Neural Networks, Activation Functions, Tokenization, and Transformers.',
  'Data Scientist',
  6,
  '[
    {"type": "mcq", "question": "What is the purpose of an Activation Function?", "options": ["To introduce non-linearity", "To speed up training", "To initialize weights", "To normalize data"], "answer": "To introduce non-linearity"},
    {"type": "mcq", "question": "Which activation function is commonly used in the output layer for binary classification?", "options": ["ReLU", "Softmax", "Sigmoid", "Tanh"], "answer": "Sigmoid"},
    {"type": "mcq", "question": "What does CNN stand for?", "options": ["Central Neural Network", "Convolutional Neural Network", "Computer Neural Network", "Continuous Neural Network"], "answer": "Convolutional Neural Network"},
    {"type": "mcq", "question": "What is Tokenization in NLP?", "options": ["Encrypting text", "Splitting text into smaller units (words/subwords)", "Translating text", "Summarizing text"], "answer": "Splitting text into smaller units (words/subwords)"},
    {"type": "mcq", "question": "What is the Vanishing Gradient problem?", "options": ["Gradients become too large", "Gradients become too small, stopping learning", "Loss becomes zero", "Weights become zero"], "answer": "Gradients become too small, stopping learning"},
    {"type": "mcq", "question": "What is a Transformer model primarily based on?", "options": ["RNNs", "LSTMs", "Attention Mechanism", "CNNs"], "answer": "Attention Mechanism"},
    {"type": "mcq", "question": "What does BERT stand for?", "options": ["Bidirectional Encoder Representations from Transformers", "Binary Encoder Recurrent Transformer", "Basic English Representation Tool", "Big Encoder Random Transformer"], "answer": "Bidirectional Encoder Representations from Transformers"},
    {"type": "mcq", "question": "Which layer is used to prevent overfitting in Neural Networks?", "options": ["Dense", "Dropout", "Convolution", "Pooling"], "answer": "Dropout"},
    {"type": "mcq", "question": "What is Word2Vec used for?", "options": ["Text classification", "Generating word embeddings", "Machine Translation", "Speech Recognition"], "answer": "Generating word embeddings"},
    {"type": "mcq", "question": "What is the role of the Loss Function?", "options": ["To measure the error between predicted and actual values", "To update weights", "To activate neurons", "To preprocess data"], "answer": "To measure the error between predicted and actual values"}
  ]'::jsonb
);

-- Level 7: Debugging Models (Error Finding MCQ)
INSERT INTO quizzes (title, description, role, level, questions) VALUES (
  'Debugging Models',
  'Identify mistakes in model training code: Data leakage, wrong loss function, etc.',
  'Data Scientist',
  7,
  '[
    {"type": "mcq", "question": "Identify the error: Scaling data AFTER splitting into Train/Test.", "options": ["Correct approach", "Data Leakage", "Inefficient", "No effect"], "answer": "Correct approach"},
    {"type": "mcq", "question": "Identify the error: Scaling data BEFORE splitting into Train/Test.", "options": ["Correct approach", "Data Leakage", "Inefficient", "No effect"], "answer": "Data Leakage"},
    {"type": "mcq", "question": "Identify the error: Using ''Accuracy'' for a highly imbalanced dataset.", "options": ["Good metric", "Misleading metric", "Causes overfitting", "Causes underfitting"], "answer": "Misleading metric"},
    {"type": "mcq", "question": "Identify the error: Using MSE Loss for a Classification problem.", "options": ["Correct", "Wrong Loss Function (Should use Cross-Entropy)", "Causes Data Leakage", "No effect"], "answer": "Wrong Loss Function (Should use Cross-Entropy)"},
    {"type": "mcq", "question": "Identify the error: Training accuracy is 99%, Test accuracy is 50%.", "options": ["Underfitting", "Overfitting", "Perfect Model", "Data Leakage"], "answer": "Overfitting"},
    {"type": "mcq", "question": "Identify the error: Not handling missing values before training.", "options": ["Model will likely crash or perform poorly", "Model handles it automatically", "Improves accuracy", "No effect"], "answer": "Model will likely crash or perform poorly"},
    {"type": "mcq", "question": "Identify the error: Using the Test set to tune Hyperparameters.", "options": ["Correct", "Data Leakage (Overfitting to Test set)", "Underfitting", "Standard practice"], "answer": "Data Leakage (Overfitting to Test set)"},
    {"type": "mcq", "question": "Identify the error: One-hot encoding a high-cardinality categorical feature (e.g., User ID).", "options": ["Good practice", "Curse of Dimensionality / Memory issue", "Improves model", "No effect"], "answer": "Curse of Dimensionality / Memory issue"},
    {"type": "mcq", "question": "Identify the error: Predicting ''Future'' data using ''Future'' features.", "options": ["Look-ahead Bias / Data Leakage", "Correct", "Time Series Analysis", "Forecasting"], "answer": "Look-ahead Bias / Data Leakage"},
    {"type": "mcq", "question": "Identify the error: Learning Rate too high.", "options": ["Converges fast", "Overshoots minimum / Diverges", "Stuck in local minima", "No learning"], "answer": "Overshoots minimum / Diverges"}
  ]'::jsonb
);

-- Level 8: Data Logic (Tricky Output MCQ)
INSERT INTO quizzes (title, description, role, level, questions) VALUES (
  'Data Logic',
  'Confusion Matrices, Precision vs Recall, and Bias/Variance logic.',
  'Data Scientist',
  8,
  '[
    {"type": "mcq", "question": "If you want to minimize False Negatives (e.g., Cancer detection), which metric to optimize?", "options": ["Precision", "Recall", "Accuracy", "Specificity"], "answer": "Recall"},
    {"type": "mcq", "question": "If you want to minimize False Positives (e.g., Spam filter), which metric to optimize?", "options": ["Precision", "Recall", "Accuracy", "Sensitivity"], "answer": "Precision"},
    {"type": "mcq", "question": "What does a Confusion Matrix show?", "options": ["True/False Positives/Negatives", "Training time", "Feature importance", "Loss curve"], "answer": "True/False Positives/Negatives"},
    {"type": "mcq", "question": "High Bias and Low Variance indicates?", "options": ["Overfitting", "Underfitting", "Optimal Model", "Random Model"], "answer": "Underfitting"},
    {"type": "mcq", "question": "Low Bias and High Variance indicates?", "options": ["Overfitting", "Underfitting", "Optimal Model", "Random Model"], "answer": "Overfitting"},
    {"type": "mcq", "question": "What is the F1 Score?", "options": ["Arithmetic mean of Precision and Recall", "Harmonic mean of Precision and Recall", "Sum of Precision and Recall", "Difference"], "answer": "Harmonic mean of Precision and Recall"},
    {"type": "mcq", "question": "If a model predicts constant class 0 for a 90% class 0 dataset, what is the accuracy?", "options": ["10%", "50%", "90%", "100%"], "answer": "90%"},
    {"type": "mcq", "question": "What is ROC-AUC?", "options": ["Area Under the Receiver Operating Characteristic Curve", "Accuracy Under Curve", "Rate of Change", "Regression Output Curve"], "answer": "Area Under the Receiver Operating Characteristic Curve"},
    {"type": "mcq", "question": "Type I Error is?", "options": ["False Positive", "False Negative", "True Positive", "True Negative"], "answer": "False Positive"},
    {"type": "mcq", "question": "Type II Error is?", "options": ["False Positive", "False Negative", "True Positive", "True Negative"], "answer": "False Negative"}
  ]'::jsonb
);

-- Level 9: Coding Challenge I (Write Code)
INSERT INTO quizzes (title, description, role, level, questions) VALUES (
  'Coding Challenge I',
  'Statistical Implementation: Euclidean Distance, Standard Scaler, etc.',
  'Data Scientist',
  9,
  '[
    {
      "type": "code_challenge",
      "question": "Write a function to calculate Euclidean Distance between two points.",
      "starter_code": "def euclidean_distance(p1, p2):\n  # Your code here\n",
      "test_case_description": "Input: [0,0], [3,4] -> Output: 5.0"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to calculate the Mean of a list.",
      "starter_code": "def calculate_mean(data):\n  # Your code here\n",
      "test_case_description": "Input: [1, 2, 3] -> Output: 2.0"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to implement Min-Max Scaling.",
      "starter_code": "def min_max_scale(data):\n  # Your code here\n",
      "test_case_description": "Input: [10, 20, 30] -> Output: [0.0, 0.5, 1.0]"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to calculate Dot Product of two vectors.",
      "starter_code": "def dot_product(v1, v2):\n  # Your code here\n",
      "test_case_description": "Input: [1, 2], [3, 4] -> Output: 11"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to calculate Variance.",
      "starter_code": "def calculate_variance(data):\n  # Your code here\n",
      "test_case_description": "Input: [1, 2, 3] -> Output: 0.66..."
    },
    {
      "type": "code_challenge",
      "question": "Write a function to calculate Manhattan Distance.",
      "starter_code": "def manhattan_distance(p1, p2):\n  # Your code here\n",
      "test_case_description": "Input: [0,0], [3,4] -> Output: 7"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to implement ReLU activation.",
      "starter_code": "def relu(x):\n  # Your code here\n",
      "test_case_description": "Input: -5 -> Output: 0, Input: 5 -> Output: 5"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to implement Sigmoid activation.",
      "starter_code": "def sigmoid(x):\n  # Your code here\n",
      "test_case_description": "Input: 0 -> Output: 0.5"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to calculate RMSE (Root Mean Squared Error).",
      "starter_code": "def calculate_rmse(y_true, y_pred):\n  # Your code here\n",
      "test_case_description": "Input: [1,2], [1,2] -> Output: 0.0"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to find the Median.",
      "starter_code": "def calculate_median(data):\n  # Your code here\n",
      "test_case_description": "Input: [1, 3, 2] -> Output: 2"
    }
  ]'::jsonb
);

-- Level 10: Coding Challenge II (Write Code)
INSERT INTO quizzes (title, description, role, level, questions) VALUES (
  'Coding Challenge II',
  'Data Manipulation: Missing values, One-hot encoding, etc.',
  'Data Scientist',
  10,
  '[
    {
      "type": "code_challenge",
      "question": "Write a function to fill missing values with the mean.",
      "starter_code": "def fill_na_mean(data):\n  # Your code here\n",
      "test_case_description": "Input: [1, None, 3] -> Output: [1, 2, 3]"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to One-Hot Encode a list of categories.",
      "starter_code": "def one_hot_encode(data):\n  # Your code here\n",
      "test_case_description": "Input: [''A'', ''B''] -> Output: [[1,0], [0,1]]"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to split data into Train and Test sets.",
      "starter_code": "def train_test_split(data, test_size):\n  # Your code here\n",
      "test_case_description": "Splits list based on ratio"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to calculate Correlation Coefficient (Pearson).",
      "starter_code": "def correlation(x, y):\n  # Your code here\n",
      "test_case_description": "Input: x, y -> Output: -1 to 1"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to create a Confusion Matrix.",
      "starter_code": "def confusion_matrix(y_true, y_pred):\n  # Your code here\n",
      "test_case_description": "Output: [[TP, FN], [FP, TN]]"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to drop duplicates from a list.",
      "starter_code": "def drop_duplicates(data):\n  # Your code here\n",
      "test_case_description": "Input: [1, 1, 2] -> Output: [1, 2]"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to normalize text (lowercase, remove punctuation).",
      "starter_code": "def normalize_text(text):\n  # Your code here\n",
      "test_case_description": "Input: \"Hello!\" -> Output: \"hello\""
    },
    {
      "type": "code_challenge",
      "question": "Write a function to calculate Moving Average.",
      "starter_code": "def moving_average(data, window):\n  # Your code here\n",
      "test_case_description": "Input: [1, 2, 3], 2 -> Output: [1.5, 2.5]"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to sample N random elements from a list.",
      "starter_code": "def random_sample(data, n):\n  # Your code here\n",
      "test_case_description": "Returns n random items"
    },
    {
      "type": "code_challenge",
      "question": "Write a function to calculate Entropy of a dataset.",
      "starter_code": "def calculate_entropy(labels):\n  # Your code here\n",
      "test_case_description": "Input: [0, 0, 1, 1] -> Output: 1.0"
    }
  ]'::jsonb
);
