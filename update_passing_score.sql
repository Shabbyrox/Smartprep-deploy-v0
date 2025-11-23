-- Update default value for future quizzes
alter table quizzes alter column passing_score set default 50;

-- Update existing quizzes to 50%
update quizzes set passing_score = 50;
