-- Add new columns to quizzes table
alter table quizzes add column role text not null default 'General';
alter table quizzes add column level integer not null default 1;
alter table quizzes add column passing_score integer not null default 70; -- Percentage required to pass
