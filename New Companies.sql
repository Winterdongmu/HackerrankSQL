-- Amber's conglomerate corporation just acquired some new companies. Each of the companies follows this hierarchy: 

-- Given the table schemas below, write a query to print the company_code, founder name, total number of lead managers, total number of senior
-- managers, total number of managers, and total number of employees. Order your output by ascending company_code.


SELECT c.company_code, 
       c.founder, 
       COUNT(DISTINCT lm.lead_manager_code), 
       COUNT(DISTINCT sm.senior_manager_code), 
       COUNT(DISTINCT m.manager_code),
       COUNT(DISTINCT e.employee_code) 
FROM Company c, Lead_Manager lm, Senior_Manager sm, Manager m, Employee e 
WHERE c.company_code = lm.company_code 
AND lm.lead_manager_code = sm.lead_manager_code 
AND sm.senior_manager_code = m.senior_manager_code 
AND m.manager_code = e.manager_code 
GROUP BY c.company_code, c.founder
ORDER BY c.company_code;



/* OR */
SELECT c.company_code,
       c.founder,
       lm.lead_manager_cnt,
       sm.senior_manager_cnt,
       m.manager_cnt,
       e.employee_cnt
FROM company c
JOIN (SELECT company_code,
             COUNT(DISTINCT lead_manager_code) AS lead_manager_cnt
      FROM lead_manager
      GROUP BY 1) lm ON c.company_code = lm.company_code
JOIN (SELECT company_code,
             COUNT(DISTINCT senior_manager_code) AS senior_manager_cnt
      FROM senior_manager 
      GROUP BY 1) sm ON c.company_code = sm.company_code
JOIN (SELECT company_code,
             COUNT(DISTINCT manager_code) AS manager_cnt
      FROM manager 
      GROUP BY 1) m ON c.company_code = m.company_code
JOIN (SELECT company_code,
             COUNT(DISTINCT employee_code) AS employee_cnt
      FROM employee
      GROUP BY 1) e ON c.company_code = e.company_code
ORDER BY c.company_code