-- Count of hires, bad hires, and terminated employees by year

SELECT
  EXTRACT(YEAR FROM hiredate)::int AS year,
  COUNT(DISTINCT emplid) AS employee_numbers,
  SUM(CASE WHEN badhires = '1' THEN 1 ELSE 0 END) AS bad_hires,
  SUM(CASE WHEN termdate IS NOT NULL THEN 1 ELSE 0 END) AS terminated
FROM employee
WHERE hiredate IS NOT NULL
GROUP BY EXTRACT(YEAR FROM hiredate)
ORDER BY year;
