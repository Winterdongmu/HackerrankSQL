/*
Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation. The output column headers should be Doctor, Professor, Singer, and Actor, respectively.

Note: Print NULL when there are no more names corresponding to an occupation.

Sample Output

Jenny    Ashley     Meera  Jane
Samantha Christeen  Priya  Julia
NULL     Ketty      NULL   Maria
Explanation

The first column is an alphabetically ordered list of Doctor names.
The second column is an alphabetically ordered list of Professor names.
The third column is an alphabetically ordered list of Singer names.
The fourth column is an alphabetically ordered list of Actor names.
The empty cell data for columns with less than the maximum number of names per occupation (in this case, the Professor and Actor columns) are filled with NULL values.


*/





WITH ranking_table AS(
  SELECT name,
         occupation,
         DENSE_RANK() OVER (PARTITION BY occupation ORDER BY name) AS ranks
  FROM occupations
)

SELECT MAX(CASE WHEN occupation = 'Doctor' THEN name END) AS doctor,
       MAX(CASE WHEN occupation = 'Professor' THEN name END) AS professor,
       MAX(CASE WHEN occupation = 'Singer' THEN name END) AS singer,
       MAX(CASE WHEN occupation = 'Actor' THEN name END) AS actor
FROM ranking_table

GROUP BY ranks