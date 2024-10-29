-- Update player_height to only include the first 5 characters
SELECT SUBSTRING(player_height, 1, 5)
FROM [PortfolioProject].[dbo].[all_seasons$];


UPDATE [PortfolioProject].[dbo].[all_seasons$]
SET player_height = SUBSTRING(player_height, 1, 5);


-- Check updated player_height
SELECT *
FROM [PortfolioProject].[dbo].[all_seasons$];

-- Update draft_year, draft_number, and draft_round nulls to 'Undrafted'
Select draft_year
FROM [PortfolioProject].[dbo].[all_seasons$]
WHERE draft_year is null;


ALTER TABLE [PortfolioProject].[dbo].[all_seasons$]
ALTER COLUMN draft_year NVARCHAR(10);

ALTER TABLE [PortfolioProject].[dbo].[all_seasons$]
ALTER COLUMN draft_number NVARCHAR(10);

ALTER TABLE [PortfolioProject].[dbo].[all_seasons$]
ALTER COLUMN draft_round NVARCHAR(10);

UPDATE [PortfolioProject].[dbo].[all_seasons$]
SET draft_year = 'Undrafted'
WHERE draft_year = 0;

UPDATE [PortfolioProject].[dbo].[all_seasons$]
SET draft_number = 'Undrafted'
WHERE draft_number = 0;

UPDATE [PortfolioProject].[dbo].[all_seasons$]
SET draft_round = 'Undrafted'
WHERE draft_round = 0;

-- Add Team column and update it with team_abbreviation
ALTER TABLE [PortfolioProject].[dbo].[all_seasons$]
ADD Team NVARCHAR(10);

UPDATE [PortfolioProject].[dbo].[all_seasons$]
SET team = team_abbreviation;

-- Drop the team_abbreviation column
ALTER TABLE [PortfolioProject].[dbo].[all_seasons$]
DROP COLUMN team_abbreviation;

-- Check updated table
SELECT * 
FROM [PortfolioProject].[dbo].[all_seasons$];

-- Average player stats per team
SELECT team, 
	ROUND(AVG(pts), 2) as Avg_player_pts_per_team, 
	ROUND(AVG(reb), 2) as Avg_player_reb_per_team, 
	ROUND(AVG(ast), 2) as Avg_player_ast_per_team
FROM [PortfolioProject].[dbo].[all_seasons$]
GROUP BY team
ORDER BY Avg_player_pts_per_team desc;

-- Average top 75 player stats per player
SELECT TOP 75 player_name, 
	ROUND(AVG(pts), 2) as Avg_player_pts
FROM [PortfolioProject].[dbo].[all_seasons$]
GROUP BY player_name
ORDER BY Avg_player_pts DESC;

-- Average player stats per sesaon
SELECT season, 
	ROUND(AVG(pts), 2) as Avg_player_pts_per_sesason, 
	ROUND(AVG(reb), 2) as Avg_player_reb_per_season, 
	ROUND(AVG(ast), 2) as Avg_player_ast_per_season
FROM [PortfolioProject].[dbo].[all_seasons$]
GROUP BY season
ORDER BY Avg_player_pts_per_sesason DESC, Avg_player_reb_per_season DESC, Avg_player_ast_per_season DESC

-- Average player stats per age
SELECT age,
	ROUND(AVG(pts), 2) as Avg_player_pts_per_age, 
	ROUND(AVG(reb), 2) as Avg_player_reb_per_age,
	ROUND(AVG(ast), 2) as Avg_player_ast_per_age
FROM [PortfolioProject].[dbo].[all_seasons$]
GROUP BY age
ORDER BY Avg_player_pts_per_age DESC, Avg_player_reb_per_age DESC, Avg_player_ast_per_age DESC

-- Average player stats per country
SELECT country, 
	ROUND(AVG(pts), 2) as Avg_player_pts_per_age,
	ROUND(AVG(reb), 2) as Avg_player_reb_per_age, 
	ROUND(AVG(ast), 2) as Avg_player_ast_per_age
FROM [PortfolioProject].[dbo].[all_seasons$]
GROUP BY country
ORDER BY Avg_player_pts_per_age DESC, Avg_player_reb_per_age DESC, Avg_player_ast_per_age DESC

-- Update specific country names for consistency
SELECT DISTINCT country
FROM [PortfolioProject].[dbo].[all_seasons$]
ORDER BY country

