-- How many active employees and what is their average tenure?

SELECT
  COUNT(*) AS active_employees,
  ROUND(AVG(max_tenuredays)) AS avg_tenure_days,
  ROUND(AVG(max_tenuremonths)) AS avg_tenure_months
FROM (
  SELECT
    emplid,
    MAX(tenuredays) AS max_tenuredays,
    MAX(tenuremonths) AS max_tenuremonths
  FROM employee
  WHERE termdate IS NULL
    AND emplid NOT IN (SELECT emplid FROM employee WHERE termdate IS NOT NULL)
  GROUP BY emplid
  ORDER BY emplid ASC
) t;

-- 2) Longest-serving employee
SELECT emplid, MAX(tenuredays)
FROM employee
GROUP BY emplid
ORDER BY MAX(tenuredays) DESC
LIMIT 1;

-- 3) Shortest tenure employee (current tenure months > 0)
SELECT
  emplid,
  MAX(tenuremonths) AS max_tenuremonths
FROM employee
GROUP BY emplid
HAVING MAX(tenuremonths) > 0
ORDER BY max_tenuremonths ASC
LIMIT 1;
