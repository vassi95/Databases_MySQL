use school_sport_clubs1;
drop procedure getPaymentPeriod;
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