select * from CAR;
select REGNO from CAR;
select colour, owner from CAR;

select REGNO from CAR
where COLOUR = 'BLUE';

select name,dob from DRIVER
where dob > '3 Dec 1900';

select name, dob from DRIVER
where dob between '1 Jan 1985' and '31 Dec 1999';

select regno from car
where owner is null;

select regno from car
where owner is not null;

select regno
from car
where colour LIKE '%';

SELECT regno
FROM   CAR
WHERE  colour = 'BLUE' 
AND    regno LIKE '%5%'
AND    owner LIKE 'Bob %'
;