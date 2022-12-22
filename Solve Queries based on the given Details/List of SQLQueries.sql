----------------------- SQL QUERIES OF THE GIVEN TABLES--------------------------

-- Creating a new DB

CREATE DATABASE WinapppCS      

USE WinapppCS

-- Creatind a Table "Studies"

CREATE TABLE Studies          
(
PNAME varchar(50),
INSTITUTE varchar(50),
COURSE varchar(50),
COURSE_FEE int
)

-- Inserting the values in its Columns

INSERT INTO Studies

SELECT 'ANAND','SABHARI','PGDCA',4500 UNION ALL
SELECT 'ALTAF','COIT','DCA',7200 UNION ALL	
SELECT 'JULIANA','BDPS','MCA',22000 UNION ALL
SELECT 'KAMALA','PRAGATHI','DCA',5000 UNION ALL
SELECT 'MARY','SABHARI','PGDCA ',4500 UNION ALL
SELECT 'NELSON','PRAGATHI','DAP',6200 UNION ALL
SELECT 'PATRICK','PRAGATHI','DCAP',5200 UNION ALL
SELECT 'QADIR','APPLE','HDCA',14000 UNION ALL
SELECT 'RAMESH','SABHARI','PGDCA',4500 UNION ALL
SELECT 'REBECCA','BRILLIANT','DCAP',11000 UNION ALL
SELECT 'REMITHA','BDPS','DCS',6000 UNION ALL
SELECT 'REVATHI','SABHARI','DAP',5000 UNION ALL
SELECT 'VIJAYA','BDPS','DCA',48000

SELECT * FROM Studies

-- Creating another Table "Software" 

CREATE TABLE Software 
(
PNAME varchar(20), 
TITLE varchar(20), 
DEVELOPIN varchar(20), 
SCOST decimal(10,2),  ----- Decimal So,
DCOST int, 
SOLD int
)

-- Inserting the Values into the Cloumns of Software

INSERT INTO Software

SELECT 'MARY','README','CPP',300, 1200, 84 UNION ALL
SELECT 'ANAND','PARACHUTES','BASIC',399.95, 6000, 43 UNION ALL
SELECT 'ANAND','VIDEO TITLING','PASCAL',7500, 16000, 9 UNION ALL
SELECT 'JULIANA','INVENTORY','COBOL',3000, 3500, 0 UNION ALL
SELECT 'KAMALA','PAYROLL PKG.','DBASE',9000, 20000, 7 UNION ALL
SELECT 'MARY','FINANCIAL ACCT.','ORACLE',18000, 85000, 4 UNION ALL
SELECT 'MARY','CODE GENERATOR','C',4500, 20000, 23 UNION ALL
SELECT 'PATTRICK','README','CPP',300, 1200, 84 UNION ALL
SELECT 'QADIR','BOMBS AWAY','ASSEMBLY',750, 3000, 11 UNION ALL
SELECT 'QADIR','VACCINES','C',1900, 3100, 21 UNION ALL
SELECT 'RAMESH','HOTEL MGMT.','DBASE',13000, 35000, 4 UNION ALL
SELECT 'RAMESH','DEAD LEE','PASCAL',599.95, 4500, 73 UNION ALL
SELECT 'REMITHA','PC UTILITIES','C',725, 5000, 51 UNION ALL
SELECT 'REMITHA','TSR HELP PKG.','ASSEMBLY',2500, 6000, 7 UNION ALL
SELECT 'REVATHI','HOSPITAL MGMT.','PASCAL',1100, 75000, 2 UNION ALL
SELECT 'VIJAYA','TSR EDITOR','C',900, 700, 6

SELECT * FROM Software

-- Creating the last Table "Programmer"

CREATE TABLE Programmer 
(
PNAME varchar(20), 
DOB date,       ----Date must be represented as date 
DOJ date, 
GENDER varchar(2), 
PROF1 varchar(20), 
PROF2 varchar(20), 
SALARY int
)

-- Inserting the values into the table Programmer

