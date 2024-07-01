/* Does going to university in a different country affect your mental health? A Japanese international university 
surveyed its students in 2018 and published a study the following year that was approved by several ethical and regulatory boards.

The study found that international students have a higher risk of mental health difficulties than the general population, and that 
social connectedness (belonging to a social group) and acculturative stress (stress associated with joining a new culture) are predictive of depression. */

/* Here is the schema: 
| Field Name    | Description                                      |
| ------------- | ------------------------------------------------ |
| `inter_dom`     | Types of students (international or domestic)   |
| `japanese_cate` | Japanese language proficiency                    |
| `english_cate`  | English language proficiency                     |
| `academic`      | Current academic level (undergraduate or graduate) |
| `age`           | Current age of student                           |
| `stay`          | Current length of stay in years                  |
| `todep`         | Total score of depression (PHQ-9 test)           |
| `tosc`          | Total score of social connectedness (SCS test)   |
| `toas`          | Total score of acculturative stress (ASISS test) |
 */

/* Instructions:
Explore and analyze the students data to see how the length of stay (stay) impacts the average mental health diagnostic scores of the international students present in the study.

Return a table with nine rows and five columns.
The five columns should be aliased as: stay, count_int, average_phq, average_scs, and average_as, in that order.
The average columns should contain the average of the todep (PHQ-9 test), tosc (SCS test), and toas (ASISS test) columns for each length of stay, rounded to two decimal places.
The count_int column should be the number of international students for each length of stay.
Sort the results by the length of stay in descending order.
*/


SELECT * 
FROM students 
LIMIT 10;


SELECT
	stay,
	COUNT(inter_dom) AS int_count, 
	ROUND(AVG(todep),2) AS average_phq, 
	ROUND(AVG(tosc),2) AS average_scs,
	ROUND(AVG(toas),2) AS average_as
FROM students 
WHERE inter_dom = 'Inter'
GROUP BY stay
ORDER BY stay DESC;