UPDATE [PortfolioProject].[dbo].[all_seasons$]
SET country = 'Bosnia & Herzegovina'
WHERE country = 'Bosnia and Herzegovina';

UPDATE [PortfolioProject].[dbo].[all_seasons$]
SET country = 'Republic of the Congo'
WHERE country = 'Congo';

UPDATE [PortfolioProject].[dbo].[all_seasons$]
SET country = 'Democratic Republic of the Congo'
WHERE country = 'DRC';

UPDATE [PortfolioProject].[dbo].[all_seasons$]
SET country = 'United States'
WHERE country = 'USA';

UPDATE [PortfolioProject].[dbo].[all_seasons$]
SET country = 'United Kingdom'
WHERE country = 'Great Britain';

UPDATE [PortfolioProject].[dbo].[all_seasons$]
SET country = 'US Virgin Islands'
WHERE country = 'U.S. Virgin Islands'

SELECT *
FROM [PortfolioProject].[dbo].[all_seasons$]

-- Average player stats per draft year
SELECT draft_year, 
	ROUND(AVG(pts), 2) as Avg_player_pts_per_draft, 
	ROUND(AVG(reb), 2) as Avg_player_reb_per_draft, 
	ROUND(AVG(ast), 2) as Avg_player_ast_per_draft
FROM [PortfolioProject].[dbo].[all_seasons$]
GROUP BY draft_year
ORDER BY Avg_player_pts_per_draft DESC, Avg_player_reb_per_draft DESC , Avg_player_ast_per_draft DESC

---- Check for null or empty colleges

SELECT DISTINCT college
FROM [PortfolioProject].[dbo].[all_seasons$]
ORDER BY college

-- Update specific players' colleges
UPDATE [PortfolioProject].[dbo].[all_seasons$]
SET college is null
WHERE college = ''

UPDATE [PortfolioProject].[dbo].[all_seasons$]
SET college = 'St. Mary''s'
WHERE college = 'St. Mary''s (CA)';


UPDATE [PortfolioProject].[dbo].[all_seasons$]
SET college = 'St. Mary''s'
WHERE college = 'St. Mary''s (TX)';

UPDATE [PortfolioProject].[dbo].[all_seasons$]
SET college = 'Louisiana'
WHERE college = 'Louisiana-Lafayette';

UPDATE [PortfolioProject].[dbo].[all_seasons$]
SET college = 'Cal State-Long Beach'
WHERE college = 'California State-Long Beach';


UPDATE [PortfolioProject].[dbo].[all_seasons$]
SET college = 'Georgia Institute of Technology'
WHERE college = 'Georgia Tech';


UPDATE [PortfolioProject].[dbo].[all_seasons$]
SET college = 'Indiana-Purdue Indianapolis'
WHERE college = 'Indiana Purdue-Indianapolis';

UPDATE [PortfolioProject].[dbo].[all_seasons$]
SET college = 'University of California, Los Angeles'
WHERE college = 'UCLA';


UPDATE [PortfolioProject].[dbo].[all_seasons$]
SET college = 'NC State'
WHERE college = 'North Carolina State';


UPDATE [PortfolioProject].[dbo].[all_seasons$]
SET college = 'UNC Charlotte'
WHERE college = 'North Carolina-Charlotte';


UPDATE [PortfolioProject].[dbo].[all_seasons$]
SET college = 'University of Washington'
WHERE college = 'Washington';

SELECT *
FROM [PortfolioProject].[dbo].[all_seasons$]
WHERE college IS NULL OR college = '';

UPDATE [PortfolioProject].[dbo].[all_seasons$]
SET college = 'University of Kentucky'
WHERE player_name = 'Enes Kanter';

UPDATE [PortfolioProject].[dbo].[all_seasons$]
SET college = 'University of New Mexico'
WHERE player_name = 'Tony Snell' AND college IS NULL;

UPDATE [PortfolioProject].[dbo].[all_seasons$]
SET college = 'Louisville'
WHERE player_name = 'Jay Scrubb';

UPDATE [PortfolioProject].[dbo].[all_seasons$]
SET college = 'University of New Mexico'
WHERE player_name = 'Tony Snell' AND (college IS NULL OR college = '');

-- Defining key metrics and data points for visualization