INSERT INTO Programmer
SELECT 'ANAND','12-Apr-66','21-Apr-92','M','PASCAL','BASIC',3200 UNION ALL
SELECT 'ALTAF','02-Jul-64','13-Nov-90','M','CLIPPER','COBOL',2800 UNION ALL
SELECT 'JULIANA','31-Jan-60','21-Apr-90','F','COBOL','DBASE',3000 UNION ALL
SELECT 'KAMALA','30-Oct-68','02-Jan-92','F','C','DBASE',2900 UNION ALL
SELECT 'MARY','24-Jun-70','01-Feb-91','F','CPP','ORACLE',4500 UNION ALL
SELECT 'NELSON','11-Sep-85','11-Oct-89','M','COBOL','DBASE',2500 UNION ALL
SELECT 'PATTRICK','10-Nov-65','21-Apr-90','M','PASCAL','CLIPPER',2800 UNION ALL
SELECT 'QADIR','31-Aug-65','21-Apr-91','M','ASSEMBLY','C',3000 UNION ALL
SELECT 'RAMESH','03-May-67','28-Feb-91','M','PASCAL','DBASE',3200 UNION ALL
SELECT 'REBECCA','01-Jan-67','01-Dec-90','F','BASIC','COBOL',2500 UNION ALL
SELECT 'REMITHA','19-Apr-70','20-Apr-93','F','C','ASSEMBLY',3600 UNION ALL
SELECT 'REVATHI','02-Dec-69','02-Jan-92','F','PASCAL','BASIC',3700 UNION ALL
SELECT 'VIJAYA','14-Dec-65','02-May-92','F','FOXPRO','C',3500

SELECT * FROM Programmer

-----------------  TABLES CREATED, NOW QUERIES ARE PULLED DOWN HEREAFTER


--1. Find out the selling cost AVG for packages developed in Pascal. 

SELECT * FROM Software
WHERE DEVELOPIN = 'PASCAL'

SELECT AVG(SCOST) AS Average_Selling_Cost 
FROM Software
WHERE DEVELOPIN = 'PASCAL'

--2. Display Names, Ages of all Programmers.

SELECT * FROM Programmer

SELECT PNAME, DATEDIFF(YY, DOB, GETDATE()) AS Age 
FROM Programmer 

-----or------

Select PNAME , GETDATE() AS CurrentDate, DATEDIFF(YY,DOB, GETDATE()) AS Age
FROM Programmer

-----or------

SELECT PNAME, YEAR(getdate()) - YEAR(DOB) AS Age
FROM Programmer
ORDER BY Age

-----or------

Select PNAME, GETDATE() AS CurrentDate,
DATEDIFF(MONTH,DOB, GETDATE())/12 - 
CASE WHEN MONTH(DOB) = MONTH(GETDATE()) AND DAY(DOB) > DAY(GETDATE()) THEN 1 ELSE 0 END
AS AGE FROM Programmer

select current_timestamp; -- date and time, standard ANSI SQL so compatible across DBs
select getdate();  -- date and time, specific to SQL Server
select getutcdate(); -- returns UTC timestamp
select sysdatetime(); -- returns 7 digits of precision


--3. Display the Names of those who have done the DAP Course.

SELECT PNAME FROM Studies
WHERE COURSE = 'DAP'

--4. Display the Names and Date of Births of all Programmers Born in January. 

SELECT * FROM Programmer

SELECT PNAME, DOB
FROM PROGRAMMER 
WHERE MONTH(DOB) = 1

--5. What is the Highest Number of copies sold by a Package? 

SELECT * FROM Software

SELECT MAX(SOLD) AS Highest_Sold_Copies
FROM Software 

--6. Display lowest course Fee.

SELECT * FROM Studies

SELECT MIN(COURSE_FEE) AS Lowest_Fee
FROM Studies

--7. How many programmers done the PGDCA Course?

SELECT * FROM Studies

SELECT COUNT(PNAME) AS Programmers
FROM Studies

--8. How much revenue has been earned through sales of Packages Developed in C.

SELECT SUM(SOLD * SCOST) AS Revenue
FROM Software
WHERE DEVELOPIN = 'C'

--9. Display the Details of the Software Developed by Ramesh.

SELECT * FROM Software
WHERE PNAME = 'RAMESH'

--10. How many Programmers Studied at Sabhari? 

SELECT * FROM Studies

SELECT COUNT(PNAME) AS TOTAL_NUMBERS
FROM Studies
WHERE INSTITUTE = 'SABHARI'

--11. Display details of Packages whose sales crossed the 2000 Mark.

Select TITLE, SUM(SCOST*SOLD) as Revenue_2000 
FROM Software 
GROUP BY TITLE                 -- We grouped because the TITLE has similar values in it, we grouped it 
HAVING SUM(SCOST*SOLD) > 2000  -- Having claused because we want to put condition to the column we grouped!
ORDER BY Revenue_2000  

--12. Display the Details of Packages for which Development Cost have been recovered. 

SELECT * FROM Software
WHERE (SCOST*SOLD) > DCOST

--13. What is the cost of the costliest software development in Basic?

