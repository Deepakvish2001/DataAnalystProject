/*
What are the Top-Paying data analyst job?
-Identify the top 10 highest-paying Data Analyst roles that are available remotely
-Focuses on Job posting with specified salaries (remove nulls)
-Why? highlight the top-paying opportunity for data analystics, offering insights into employment opportunity
 */

SELECT
 job_id,
 job_title,
 job_location,
 job_schedule_type,
 salary_year_avg,
 job_posted_date,
 name AS comp_name
FROM 
    job_postings_fact j
LEFT JOIN company_dim c ON c.company_id = j.company_id
where 
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY 
    salary_year_avg DESC
LIMIT 10