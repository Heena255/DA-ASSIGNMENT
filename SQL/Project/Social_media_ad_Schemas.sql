-- This dataset simulates a digital advertising ecosystem containing four linked tables:
-- Users : - with demographic, location, and interest details.
-- Campaigns :- describing marketing projects, budgets, and timelines.
-- Ads :- tied to campaigns, with targeting criteria like gender, age group, and interests.
-- ad_Events :- logging user interactions with ads, including clicks, views, and purchases.

------------------------------------------------------------------------------------------------------------------
create database social_media_ad;
use social_media_ad;
--------------------------------------------------------------------------------------------------------------
-- Create ad_event table 
---------------------------------------------------------------------------------------------------------------
CREATE TABLE ad_events (
    event_id INT PRIMARY KEY,
    ad_id INT,
    user_id INT,
    timestamp DATETIME,
    day_of_week VARCHAR(10),
    time_of_day VARCHAR(10),
    event_type VARCHAR(20)
);

INSERT INTO ad_events (event_id, ad_id, user_id, timestamp, day_of_week, time_of_day, event_type) VALUES
(1, 101, 1001, '2025-08-01 09:15:00', 'Friday', 'Morning', 'view'),
(2, 102, 1002, '2025-08-01 14:30:00', 'Friday', 'Afternoon', 'click'),
(3, 103, 1003, '2025-08-01 20:10:00', 'Friday', 'Evening', 'purchase'),
(4, 101, 1004, '2025-08-02 08:05:00', 'Saturday', 'Morning', 'view'),
(5, 104, 1005, '2025-08-02 16:45:00', 'Saturday', 'Afternoon', 'click'),
(6, 102, 1006, '2025-08-02 19:55:00', 'Saturday', 'Evening', 'purchase'),
(7, 105, 1007, '2025-08-03 10:20:00', 'Sunday', 'Morning', 'view'),
(8, 106, 1008, '2025-08-03 15:10:00', 'Sunday', 'Afternoon', 'click'),
(9, 103, 1009, '2025-08-03 21:25:00', 'Sunday', 'Evening', 'purchase'),
(10, 104, 1010, '2025-08-04 09:00:00', 'Monday', 'Morning', 'view'),
(11, 105, 1011, '2025-08-04 13:45:00', 'Monday', 'Afternoon', 'click'),
(12, 101, 1012, '2025-08-04 20:00:00', 'Monday', 'Evening', 'purchase'),
(13, 106, 1013, '2025-08-05 07:50:00', 'Tuesday', 'Morning', 'view'),
(14, 102, 1014, '2025-08-05 14:25:00', 'Tuesday', 'Afternoon', 'click'),
(15, 103, 1015, '2025-08-05 19:30:00', 'Tuesday', 'Evening', 'purchase'),
(16, 104, 1016, '2025-08-06 08:40:00', 'Wednesday', 'Morning', 'view'),
(17, 105, 1017, '2025-08-06 15:15:00', 'Wednesday', 'Afternoon', 'click'),
(18, 101, 1018, '2025-08-06 21:05:00', 'Wednesday', 'Evening', 'purchase'),
(19, 106, 1019, '2025-08-07 09:25:00', 'Thursday', 'Morning', 'view'),
(20, 102, 1020, '2025-08-07 12:50:00', 'Thursday', 'Afternoon', 'click'),
(21, 103, 1021, '2025-08-07 19:40:00', 'Thursday', 'Evening', 'purchase'),
(22, 104, 1022, '2025-08-08 10:15:00', 'Friday', 'Morning', 'view'),
(23, 105, 1023, '2025-08-08 15:35:00', 'Friday', 'Afternoon', 'click'),
(24, 101, 1024, '2025-08-08 20:50:00', 'Friday', 'Evening', 'purchase'),
(25, 106, 1025, '2025-08-09 09:10:00', 'Saturday', 'Morning', 'view');
------------------------------------------------------------------------------------------------------------------
--  Create table ads
------------------------------------------------------------------------------------------------------------------
CREATE TABLE ads (
    ad_id INT PRIMARY KEY,
    campaign_id INT,
    ad_platform VARCHAR(20),
    ad_type VARCHAR(20),
    target_gender VARCHAR(10),
    target_age_group VARCHAR(20),
    target_interests VARCHAR(50)
);