SELECT MAX(DCOST) AS Highest_Cost 
FROM Software
WHERE DEVELOPIN = 'BASIC'


 --14. How many Packages Developed in DBASE?

 SELECT COUNT(DEVELOPIN) AS Total_Packages
 FROM Software
 WHERE DEVELOPIN = 'DBASE'

 --15. How many programmers studied in Pragathi? 

 SELECT * FROM Studies

 SELECT COUNT(PNAME) AS Total_Programmers
 FROM Studies
 WHERE INSTITUTE = 'PRAGATHI'

 --16. How many Programmers Paid 5000 to 10000 for their course? 

SELECT * FROM Studies

SELECT COUNT(PNAME) AS  Paid_Programmers
FROM Studies
WHERE COURSE_FEE BETWEEN 5000 AND 10000

--17. What is AVG Course Fee

SELECT AVG(COURSE_FEE) AS AVG_FEE
FROM Studies

--18. Display the details of the Programmers Knowing C

SELECT * FROM Programmer
WHERE PROF1 = 'C' OR PROF2 = 'C' 

--19. How many Programmers know either COBOL or PASCAL

SELECT * FROM Programmer

SELECT COUNT(PNAME) AS No_of_Programmers
FROM Programmer
WHERE PROF1 = 'COBOL' OR PROF1 = 'PASCAL' OR PROF2 = 'COBOL' OR PROF2 = 'PASCAL'

--20. How many Programmers Don’t know PASCAL and C 

SELECT * FROM Programmer

SELECT COUNT(PNAME) 
FROM Programmer 
WHERE PROF1 NOT IN ('PASCAL','C') OR PROF2 NOT IN ('PASCAL','C')

--21. How old is the Oldest Male Programmer. 

SELECT MAX(DATEDIFF(YY, DOB, GETDATE())) AS OLD_Male_Age 
FROM Programmer
WHERE GENDER = 'M'

--22. What is the AVG age of Female Programmers?

SELECT * FROM Programmer

SELECT AVG(DATEDIFF(YYYY, DOB, GETDATE())) AS Avg_Female_Age 
FROM Programmer 
WHERE GENDER = 'M'

--23. Calculate the Experience in Years for each Programmer and Display with their names in Descending order.

SELECT PNAME, DATEDIFF(YYYY,DOJ,GETDATE()) AS Experience
FROM Programmer 
ORDER BY PNAME DESC

--24. Who are the Programmers who celebrate their Birthday’s During the Current Month? 

SELECT PNAME, DOB, DATEDIFF(YYYY, DOB, GETDATE()) AS Birthday_Age
FROM Programmer
WHERE MONTH(DOB) = MONTH(GETDATE())

--25. How many Female Programmers are there? 

SELECT COUNT(PNAME) AS Female_Programmers
FROM Programmer
WHERE GENDER = 'F'

--26. What are the Languages studied by Male Programmers.

SELECT * FROM Programmer

SELECT PNAME, PROF1, PROF2
FROM Programmer
WHERE GENDER = 'M'

--27. What is the AVG Salary? 

SELECT AVG(SALARY) AS Avg_Salary 
FROM Programmer

--28. How many people draw salary 2000 to 4000? 

SELECT COUNT(PNAME) AS Salary_Between_2000_4000
FROM Programmer
WHERE SALARY BETWEEN 2000 AND 4000

--29. Display the details of those who don’t know Clipper, COBOL or PASCAL. 

SELECT * FROM Programmer
WHERE PROF1 NOT IN ('Clipper','COBOL','PASCAL') AND PROF2 NOT IN ('Clipper','COBOL','PASCAL')

--30. Display the Cost of Package Developed By each Programmer. 

SELECT PNAME, SUM(DCOST) AS TOTAL_COST 
FROM SOFTWARE
GROUP BY PNAME

--31. Display the sales values of the Packages Developed by the each Programmer. 

SELECT PNAME, SUM( SOLD * SOLD) AS Sales 
FROM SOFTWARE 
GROUP BY PNAME

--32. Display the Number of Packages sold by Each Programmer. 

select Pname, count(TITLE) as Packages_Sold from Software group by PNAME


--33. Display the sales cost of the packages Developed by each Programmer Language wise.

select DEVELOPIN, sum(scost) as Sales from Software group by DEVELOPIN


--34. Display each language name with AVG Development Cost, AVG Selling Cost and AVG Price per Copy.

select DEVELOPIN, AVG(Dcost), AVG(scost), avg(sold) from Software group by DEVELOPIN 

--35. Display each programmer’s name, costliest and cheapest Packages Developed by him or her

