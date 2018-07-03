-- #################### GRANT ########################
-- Allgemeine Syntax
GRANT [ALL, INSERT, SELECT, DELETE, UPDATE[(col1, col2,..)]..]
ON [(tbl1, view1,..)]
TO [(user1, user2,..)]
[WITH GRANT OPTION];

-- Beispiel 1
GRANT ALL
ON artikel
TO scott
WITH GRANT OPTION;