WITH 
sum_dpt AS(
SELECT d.department_name, SUM(e.salary) total_dep
FROM  employees e JOIN departments d 
ON e.department_id = d.department_id
GROUP BY  d.department_name),  
                   
avg_dpt AS (SELECT AVG(total_dep) AS dpt_avg FROM sum_dpt)
                 
SELECT *
FROM sum_dpt
WHERE total_dep < (SELECT dpt_avg FROM avg_dpt)
ORDER BY department_name;