select * from Software
SELECT PNAME, MIN(DCOST) as Min_Dcost, MAX(DCOST)as Max_Dcost FROM SOFTWARE GROUP BY PNAME


--35. Display each programmer’s name, costliest and cheapest Packages Developed by him or her
select * from Software
SELECT PNAME, MIN(DCOST) as Min_Dcost, MAX(DCOST)as Max_Dcost FROM SOFTWARE GROUP BY PNAME

---------------

--36. Display each institute name with number of Courses, Average Cost per Course. 
select * from studies
select institute, count(course) as No_of_courses, avg(course_fee) as Avg_fee from studies group by INSTITUTE


--37. Display each institute Name with Number of Students. 
select INSTITUTE, count(Pname) as No_of_Students from studies group by INSTITUTE


--38. Display Names of Male and Female Programmers. Gender also. 
select PNAME,GENDER from Programmer order by GENDER


--39. Display the Name of Programmers and Their Packages.
select PNAME, TITLE as Packages from Software order by PNAME
select * from Software

--40. Display the Number of Packages in Each Language Except C and C++. 
select DEVELOPIN, count(TITLE) from Software where DEVELOPIN not in ('c','cpp') group by DEVELOPIN 


--41. Display the Number of Packages in Each Language for which Development Cost is less than 1000
select DEVELOPIN, count(title) from Software where dcost < 1000 group by DEVELOPIN 


--42. Display AVG Difference between SCOST, DCOST for Each Package. 
select title as Package, AVG(DCOST-scost) as Average from Software group by TITLE

-----------------------
--43. Display the total SCOST, DCOST and amount to Be Recovered for each Programmer for Those Whose Cost has not yet been Recovered.
select * from Software

select sum(scost) as Scost, sum(dcost) as Dcost, sum(dcost-(sold*scost)) as AmountToBeRecovered from Software group by PNAME 
having sum(dcost) > sum(scost*sold)


--44. Display Highest, Lowest and Average Salaries for those earning more than 2000. 
select MAX(salary) as Max_salary, MIN(salary) as Min_salary, AVG(salary) as Avg_salary from Programmer where salary > 2000


--45. Who is the Highest Paid C Programmers? 
select *  from Programmer where SALARY = (select max(salary) from programmer where PROF1 = 'c' or PROF2 = 'c')
--or
select top 1 *  from Programmer where PROF1 = 'c' or PROF2 = 'c' order by SALARY desc


--46. Who is the Highest Paid Female COBOL Programmer?    
select * from programmer where salary = (select MAX(salary) from Programmer where (PROF1 = 'cobol' or PROF2 = 'cobol' )) and gender ='F'
--or
select top 1 * from programmer where (PROF1 = 'cobol' or PROF2 = 'cobol') and GENDER='f' order by SALARY desc


--47. Display the names of the highest paid programmers for each Language.

CREATE TABLE #PLangSal(PROF VARCHAR(20), SAL INT)

INSERT INTO #PLangSal 
SELECT PROF1, MAX(SALARY) AS HighestPay FROM programmer
GROUP BY PROF1

INSERT INTO #PLangSal 
SELECT PROF2, MAX(SALARY) AS HighestPay FROM programmer
GROUP BY PROF2

CREATE TABLE #PLangSalMax(PROF VARCHAR(20), SAL INT)

INSERT INTO #PLangSalMax
SELECT PROF, MAX(SAL) FROM #PLangSal GROUP BY PROF

SELECT PNAME,PROF,SAL FROM programmer INNER JOIN #PLangSalMax
ON PROF=PROF1 OR PROF=PROF2
WHERE SAL=SALARY
ORDER BY PROF


--48. Who is the least experienced Programmer. 
select PNAME, DATEDIFF(YY,DOJ,GETDATE()) as Experience from programmer
where DATEDIFF(YY,DOJ,GETDATE()) = (select MIN(DATEDIFF(YY,DOJ,GETDATE())) from programmer)


--49. Who is the most experienced male programmer knowing PASCAL.    
select DISTINCT PNAME, DATEDIFF(YY,DOJ,GETDATE()) AS Experience from programmer
where DATEDIFF(DD,DOJ,GETDATE()) = (select MAX(DATEDIFF(DD,DOJ,GETDATE())) from programmer where GENDER='M' AND PROF1='PASCAL' OR PROF2='PASCAL')


--50. Which Language is known by only one Programmer? 

