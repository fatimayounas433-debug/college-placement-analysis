select*
from collegeplacement CP;

SHOW COLUMNS FROM collegeplacement;

-=----- Show all details of students who are placed. 
select*
from collegeplacement CP 
where placement = "Yes";

------ ----- List student names, CGPA, and placement status.
  select College_ID,CGPA,Placement
from collegeplacement CP ;

----- Find the total number of students.
  select count(*) as total_student
  from collegeplacement CP;
 -------------- Display all STUDENT WHO HAVE OBOVE 4 CGPA  in the dataset.
 
 SELECT*
 FROM collegeplacement CP
 WHERE CGPA > 4;
 
 
 -----------  Count how many students have more than 2 internships.
 SELECT College_ID,IQ,Projects_Completed
 FROM collegeplacement CP
 WHERE Projects_Completed > 2
 
 --------  Intermediate (Aggregations & Grouping)
  
  
   -------------- Count placed vs not placed students.

 SELECT placement, COUNT(*) AS total_students
FROM collegeplacement CP
GROUP BY placement;

SELECT 
    COUNT(CASE WHEN placement = 'Yes' THEN 1 END) AS placed_students,
    COUNT(CASE WHEN placement = 'No'  THEN 1 END) AS not_placed_students
FROM collegeplacement CP;
 
 
 
   ----------------- Find the average CGPA of placed students.
 SELECT COLLEGE_ID, PLACEMENT, AVG(CGPA) AS avg_cgpa
FROM collegeplacement
where placement = 'Yes'
GROUP BY COLLEGE_ID, PLACEMENT;

SELECT AVG(CGPA) AS avg_cgpa
FROM collegeplacement
WHERE PLACEMENT = 'YES';
 
  

 --------------- Show placement rate by PROJECTS COMPLETED 
SELECT PROJECTS_COMPLETED,
       COUNT(*) AS total_students,
       SUM(CASE WHEN Placement = 'Yes' THEN 1 ELSE 0 END) AS placed_students,
       ROUND(100.0 * SUM(CASE WHEN Placement = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS placement_rate
FROM collegeplacement
GROUP BY PROJECTS_COMPLETED;

SELECT 
    Placement,
    COUNT(*) AS total_students,
    ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM collegeplacement), 2) AS placement_rate
FROM collegeplacement
GROUP BY Placement;

  
 
 ------------   Show average salary by degree
 SELECT Placement,
       AVG(Internship_Experience) AS Avg_Internship,
       AVG(Projects_Completed)    AS Avg_Projects,
       AVG(Extra_Curricular_Score) AS Avg_Extra,
       AVG(Communication_Skills)   AS Avg_Comm
FROM collegeplacement
GROUP BY Placement;


----------------- Top 10 Students by CGPA 
 SELECT College_ID,
       CGPA,
       IQ,
       Prev_Sem_Result,
       Academic_Performance,
       Internship_Experience,
       Extra_Curricular_Score,
       Communication_Skills,
       Projects_Completed,
       Placement
FROM collegeplacement
ORDER BY CGPA DESC
LIMIT 10;

---- here i find the how many studnet who have cgpa from above 10
WITH COUNT_10CGPA AS (
    SELECT CGPA
    FROM collegeplacement
    WHERE CGPA > 10
)
SELECT COUNT(*) AS ten_CGPA_Count
FROM COUNT_10CGPA;

----------------- Compare placement rate across different internship counts.
 SELECT Internship_Experience,
       COUNT(*) AS total_students,
       SUM(CASE WHEN Placement = 'Yes' THEN 1 ELSE 0 END) AS placed_students,
       ROUND(100.0 * SUM(CASE WHEN Placement = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS placement_rate
FROM collegeplacement
GROUP BY Internship_Experience;


-------------- Find the COLLEGE_ID with the highest average CGPA
 SELECT College_ID,
       AVG(CGPA) AS avg_cgpa
FROM CollegePlacement
GROUP BY College_ID
ORDER BY avg_cgpa DESC
LIMIT 1;

 -------- List students who got CGPA above the average CGPA.
    SELECT College_ID, avg(CGPA)
    FROM COLLEGEPLACEMENT
    GROUP BY College_ID
    HAVING AVG(CGPA) > 'CGPA';
    
    SELECT College_ID, CGPA
FROM CollegePlacement
WHERE CGPA > (
    SELECT AVG(CGPA)
    FROM CollegePlacement
);


--------  Find students with CGPA > 9 who are not placed.
select *
from collegeplacement
where placement = 'NO'
and CGPA > 9;
