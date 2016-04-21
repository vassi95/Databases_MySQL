use transaction_test;

begin;
use transaction_test;
UPDATE customer_accounts 
SET amount = amount - 50 WHERE id = 1;

UPDATE customer_accounts
SET amount = amount + 50 
WHERE id = 2;

commit;


