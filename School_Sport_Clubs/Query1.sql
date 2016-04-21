ALTER TABLE student_sportgroups
DROP FOREIGN KEY student_sportgroups_ibfk_2;
ALTER TABLE student_sportgroups
ADD CONSTRAINT FOREIGN KEY `sportgroup_id_key` (sportGroup_id) references sportgroups(id)
ON UPDATE CASCADE
ON DELETE CASCADE;

DELETE  from sportgroups where id=4;


ALTER TABLE taxespayments
DROP FOREIGN KEY taxespayments_ibfk_2;
ALTER TABLE taxespayments
ADD CONSTRAINT FOREIGN KEY `tax_id_key` (group_id) references sportgroups(id)
ON UPDATE CASCADE
ON DELETE CASCADE;

DELETE  from sportgroups where id=2;