----------------------------------------------------------------------------------------------------------------
-- 1. List all female users from Delhi.
SELECT * FROM
    users
WHERE
    location = 'Delhi' and user_gender = 'Female';
------------------------------------------------------------------------------------------------------------------
-- 2. Show all ads that target the 25-34 age group.
SELECT  *
FROM
    ads
WHERE
    target_age_group = '25-34';
------------------------------------------------------------------------------------------------------------------

-- 3. Retrieve all campaigns that started in 2024

SELECT *
FROM
    campaigns
WHERE
    YEAR(start_date) = 2024;
-------------------------------------------------------------------------------------------------------------------

-- 4. Find all events where the event_type was "click"

select * from ad_events
where event_type = 'click';

--------------------------------------------------------------------------------------------------------------------
-- 5. Get the names of campaigns with a total budget over ₹50000

select * from campaigns
where total_budget > 50000;

-----------------------------------------------------------------------------------------------------------------
-- 6. List all users from Mumbai who are in the 18-24 age group

select * from  users
where location = 'Mumbai' and age_group = '18-24';

-----------------------------------------------------------------------------------------------------------------
-- 7. Show all ad IDs linked to the platform "Facebook"

select ad_id , ad_platform from ads
where ad_platform = 'Facebook';

-----------------------------------------------------------------------------------------------------------------
-- 8. Retrieve all events that happened on a Monday

select * from ad_events
where day_of_week = 'Monday';

------------------------------------------------------------------------------------------------------------------
-- 9. List all campaigns with a duration greater than 45 days

select * from campaigns
where duration_days > 45 ;

------------------------------------------------------------------------------------------------------------------
-- 10. Show the interests of the user with user_id = 1010

select interests from users 
where user_id = 1010 ;

------------------------------------------------------------------------------------------------------------------
-- 11. Find the total number of events for each event_type

SELECT 
    event_type, COUNT(event_type) AS Total_num_Events
FROM
    ad_events
GROUP BY event_type;

---------------------------------------------------------------------------------------------------------------
-- 12. Show all ads along with their campaign names

SELECT 
    a.*, c.name AS campaign_name
FROM
    ads a
        JOIN
    campaigns c ON a.campaign_id = c.campaign_id;

-----------------------------------------------------------------------------------------------------------------
-- 13. List the number of ads running on each ad_platform

SELECT 
    ad_platform, COUNT(ad_id) AS Total_ads
FROM
    ads
GROUP BY ad_platform;

-------------------------------------------------------------------------------------------------------------------
-- 14. Find the top 5 locations with the highest number of users

SELECT 
    COUNT(*) AS total_user, location
FROM
    users
GROUP BY location
ORDER BY total_user DESC
LIMIT 5;

-------------------------------------------------------------------------------------------------------------------
-- 15. Get the average age of users targeted by each ad

SELECT 
    ad_id, ad_type, AVG(u.user_age) AS avg_age
FROM
    ads a
        JOIN
    users u ON a.target_age_group = u.age_group
GROUP BY ad_id;

-------------------------------------------------------------------------------------------------------------------
-- 16. Find campaigns along with their total number of associated ads

SELECT 
    c.campaign_id, c.name, COUNT(ad_id) AS Total_ads
FROM
    campaigns c
        LEFT JOIN
    ads a ON c.campaign_id = a.campaign_id
GROUP BY c.name , c.campaign_id;

-------------------------------------------------------------------------------------------------------------------
-- 17. List all ads that target users interested in "Technology"

SELECT 
    *
FROM
    ads
WHERE
    target_interests = '%Technology%';

-------------------------------------------------------------------------------------------------------------------
-- 18. Show the total budget of campaigns grouped by campaign_id

SELECT 
    campaign_id, SUM(total_budget) AS Total_budget
FROM
    campaigns
GROUP BY campaign_id;

-------------------------------------------------------------------------------------------------------------------
-- 19. Get all events with the user's gender and the ad's type

SELECT 
    e.event_id, u.user_age, a.ad_type
