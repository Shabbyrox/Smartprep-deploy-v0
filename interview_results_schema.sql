-- Create a table to store interview results
CREATE TABLE interview_results (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES auth.users(id) NOT NULL,
    job_role TEXT NOT NULL,
    score INTEGER NOT NULL,
    conversation_history JSONB,
    created_at TIMESTAMPTZ DEFAULT now()
);

-- Enable Row Level Security
ALTER TABLE interview_results ENABLE ROW LEVEL SECURITY;

-- Create a policy that allows users to insert their own interview results
CREATE POLICY "Users can insert their own interview results"
ON interview_results
FOR INSERT
WITH CHECK (auth.uid() = user_id);

-- Create a policy that allows users to select their own interview results
CREATE POLICY "Users can select their own interview results"
ON interview_results
FOR SELECT
USING (auth.uid() = user_id);
