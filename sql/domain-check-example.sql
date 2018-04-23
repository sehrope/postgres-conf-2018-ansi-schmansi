=> SELECT 'foo'::app_username;
 app_username 
--------------
 foo
(1 row)

Time: 2.001 ms
=> SELECT 'this is not valid'::app_username;
ERROR:  23514: value for domain app_username violates check constraint "app_username_ck_valid"
SCHEMA NAME:  public
DATATYPE NAME:  app_username
CONSTRAINT NAME:  app_username_ck_valid
LOCATION:  ExecEvalConstraintCheck, execExprInterp.c:3072
Time: 2.371 ms
