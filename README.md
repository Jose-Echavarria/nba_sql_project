# nba_sql_project
NBA Data Cleaning and Analysis Project
This repository contains SQL scripts I created to clean, standardize, and analyze NBA player data. My goal with this project is to improve the dataset for clearer insights and make it ready for visualizations.

Overview
This project is focused on:

Cleaning and updating fields like player height, draft year, and college names for consistency.
Handling missing values, especially in key columns like draft year and draft round.
Calculating player stats like average points, rebounds, and assists by team, season, age, and country to see performance trends.
What's Inside
nba_data_cleaning.sql: Includes scripts for cleaning and organizing the NBA dataset.
nba_data_analysis.sql: Contains analysis scripts that calculate averages, rank players, and summarize stats by category.
Key Features
Data Cleaning
Player Height: Truncates the height field to a standard length.
Draft Details: Replaces missing values in draft-related columns with “Undrafted” for clarity.
Team Abbreviations: Adds a new team column, fills it with values from team_abbreviation, then drops the old column.
Country & College Names: Makes country and college names consistent.
Analysis
Team, Season, Age Stats: Calculates averages for points, rebounds, and assists across teams, seasons, and player age.
Top Players by Stats: Lists the top players for points, assists, and rebounds.
Draft Performance: Sums up total points, rebounds, and assists by draft year.