INSERT INTO ads (ad_id, campaign_id, ad_platform, ad_type, target_gender, target_age_group, target_interests) VALUES
(101, 201, 'Google', 'Banner', 'All', '18-24', 'Technology, Gadgets'),
(102, 202, 'Facebook', 'Video', 'Female', '25-34', 'Fashion, Beauty'),
(103, 203, 'Instagram', 'Story', 'Male', '18-24', 'Fitness, Sports'),
(104, 204, 'YouTube', 'Video', 'All', '35-44', 'Cooking, Recipes'),
(105, 205, 'LinkedIn', 'Sponsored', 'Male', '25-34', 'Business, Career'),
(106, 206, 'Twitter', 'Post', 'All', '18-24', 'News, Politics'),
(107, 207, 'Google', 'Banner', 'Female', '45-54', 'Travel, Lifestyle'),
(108, 208, 'Facebook', 'Carousel', 'All', '25-34', 'Home Decor, DIY'),
(109, 209, 'Instagram', 'Reel', 'Male', '18-24', 'Gaming, Esports'),
(110, 210, 'YouTube', 'Video', 'Female', '35-44', 'Parenting, Education'),
(111, 211, 'LinkedIn', 'Sponsored', 'All', '25-34', 'Startups, Networking'),
(112, 212, 'Twitter', 'Post', 'Male', '18-24', 'Cars, Automobiles'),
(113, 213, 'Google', 'Banner', 'Female', '25-34', 'Art, Photography'),
(114, 214, 'Facebook', 'Video', 'All', '35-44', 'Gardening, Nature'),
(115, 215, 'Instagram', 'Story', 'Male', '18-24', 'Music, Concerts'),
(116, 216, 'YouTube', 'Video', 'Female', '45-54', 'Health, Wellness'),
(117, 217, 'LinkedIn', 'Sponsored', 'All', '25-34', 'Finance, Investing'),
(118, 218, 'Twitter', 'Post', 'Male', '18-24', 'Science, Technology'),
(119, 219, 'Google', 'Banner', 'Female', '25-34', 'Jewelry, Accessories'),
(120, 220, 'Facebook', 'Carousel', 'All', '35-44', 'Books, Literature'),
(121, 221, 'Instagram', 'Reel', 'Male', '18-24', 'Adventure, Travel'),
(122, 222, 'YouTube', 'Video', 'Female', '25-34', 'Makeup, Skincare'),
(123, 223, 'LinkedIn', 'Sponsored', 'All', '25-34', 'Entrepreneurship'),
(124, 224, 'Twitter', 'Post', 'Male', '18-24', 'History, Culture'),
(125, 225, 'Google', 'Banner', 'Female', '35-44', 'Pets, Animals');
-------------------------------------------------------------------------------------------------------------------
-- create table campaigns 
-------------------------------------------------------------------------------------------------------------------
CREATE TABLE campaigns (
    campaign_id INT PRIMARY KEY,
    name VARCHAR(50),
    start_date DATE,
    end_date DATE,
    duration_days INT,
    total_budget DECIMAL(12,2)
);

