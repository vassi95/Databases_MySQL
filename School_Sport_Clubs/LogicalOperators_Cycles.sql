use school_sport_clubs1;
delimiter |
CREATE procedure checkMothTax(IN studId INT, IN groupId INT, IN paymentMonth INT, IN paymentYear INT)
BEGIN
DECLARE result char(1);
SET result = 0;
	IF( (SELECT paymentAmount
		FROM taxespayments
		WHERE student_id = studId
		AND group_id = groupId
		AND MONTH = paymentMonth
		AND year = paymentYear) IS NOT NULL)
    THEN
		SET result = 1;
	ELSE
		SET result = 0;
    END IF;
    
SELECT result as IsTaxPayed;
end;
|
delimiter ;

CALL `school_sport_clubs1`.`checkMothTax`(1, 1,1,2015);


delimiter |
CREATE procedure getPaymentPeriod(IN studId INT, IN groupId INT, IN paymentYear INT)
BEGIN
DECLARE countOfMonths tinyint;
DECLARE monthStr VARCHAR(10);
DECLARE yearStr varchar(10);
SET monthStr = 'MONTH';
SET yearStr = 'YEAR';

	SELECT COUNT(*)
    INTO countOfMonths
    FROM taxespayments
    WHERE student_id = studId
    AND group_id = groupId
    AND year = paymentYear;
    
    CASE countOfMonths
    WHEN 0 THEN SELECT 'This student has not paid for this group/year!' as PAYMENT_PERIOD;
    WHEN 1 THEN SELECT concat('ONE_', monthStr) as PAYMENT_PERIOD;
    WHEN 3 THEN SELECT concat('THREE_',monthStr, 'S') as PAYMENT_PERIOD;
    WHEN 6 THEN SELECT concat('SIX_',monthStr,'S') as PAYMENT_PERIOD;
    WHEN 12 THEN SELECT yearStr as PAYMENT_PERIOD;
    ELSE
		SELECT 	concat(countOfMonths,monthStr,'S') as PAYMENT_PERIOD;
	END CASE;
END;
|
DELIMITER ;

CALL getPaymentPeriod(1,1, 2016);




delimiter |
CREATE procedure getAllPaymentsAmount(IN firstMonth INT, IN secMonth INT, IN paymentYear INT, IN studId INT)
BEGIN
	DECLARE iterator int;
	IF(firstMonth >= secMonth)
    THEN 
		SELECT 'Please enter correct months!' as RESULT;
	ELSE IF((SELECT COUNT(*)
			FROM taxesPayments
			WHERE student_id =studId ) = 0)
        THEN SELECT 'Please enter correct student_id!' as RESULT;
		ELSE
	
	SET ITERATOR = firstMonth;

		WHILE(iterator >= firstMonth AND iterator <= secMonth)
		DO
			SELECT student_id, group_id, paymentAmount, month
			FROM taxespayments
			WHERE student_id = studId
			AND year = paymentYear
			AND month = iterator;
    
			SET iterator = iterator + 1;
		END WHILE;
		END IF;
    
    END IF;
END;
|
DELIMITER ;

CALL getAllPaymentsAmount(1,6,2015,1);





