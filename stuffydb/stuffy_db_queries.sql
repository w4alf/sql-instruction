

-- add a record to stuffy
INSERT INTO stuffy 
	(type,color,size,limbs)
VALUES
	('giant octopus', 'cream', 's', 8);

 UPDATE stuffy SET type='giant octopus',color= 'pale white', size ='s', limbs = 8 WHERE id=13;

    
 DELETE FROM stuffy WHERE type='giant octopus';
 
 