FROM
    ad_events e
        JOIN
    users u ON e.user_id = u.user_id
        JOIN
    ads a ON e.ad_id = a.ad_id;

-------------------------------------------------------------------------------------------------------------------
-- 20. Find the number of events per day_of_week for the "Google" platform ads

SELECT DISTINCT
    a.day_of_week, COUNT(event_id) AS Total_events
FROM
    ad_events a
        JOIN
    ads d ON a.ad_id = d.ad_id
GROUP BY a.day_of_week;

-------------------------------------------------------------------------------------------------------------------
-- 21. Find the top 3 most active users by number of events

SELECT 
    user_id, COUNT(*) AS total_events
FROM
    ad_events
GROUP BY user_id
ORDER BY total_events DESC
LIMIT 3;

-------------------------------------------------------------------------------------------------------------------
-- 22. Calculate CTR (click-through rate) per ad

SELECT 
    ad_id,
    (SUM(CASE
        WHEN event_type = 'click' THEN 1
        ELSE 0
    END) * 100.0) / NULLIF(SUM(CASE
                WHEN event_type = 'view' THEN 1
                ELSE 0
            END),
            0) AS ctr_percentage
FROM
    ad_events
GROUP BY ad_id;

-------------------------------------------------------------------------------------------------------------------
-- 23. Show campaigns ranked by total budget

select campaign_id,name,total_budget,
rank() over (order by total_budget DESC ) as Budget_Rank 
from campaigns;

-------------------------------------------------------------------------------------------------------------------
-- 24. Find the campaign with the highest total number of unique users engaged

SELECT 
    c.campaign_id,
    c.name,
    COUNT(DISTINCT e.user_id) AS unique_users
FROM
    campaigns c
        JOIN
    ads a ON c.campaign_id = a.campaign_id
        JOIN
    ad_events e ON a.ad_id = e.ad_id
GROUP BY c.campaign_id , c.name
ORDER BY unique_users DESC
LIMIT 1;

-------------------------------------------------------------------------------------------------------------------
-- 25. Identify ads that have events from both male and female users

SELECT 
    ad_id
FROM
    ad_events e
        JOIN
    users u ON e.user_id = u.user_id
GROUP BY ad_id
HAVING COUNT(DISTINCT user_gender) = 2;

-------------------------------------------------------------------------------------------------------------------
-- 26. For each age group, find the ad with the highest click count

SELECT age_group, ad_id, MAX(click_count) AS max_clicks
FROM (
    SELECT u.age_group, e.ad_id,
           COUNT(*) AS click_count
    FROM ad_events e
    JOIN users u ON e.user_id = u.user_id
    WHERE e.event_type = 'click'
    GROUP BY u.age_group, e.ad_id
) t
GROUP BY age_group, ad_id;

-------------------------------------------------------------------------------------------------------------------
-- 27. Determine the daily active users for each day_of_week

SELECT 
    day_of_week, COUNT(DISTINCT user_id) AS daily_active_users
FROM
    ad_events
GROUP BY day_of_week;

-------------------------------------------------------------------------------------------------------------------
-- 28. Get the cumulative total budget over time


SELECT distinct start_date, SUM(total_budget) OVER (ORDER BY start_date) AS cumulative_budget
FROM campaigns;

-------------------------------------------------------------------------------------------------------------------
-- 29. Find campaigns where the average user age for events is above 30

SELECT c.campaign_id, c.name, (round(AVG(u.user_age),0))  AS avg_age
FROM campaigns c
JOIN ads a ON c.campaign_id = a.campaign_id
JOIN ad_events e ON a.ad_id = e.ad_id
JOIN users u ON e.user_id = u.user_id
GROUP BY c.campaign_id, c.name
HAVING AVG(u.user_age) > 30;

-------------------------------------------------------------------------------------------------------------------
-- 30. "Find the top 5 ad platforms by total number of clicks."

select a.ad_platform , count(e.event_type)  as Total_events
from ads a
join ad_events e on a.ad_id = e.ad_id 
where event_type = 'click'
group by a.ad_platform
order by count(e.event_type)  desc
limit 5;