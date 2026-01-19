/*
What are the skill required for these top-paying roles?
-Use the top 10 highest-paying Data Analyst job from first query
-Add the specific skills required for these roles
-Why? It provides a detailed look at which high-paying job demand certain skills,
 helping job seekers understand which skills to develop that align with top salaries
*/
WITH top_paying_jobs AS
(
    SELECT
    job_id,
    job_title,
    salary_year_avg,
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
)

SELECT top_paying_jobs.*,skills FROM top_paying_jobs
INNER JOIN skills_job_dim  ON skills_job_dim.job_id = top_paying_jobs.job_id
INNER JOIN skills_dim  on skills_dim.skill_id = skills_job_dim.skill_id