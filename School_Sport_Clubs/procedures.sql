delimiter |
create procedure getAllSportGroupsWithSports()
begin
SELECT sg.location as locationOfGroup,
sg.dayOfWeek as trainingDay,
sg.hourOfTraining as trainingHour,
sp.name as sportName
FROM sportgroups as sg JOIN sports as sp
ON sg.sport_id = sp.id;
end
|
delimiter ;

CALL getAllSportGroupsWithSports();



delimiter |
create procedure inParamProcWithChangedParam(IN nameParam VARCHAR(255))
begin
SET nameParam = 'Ivan Petkov';
end;
|
delimiter ;

SET @testCoachName = 'Иван Тодоров Петров';
call inParamProcWithChangedParam(@testCoachName);
SELECT  @testCoachName;



delimiter |
create procedure outParamProc(OUT nameParam VARCHAR(255))
begin
SELECT nameParam; #only for test
SET nameParam = 'Иван Тодоров Петров';
end;
|
delimiter ;
SET @testOutParam = 'Some name';
call outParamProc(@testOutParam);



delimiter |
create procedure inoutParamProc(INOUT nameParam VARCHAR(255))
begin
SELECT nameParam; #only for test
SET nameParam = 'Иван Тодоров Петров';
end;
|
delimiter ;

SET @testinOutParam = 'Some name';
call inoutParamProc(@testinOutParam);
SELECT @testinOutParam;