SELECT PROF1 FROM PROGRAMMER GROUP BY PROF1 HAVING PROF1 NOT IN (SELECT PROF2 FROM PROGRAMMER) 
AND COUNT(PROF1)=1 UNION SELECT PROF2 FROM PROGRAMMER GROUP BY PROF2 
HAVING PROF2 NOT IN (SELECT PROF1 FROM PROGRAMMER) AND COUNT(PROF2)=1;


--51. Who is the Above Programmer Referred in 50? 
create TABLE #PSLang(PROF VARCHAR(20))

INSERT INTO #PSLang 
SELECT PROF1 FROM programmer 
GROUP BY PROF1 HAVING
PROF1 NOT IN (SELECT PROF2 FROM programmer) 
AND COUNT(PROF1)=1
UNION
SELECT PROF2 FROM programmer 
GROUP BY PROF2 HAVING
PROF2 NOT IN (SELECT PROF1 FROM programmer) 
AND COUNT(PROF2)=1

SELECT PNAME, PROF FROM programmer INNER JOIN #PSLang ON
PROF=PROF1 OR PROF=PROF2



--52. Who is the Youngest Programmer knowing DBASE?
select top 1 * from Programmer where prof1='dbase' or PROF2='dbase' order by DOB desc 
--or
SELECT FLOOR((GETDATE()-DOB)/365) AGE, PNAME, PROF1, PROF2 FROM PROGRAMMER 
WHERE FLOOR((GETDATE()-DOB)/365) = (SELECT MIN(FLOOR((GETDATE()-DOB)/365)) 
FROM PROGRAMMER WHERE PROF1 LIKE 'DBASE' OR PROF2 LIKE 'DBASE');


--53. Which Female Programmer earning more than 3000 does not know C, C++, ORACLE or DBASE? 
select * from Programmer where  SALARY > 3000 and gender ='f' and (PROF1 not in ( 'c','cpp','ORACLE','DBASE') or
PROF2 not in ( 'c','cpp','ORACLE','DBASE'))


--54. Which Institute has most number of Students? 
select top 1 INSTITUTE, count(PNAME) as No_of_Students from studies group by INSTITUTE order by INSTITUTE desc


--55. What is the Costliest course? 
select course from studies where COURSE_FEE= (select max (course_fee) from studies) 


--56. Which course has been done by the most of the Students? 
CREATE TABLE #CourStudNo (CourNam VARCHAR(20), StdNo INT)

INSERT INTO #CourStudNo
SELECT COURSE,COUNT(PNAME) FROM studies GROUP BY COURSE