INSERT INTO campaigns (campaign_id, name, start_date, end_date, duration_days, total_budget) VALUES
(201, 'Tech Trends 2025', '2025-07-01', '2025-08-15', 45, 50000.00),
(202, 'Summer Fashion Blast', '2025-07-05', '2025-08-20', 46, 35000.00),
(203, 'Fit Life Campaign', '2025-07-10', '2025-08-25', 46, 42000.00),
(204, 'Cooking Made Easy', '2025-07-15', '2025-08-30', 46, 38000.00),
(205, 'Career Growth Ads', '2025-07-01', '2025-08-10', 40, 60000.00),
(206, 'Daily News Highlights', '2025-07-05', '2025-08-15', 41, 30000.00),
(207, 'Explore the World', '2025-07-10', '2025-08-25', 46, 45000.00),
(208, 'Home Makeover Ideas', '2025-07-15', '2025-08-30', 46, 32000.00),
(209, 'Gaming Mania', '2025-07-01', '2025-08-15', 45, 40000.00),
(210, 'Smart Parenting Tips', '2025-07-05', '2025-08-20', 46, 37000.00),
(211, 'Business Connect', '2025-07-10', '2025-08-25', 46, 55000.00),
(212, 'Auto Expo 2025', '2025-07-15', '2025-08-30', 46, 36000.00),
(213, 'Art Lovers Showcase', '2025-07-01', '2025-08-15', 45, 33000.00),
(214, 'Green Gardeners', '2025-07-05', '2025-08-20', 46, 34000.00),
(215, 'Live Music Nights', '2025-07-10', '2025-08-25', 46, 41000.00),
(216, 'Wellness for All', '2025-07-15', '2025-08-30', 46, 39000.00),
(217, 'Finance Mastery', '2025-07-01', '2025-08-15', 45, 58000.00),
(218, 'Science Updates', '2025-07-05', '2025-08-20', 46, 31000.00),
(219, 'Luxury Jewelry Sale', '2025-07-10', '2025-08-25', 46, 36000.00),
(220, 'Book Lovers Week', '2025-07-15', '2025-08-30', 46, 30000.00),
(221, 'Adventure Seekers', '2025-07-01', '2025-08-15', 45, 47000.00),
(222, 'Beauty Secrets', '2025-07-05', '2025-08-20', 46, 35000.00),
(223, 'Startup Success Stories', '2025-07-10', '2025-08-25', 46, 52000.00),
(224, 'Culture & History', '2025-07-15', '2025-08-30', 46, 30000.00),
(225, 'Pet Care Tips', '2025-07-01', '2025-08-15', 45, 28000.00);
-----------------------------------------------------------------------------------------------------------------
--  create user table
-----------------------------------------------------------------------------------------------------------------
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    user_gender VARCHAR(10),
    user_age INT,
    age_group VARCHAR(20),
    country VARCHAR(30),
    location VARCHAR(50),
    interests VARCHAR(100)
);

INSERT INTO users (user_id, user_gender, user_age, age_group, country, location, interests) VALUES
(1001, 'Male', 22, '18-24', 'India', 'Mumbai', 'Technology, Gadgets'),
(1002, 'Female', 28, '25-34', 'India', 'Delhi', 'Fashion, Beauty'),
(1003, 'Male', 23, '18-24', 'India', 'Bengaluru', 'Fitness, Sports'),
(1004, 'Female', 40, '35-44', 'India', 'Pune', 'Cooking, Recipes'),
(1005, 'Male', 31, '25-34', 'India', 'Ahmedabad', 'Business, Career'),
(1006, 'Female', 21, '18-24', 'India', 'Hyderabad', 'News, Politics'),
(1007, 'Female', 48, '45-54', 'India', 'Kolkata', 'Travel, Lifestyle'),
(1008, 'Male', 27, '25-34', 'India', 'Surat', 'Home Decor, DIY'),
(1009, 'Male', 19, '18-24', 'India', 'Chennai', 'Gaming, Esports'),
(1010, 'Female', 36, '35-44', 'India', 'Jaipur', 'Parenting, Education'),
(1011, 'Male', 30, '25-34', 'India', 'Lucknow', 'Startups, Networking'),
(1012, 'Male', 20, '18-24', 'India', 'Bhopal', 'Cars, Automobiles'),
(1013, 'Female', 29, '25-34', 'India', 'Nagpur', 'Art, Photography'),
(1014, 'Male', 37, '35-44', 'India', 'Patna', 'Gardening, Nature'),
(1015, 'Male', 24, '18-24', 'India', 'Indore', 'Music, Concerts'),
(1016, 'Female', 50, '45-54', 'India', 'Vadodara', 'Health, Wellness'),
(1017, 'Male', 32, '25-34', 'India', 'Rajkot', 'Finance, Investing'),
(1018, 'Male', 26, '25-34', 'India', 'Amritsar', 'Science, Technology'),
(1019, 'Female', 28, '25-34', 'India', 'Varanasi', 'Jewelry, Accessories'),
(1020, 'Male', 42, '35-44', 'India', 'Nashik', 'Books, Literature'),
(1021, 'Male', 22, '18-24', 'India', 'Agra', 'Adventure, Travel'),
(1022, 'Female', 27, '25-34', 'India', 'Meerut', 'Makeup, Skincare'),
(1023, 'Male', 29, '25-34', 'India', 'Chandigarh', 'Entrepreneurship'),
(1024, 'Male', 23, '18-24', 'India', 'Thane', 'History, Culture'),
(1025, 'Female', 35, '35-44', 'India', 'Coimbatore', 'Pets, Animals');
------------------------------------------------------------------------------------------------------------------

select * from ad_events;
select * from ads;
select * from campaigns;
select * from users;