SELECT TOP 50 college, 
	ROUND(AVG(pts), 1) as Avg_player_pts_per_college,
	ROUND(AVG(reb), 1) as Avg_player_reb_per_college,
	ROUND(AVG(ast), 1) as Avg_player_ast_per_college
FROM [PortfolioProject].[dbo].[all_seasons$]
GROUP BY college
ORDER BY Avg_player_pts_per_college DESC, Avg_player_reb_per_college DESC , Avg_player_ast_per_college DESC;

SELECT draft_year, 
	ROUND(SUM(pts * gp), 0) as Total_pts_per_draft, 
	ROUND(SUM(reb * gp), 0) as Total_reb_per_draft, 
	ROUND(SUM(ast * gp), 0) as Total_ast_per_draft
FROM [PortfolioProject].[dbo].[all_seasons$]
WHERE draft_year BETWEEN 1996 AND 2022 AND draft_year <> 'undrafted'
GROUP BY draft_year
ORDER BY Total_pts_per_draft DESC, Total_reb_per_draft DESC , Total_ast_per_draft DESC;

SELECT TOP 25 player_name,
	ROUND(avg(pts), 1) as Avg_player_pts
FROM [PortfolioProject].[dbo].[all_seasons$]
GROUP BY player_name
ORDER BY Avg_player_pts DESC

SELECT TOP 25 player_name,
	ROUND(avg(ast), 1) as Avg_player_ast
FROM [PortfolioProject].[dbo].[all_seasons$]
GROUP BY player_name
ORDER BY Avg_player_ast DESC;

SELECT TOP 25 player_name,
	ROUND(avg(reb), 1) as Avg_player_reb
FROM [PortfolioProject].[dbo].[all_seasons$]
GROUP BY player_name
ORDER BY Avg_player_reb DESC

SELECT team,
	ROUND(AVG(pts), 1) as Avg_player_pts_per_team,
	ROUND(AVG(reb), 1) as Avg_player_reb_per_team,
	ROUND(AVG(ast), 1) as Avg_player_ast_per_team
FROM [PortfolioProject].[dbo].[all_seasons$]
GROUP BY team
ORDER BY Avg_player_pts_per_team desc;

SELECT country, 
	ROUND(AVG(pts), 1) as Avg_player_pts_per_age,
	ROUND(AVG(reb), 1) as Avg_player_reb_per_age,
	ROUND(AVG(ast), 1) as Avg_player_ast_per_age
FROM [PortfolioProject].[dbo].[all_seasons$]
GROUP BY country
ORDER BY Avg_player_pts_per_age DESC, Avg_player_reb_per_age DESC, Avg_player_ast_per_age DESC

SELECT country,
	ROUND(SUM(pts * gp),0) as total_points,
	ROUND(SUM(reb * gp), 0) as total_rebounds, 
	ROUND(SUM(ast * gp), 0) as total_assists
FROM [PortfolioProject].[dbo].[all_seasons$]
GROUP BY country
ORDER BY total_points desc

SELECT age, 
	ROUND(AVG(pts), 1) as Avg_player_pts_per_age, 
	ROUND(AVG(reb), 1) as Avg_player_reb_per_age, 
	ROUND(AVG(ast), 1) as Avg_player_ast_per_age
FROM [PortfolioProject].[dbo].[all_seasons$]
GROUP BY age
ORDER BY Avg_player_pts_per_age DESC, Avg_player_reb_per_age DESC, Avg_player_ast_per_age DESC

SELECT season,
	ROUND(AVG(pts), 1) as Avg_pts_per_season, 
	ROUND(AVG(reb), 1) as Avg_reb_per_season, 
	ROUND(AVG(ast), 1) Avg_ast_per_season
FROM [PortfolioProject].[dbo].[all_seasons$]
GROUP BY season
ORDER BY Avg_pts_per_season DESC, Avg_reb_per_season DESC, Avg_ast_per_season DESC

SELECT season,
	ROUND(sum(pts * gp), 0) as Total_pts_per_season, 
	ROUND(sum(reb * gp), 0) as Total_reb_per_season, 
	ROUND(sum(ast * gp), 0) as Total_ast_per_season
FROM [PortfolioProject].[dbo].[all_seasons$]
GROUP BY season
ORDER BY Total_pts_per_season DESC, Total_reb_per_season DESC, Total_ast_per_season DESC
