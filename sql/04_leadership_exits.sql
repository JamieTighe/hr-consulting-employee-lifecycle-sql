-- VP with highest number of hired employees in 2014

SELECT
  b.vp,
  COUNT(DISTINCT emplid) AS hires_in_2014
FROM employee e
JOIN businessunit b
  ON e.bu = b.bu
WHERE EXTRACT(YEAR FROM e.hiredate) = 2014
GROUP BY b.vp
ORDER BY COUNT(DISTINCT emplid) DESC
LIMIT 1;

-- VP with highest number of terminated employees

SELECT
  b.vp,
  COUNT(DISTINCT emplid) AS terminated_employees
FROM employee e
JOIN businessunit b
  ON e.bu = b.bu
WHERE e.termdate IS NOT NULL
GROUP BY b.vp
ORDER BY terminated_employees DESC
LIMIT 1;

-- Most common exit reason and average tenure before leaving

SELECT
  sr.separationreason AS reason,
  COUNT(emplid) AS exits,
  ROUND(AVG(e.tenuremonths)) AS avg_tenure_months
FROM employee e
JOIN separationreason sr
  ON e.termreason = sr.separationtypeid
WHERE e.termdate IS NOT NULL
GROUP BY sr.separationreason
ORDER BY exits DESC;
