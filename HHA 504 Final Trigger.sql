use e2e;

show tables;

select * from H1N1_Flu_Vaccines limit 100;

## Creating a trigger to reject a row that returns h1n1_concern greater than a value of 3. 
## The trigger should be called h1n1_concern_trigger and should have the following error message: 
## “H1N1 concern should be a numerical value between 0 and 3. Please try again.”

delimiter $$

CREATE TRIGGER h1n1_concern_trigger BEFORE INSERT ON H1N1_Flu_Vaccines 
FOR EACH ROW
BEGIN
IF NEW.h1n1_concern >=3 THEN
SIGNAL SQLSTATE '45000';
SET MESSAGE_TEXT = 'H1N1 concern should be a numerical value between 0 and 3. Please try again.' ;
END IF;
END; 

$$ delimiter



