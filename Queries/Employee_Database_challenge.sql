--DELIVERABLE 1

-- retrieve columns from employees table
SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO Retirement_Titles
FROM employees as e
INNER JOIN titles as t
ON e.emp_no = t.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no

--export to a retirement_titles.csv
SELECT * FROM retirement_titles;
COPY "public".retirement_titles TO 'C:\Users\mrale\Lydia\AnalysisProjects\Pewlett_Hackard_Analysis\Pewlett_Hackard_Analysis\Data\retirement_titles.csv' DELIMITER ',' CSV HEADER

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title

INTO unique_titles
FROM retirement_titles as rt
ORDER BY rt.emp_no, rt.to_date DESC;

--export to a unique_titles.csv
SELECT * FROM unique_titles;
COPY "public".unique_titles TO 'C:\Users\mrale\Lydia\AnalysisProjects\Pewlett_Hackard_Analysis\Pewlett_Hackard_Analysis\Data\unique_titles.csv' DELIMITER ',' CSV HEADER

--retrieve the number of employees by most recent job title who are about to retire
SELECT COUNT(ut.title),ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY COUNT(ut.title) DESC;

--export to a retiring_titles.csv
SELECT * FROM retiring_titles;
COPY "public".retiring_titles TO 'C:\Users\mrale\Lydia\AnalysisProjects\Pewlett_Hackard_Analysis\Pewlett_Hackard_Analysis\Data\retiring_titles.csv' DELIMITER ',' CSV HEADER

--DELIVERABLE 2
-- retrieve columns from employees table
SELECT DISTINCT ON (emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, t.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as de
ON e.emp_no = de.emp_no
INNER JOIN titles as t
ON e.emp_no = t.emp_no
WHERE de.to_date = ('9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no;

--export to a mentorship_eligibility.csv
SELECT * FROM mentorship_eligibility;
COPY "public".mentorship_eligibility TO 'C:\Users\mrale\Lydia\AnalysisProjects\Pewlett_Hackard_Analysis\Pewlett_Hackard_Analysis\Data\mentorship_eligibility.csv' DELIMITER ',' CSV HEADER





