-- Top regions by active employee count

SELECT
  bt.region,
  COUNT(DISTINCT e.emplid) AS emplid
FROM employee e
JOIN businessunit bt
  ON e.bu = bt.bu
WHERE e.termdate IS NULL
GROUP BY bt.region
ORDER BY emplid DESC;

-- Top 3 business units by active employee count

SELECT
  bu,
  COUNT(DISTINCT emplid) AS active_employees
FROM employee
WHERE termdate IS NULL
GROUP BY bu
ORDER BY active_employees DESC
LIMIT 3;
