/*
Question: What are the top demanded skills for data engineers?
- Identify the top 10 in-demand skills for data engineers
- Focus on remote job postings
- Why? Retrieves the top 10 skills with the highest demand in the remote job market, providing insights into the most valuable skills in the data engineers seeking remote work
*/

SELECT 
    sd.skills,
    COUNT(jpf.*) AS demand_count
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd 
    ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd 
    ON sjd.skill_id = sd.skill_id
WHERE
    jpf.job_title_short = 'Data Engineer' 
    AND jpf.job_work_from_home = True
GROUP BY 
    sd.skills
ORDER BY 
    demand_count DESC
LIMIT 10;
