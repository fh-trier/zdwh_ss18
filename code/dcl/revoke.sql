-- #################### REVOKE #######################
-- Allgemeine Syntax
REVOKE [ALL, INSERT, SELECT, DELETE, UPDATE]
ON [(tbl1, view1,..)]
FROM [(user1, user2,..)];

-- Beispiel 1
REVOKE ALL
ON artikel
FROM scott;