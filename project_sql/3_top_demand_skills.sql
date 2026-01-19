/*
Question: Waht are the most in-demand skills for Data analyst?
- Join job postings to inner join table similar to query 2.
- Identify the top 5 in-demand skills for data analyst.
- Focus on all job postings
- Why? Retrieves the top 5 skills with the highest demand in the job market
providing insights into the most valuable skills for the job seekers
*/

SELECT skills,
        Count(skills_job_dim.job_id) AS job_count
 FROM job_postings_fact
INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_dim.skill_id = skills_job_dim.skill_id
where job_title_short = 'Data Analyst'
GROUP BY skills
ORDER BY job_count DESC
LIMIT 5