SELECT CourNam,StdNo AS COUNT_OF_STUDENTS FROM #CourStudNo WHERE StdNo = 
(SELECT MAX(StdNo) FROM #CourStudNo)


--57. Which Institute conducts costliest course. 
select INSTITUTE,COURSE, COURSE_FEE from studies where COURSE_FEE= (select max(course_fee) from studies)


--58. Display the name of the Institute and Course, which has below AVG course fee. 
select INSTITUTE, COURSE from studies where COURSE_FEE < (select avg(course_fee) from studies)


--59. Display the names of the courses whose fees are within 1000 (+ or -) of the Average Fee
select COURSE FROM STUDIES WHERE COURSE_FEE < (select AVG(COURSE_FEE)+1000 FROM STUDIES)  
AND COURSE_FEE > (select AVG(COURSE_FEE)-1000 FROM STUDIES)
 

--60. Which package has the Highest Development cost? 
select TITLE, DCOST from Software where DCOST =(select MAX(dcost) from Software)


--61. Which course has below AVG number of Students? 

CREATE TABLE #AVGCNT (CRS VARCHAR(20), CNT INT)

INSERT INTO #AVGCNT
SELECT COURSE, COUNT(PNAME) FROM studies GROUP BY COURSE

SELECT CRS,CNT FROM #AVGCNT WHERE CNT <=
(SELECT AVG(CNT) FROM #AVGCNT)



--62. Which Package has the lowest selling cost? 
select TITLE, SCOST from Software where SCOST= (select min(scost) from Software)


--63. Who Developed the Package that has sold the least number of copies? 
select PNAME, SOLD from Software where sold = (Select min(sold) from Software)


--64. Which language has used to develop the package, which has the highest sales amount?
select DEVELOPIN, SCOST from Software where scost = (Select max(scost) from Software)


--65. How many copies of package that has the least difference between development and selling cost where sold.
select SOLD,TITLE from SOFTWARE where TITLE = (select TITLE from SOFTWARE
where (DCOST-SCOST)=(select MIN(DCOST-SCOST) from SOFTWARE))


--66. Which is the costliest package developed in PASCAL. 
select TITLE, DEVELOPIN, DCOST from Software where DCOST = (select max(DCOST) from Software where DEVELOPIN= 'pascal' )


--67. Which language was used to develop the most number of Packages. 
select DEVELOPIN from Software group by DEVELOPIN having max(DEVELOPIN) = (select max(DEVELOPIN) from Software)


 --68. Which programmer has developed the highest number of Packages? 
 CREATE TABLE #PRGCNT (PN VARCHAR(20), CNT INT)

INSERT INTO #PRGCNT
SELECT PNAME, COUNT(TITLE) FROM software GROUP BY PNAME

SELECT PN, CNT FROM #PRGCNT WHERE CNT=
(SELECT MAX(CNT) FROM #PRGCNT)


--69. Who is the Author of the Costliest Package? 
select PNAME, DCOST from Software where DCOST= (select max(dcost) from Software)


--70. Display the names of the packages, which have sold less than the AVG number of copies
select TITLE from Software where SOLD < (select avg(sold) from Software)


--71. Who are the authors of the Packages, which have recovered more than double the Development cost?
select PNAME from Software where (SCOST*SOLD) > 2*dcost


--72. Display the programmer Name and the cheapest packages developed by them in each language.
select PNAME, TITLE from Software where DCOST in (select MIN(DCOST) from Software group by DEVELOPIN)


--73. Display the language used by each programmer to develop the Highest Selling and Lowest-selling package
select PNAME, DEVELOPIN from SOFTWARE where SOLD in (select MAX(SOLD) from SOFTWARE GROUP BY PNAME) 
UNION select PNAME, DEVELOPIN from SOFTWARE where SOLD IN (select MIN(SOLD) from SOFTWARE GROUP BY PNAME)


--74. Who is the youngest male Programmer born in 1965? 
select top 1 * FROM PROGRAMMER  where year(DOB)='1965' and GENDER='m' order by DOB desc  --or

SELECT PNAME, DOB FROM programmer WHERE DATEDIFF(DD,DOB,GETDATE())=
(SELECT MIN(DATEDIFF(DD,DOB,GETDATE())) FROM Programmer WHERE  year(DOB)=1965 AND GENDER='M')


--75. Who is the oldest Female Programmer who joined in 1992?
select PNAME from Programmer where DOJ = (Select min(DOJ) from Programmer where year(doj)='1992' and GENDER='f')


--76. In which year was the most number of Programmers born. 
select year(dob), COUNT(year(dob)) from programmer group by year(dob) 
having COUNT(year(dob))> = all (SELECT count(year(dob)) FROM PROGRAMMER  group by year(dob))


--77. In which month did most number of programmers join? 
select month(DOJ) as DOJ, COUNT(month(DOJ)) as No_of_programmers from programmer group by month(DOJ) 
having COUNT(month(DOJ))> = all (SELECT count(month(DOJ)) FROM PROGRAMMER  group by month(DOJ))


--78. In which language are most of the programmer’s proficient.
CREATE TABLE #PCNT (PR VARCHAR(20), CNT INT)
CREATE TABLE #PsCNT (PRs VARCHAR(20), sCNT INT)

INSERT INTO #PCNT
SELECT PROF1, COUNT(PROF1) FROM programmer GROUP BY PROF1 UNION ALL
SELECT PROF2, COUNT(PROF2) FROM programmer GROUP BY PROF2

INSERT INTO #PsCNT
SELECT PR, SUM(CNT) FROM #PCNT GROUP BY PR

SELECT PRs, sCNT FROM #PsCNT WHERE sCNT = 
(SELECT MAX(sCNT) FROM #PsCNT)



--79. Who are the male programmers earning below the AVG salary of Female Programmers? 
select pname from Programmer where gender = 'm' and salary < (select avg(salary) from programmer where gender='f')


--80. Who are the Female Programmers earning more than the Highest Paid male programmer? 
select pname from Programmer where gender = 'f' and salary > (select max(salary) from Programmer where gender='m')


--81. Which language has been stated as the proficiency by most of the Programmers? -------------------------check
CREATE TABLE #PCNT (PR VARCHAR(20), CNT INT)
CREATE TABLE #PsCNT (PRs VARCHAR(20), sCNT INT)

INSERT INTO #PCNT
SELECT PROF1, COUNT(PROF1) FROM programmer GROUP BY PROF1 UNION ALL
SELECT PROF2, COUNT(PROF2) FROM programmer GROUP BY PROF2

INSERT INTO #PsCNT
SELECT PR, SUM(CNT) FROM #PCNT GROUP BY PR

SELECT PRs, sCNT FROM #PsCNT WHERE sCNT = 
(SELECT MAX(sCNT) FROM #PsCNT)


--82. Display the details of those who are drawing the same salary. 
select PNAME, salary from programmer where salary = any(select salary from programmer p group by salary 
having salary=p.salary and count(*)>1) order by salary desc


--83. Display the details of the Software Developed by the Male Programmers Earning More than 3000/-
SELECT * FROM software WHERE PNAME IN 
(SELECT PNAME FROM programmer WHERE SALARY>3000 AND GENDER='M')


--84. Display the details of the packages developed in Pascal by the Female Programmers
select * from Software as s, Programmer as p where p.PNAME=s.PNAME and GENDER='f' and DEVELOPIN='pascal';

--85. Display the details of the Programmers who joined before 1990. 
select * from Programmer where year(doj) < 1990


--86. Display the details of the Software Developed in C By female programmers of Pragathi. 
select * from Software as S, studies as St, Programmer as P where s.PNAME=st.PNAME and p.PNAME=s.PNAME and GENDER='f' and INSTITUTE='pragathi'


--87. Display the number of packages, No. of Copies Sold and sales value of each programmer institute wise. 
Select studies.INSTITUTE, count(software.DEVELOPIN) as TITLE, count(software.sold) as No_of_copies_sold, 
sum(software.sold*software.scost) as sales_value from software,studies 
where software.PNAME=studies.PNAME group by studies.INSTITUTE


--88. Display the details of the software developed in DBASE by Male Programmers, who belong to the institute in which 
--most number of Programmers studied.
CREATE TABLE #INST (INS VARCHAR(20), CNT INT)

INSERT INTO #INST
SELECT INSTITUTE, COUNT(PNAME) FROM studies GROUP BY INSTITUTE

SELECT DISTINCT SW.* FROM software AS SW, programmer AS PG, studies AS ST, #INST
WHERE DEVELOPIN='DBASE' AND GENDER='M' AND SW.PNAME = PG.PNAME 
AND INSTITUTE = INS AND CNT= (SELECT MAX(CNT) FROM #INST)


--89. Display the details of the software Developed by the male programmers Born before 1965 and female programmers born after 1975.
select * from Software as s, programmer p where s.PNAME=p.PNAME and GENDER='m' and year(dob)<1965 and gender='f' and year(dob)> 1975


--90. Display the details of the software that has developed in the language which is neither the first nor the second proficiency of the programmers. 
select *  from programmer p,software s where s.PNAME=p.PNAME and (DEVELOPIN <> prof1 and DEVELOPIN <> prof2)


--91. Display the details of the software developed by the male students of Sabhari. 
select * from programmer p,software s,studies st where p.PNAME=s.PNAME and s.PNAME=st.PNAME and GENDER='m' and INSTITUTE='sabhari'


--92. Display the names of the programmers who have not developed any packages. 
select * from Programmer
select PNAME from programmer where PNAME not in(select PNAME from software)


--93. What is the total cost of the Software developed by the programmers of Apple? 
select sum(scost) as Total_cost from software as s, studies as st where s.PNAME = st.PNAME and INSTITUTE='apple'


--94. Who are the programmers who joined on the same day? 
select a.PNAME,a.doj from programmer a,programmer b where a.doj=b.doj and a.PNAME <> b.PNAME


--95. Who are the programmers who have the same Prof2? 
select PNAME from programmer where prof2 = any(select prof2 from programmer group by prof2 having count(*) >1)


--96. Display the total sales value of the software, institute wise. 
select studies.INSTITUTE,sum(software.sold*software.scost) as Total_sales from software,
studies where studies.PNAME=software.PNAME group by studies.INSTITUTE


--97. In which institute does the person who developed the costliest package studied. 
 select studies.INSTITUTE, software.title from studies, Software where studies.PNAME = Software.PNAME and DCOST= (Select max(DCOST) from Software)


 --98. Which language listed in prof1, prof2 has not been used to develop any package. 

select prof1 from programmer 
where prof1 not in (select DEVELOPIN from software) 
union select prof2 from programmer where prof2 not in(select DEVELOPIN from software)

select * from software
select * from programmer

-- EX : select * from Programmer where PNAME in (select PNAME from Software where SOLD > 80) 

--99. How much does the person who developed the highest selling package earn and what course did HE/SHE undergo. 

select P.SALARY, D.COURSE, S.SCOST from Programmer P , Software S, Studies D 
where P.PNAME=D.PNAME and D.pname=S.PNAME and scost=(Select max(scost) from Software)


--100. What is the AVG salary for those whose software sales is more than 50,000/-. 
select avg(salary) as Avg_Salary from programmer as p,software as s where p.PNAME=s.PNAME and sold*scost > 50000


--101. How many packages were developed by students, who studied in institute that charge the lowest course fee? 
select count(s.PNAME) as No_of_package from software as s,studies as st
where s.PNAME=st.PNAME group by s.PNAME,COURSE_FEE having min(COURSE_FEE)=(select min(COURSE_FEE) from studies)


--102. How many packages were developed by the person who developed the cheapest package, where did HE/SHE study?------- check

select count(*) as No_of_packages, st.INSTITUTE from programmer as p,software as s, studies as st where s.PNAME=p.PNAME and p.PNAME=st.PNAME
group by DEVELOPIN 
having min(dcost)=(select min(dcost) from software)

--103. How many packages were developed by the female programmers earning more than the highest paid male programmer?

select count(DEVELOPIN) as No_of_packages 
from programmer p, software s 
where s.PNAME = p.PNAME and GENDER = 'f' and salary > (select max(salary) from programmer p,software s
where s.PNAME=p.PNAME and GENDER='m')


--104. How many packages are developed by the most experienced programmer from BDPS. 

select count(*) as No_of_packages 
from software s, programmer p 
where p.PNAME=s.PNAME 
group by doj 
having max(doj)=(select max(doj)
from studies st,programmer p, software s 
where p.PNAME=s.PNAME and st.PNAME=p.PNAME and (INSTITUTE='bdps'))


--105. List the programmers (form the software table) and the institutes they studied. 

SELECT s.PNAME, st.INSTITUTE 
FROM Software AS s, Studies AS st 
WHERE s.PNAME = st.PNAME


--106. List each PROF with the number of Programmers having that PROF and the number of the packages in that PROF.

SELECT DEVELOPIN, COUNT(*) AS Count_of_programmers , SUM(SCOST * (SOLD - DCOST)) AS Profit
FROM Software
WHERE DEVELOPIN IN (SELECT PROF1 FROM Programmer) 
GROUP BY DEVELOPIN


--107. List the programmer names (from the programmer table) and No. Of Packages each has developed.

SELECT Programmer.PNAME, COUNT(Software.TITLE) AS No_of_packages 
FROM Programmer, Software 
WHERE Programmer.PNAME = Software.PNAME 
GROUP BY Programmer.PNAME


--------------------------------------------------------------------------------------

---- RANK CONCEPT
---- SUBQUERIES
---- STORED PROCEDURES
---- CTE (COMMON TABLE EXPRESSIONS)
---- TRIGGERS

--1. Remove Duplicates

CREATE TABLE Empply
    ( 
    [ID] INT identity(1,1), 
    [FirstName] Varchar(100), 
    [LastName] Varchar(100), 
    [Country] Varchar(100), 
    ) 
    GO 
    
    Insert into Empply([FirstName],[LastName],[Country] )values('Raj','Gupta','India'),
                                ('Raj','Gupta','India'),
                                ('Mohan','Kumar','USA'),
                                ('James','Barry','US'),
                                ('James','Barry','UK')

SELECT * FROM Empply

SELECT * FROM Empply where FirstName in ('Mohan')
SELECT * FROM Empply where FirstName in (select FirstName from Empply where FirstName  = 'Mohan')


DELETE E
    FROM Empply E
         INNER JOIN
    (
        SELECT *, 
               RANK() OVER(PARTITION BY firstname, 
                                        lastname, 
                                        country
               ORDER BY id) RANK 
        FROM Empply
    ) T ON E.ID = t.ID
    WHERE RANK > 1;

select * from Empply

--1. DISTINCT - Repeating 

select * from Empply

select distinct Country from Empply

select top 2 * from Empply 

--2. Date conversions

SELECT CONVERT(VARCHAR(20),GETDATE(), 101);

select getdate()

-- CAST and CONVERT are functions used to convert one data type to another data type.

-- The CAST function is used to convert a data type without a specific format. 
-- The CONVERT function does converting and formatting data types at the same time.


--3. CTE

--WITH cte_name(column_names)   
--AS (query)     
--SELECT * FROM cte_name;

WITH cte_name as (select * from Empply)
select * from cte_name

-- uses : Maintainability and readability, maintanance
-- drop back : cannot use keywords like distinct, groupby, having etc.

--4. Triggers -- The repulsive assertions over the claimed actions

--5. Stored Procedures -- 

create proc sp_test
as 
begin

select * from Empply
select * from Employee
select * from Customer

end

sp_test


--5. Cursor, Index, Trigger, Pivot, Error Handling, BCP

--6. Case and When