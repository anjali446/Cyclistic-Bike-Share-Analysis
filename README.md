# Cyclistic-Bike-Share-Analysis

## Project Overview
**Objective**

The goal of this project is to analyze Cyclistic's bike-sharing data to understand the behavioral differences between casual riders and annual members. This analysis aims to provide data-driven recommendations to increase membership conversions, optimize bike availability, and enhance overall service efficiency.

## Tools & Technologies Used

**SQL (MySQL)** → Data Cleaning

**Python (Pandas, NumPy)** → Exploratory Data Analysis (EDA)

**Tableau** → Interactive Dashboards & Insights

**Jupyter Notebook** → Code Execution & Documentation

## Methodology & Approach

## Step 1: Data Extraction & Cleaning (SQL & Python)

**A. Data Cleaning using SQL**

Imported raw dataset into MySQL/PostgreSQL for structured querying.

Removed duplicate records:

Filtered out invalid data (negative ride durations, missing station names, etc.):

Standardized datetime formats for consistency.

**B. Data Processing using Python (Pandas, NumPy)**

Loaded the cleaned dataset into Pandas for further processing.

Converted timestamps into readable formats:

Created new columns for analysis:

Filtered out extreme outliers (e.g., rides longer than 24 hours).

## Step 2: Exploratory Data Analysis (EDA) – Key Findings

**1 Casual vs. Member Riding Patterns** 

**Casual Rides are Leisure-Oriented, Member Rides are Mobility-Oriented** 

Weekend preference: 56.4% of casual rides happen on weekends, while only 43.6% of member rides do.

Weekday preference: 60% of member rides occur on weekdays, compared to 40% for casuals.

Business hour trends: Member rides increase before and after business hours, indicating commuting use.

Ride duration:

Casual riders: Mean = 26.1 min, Median = 16.3 min

Member riders: Mean = 13.5 min, Median = 9.9 min

**2 Seasonal Trends & Bike Usage**

Both casual and member rides decrease during colder months, but member rides decrease less significantly.

Peak ride times: Both groups ride most frequently at 4 PM, 5 PM, and 6 PM.

Bike preferences:

Classic bikes are the most used by both groups.

Members rarely use docked bikes, indicating a preference for more flexible options.

**3 Popular Stations Analysis**

The most popular starting and ending station for casual riders is the same: Streeter Dr & Grand Ave.

This station has double the traffic of the second-most popular station.

## Business Recommendations

 **1. Convert Casual Riders into Members**

Offer membership discounts at high-traffic stations (e.g., Streeter Dr & Grand Ave).

Launch weekday discounts & subscription plans to encourage casual riders to commute.

Run lucky draws & promotions to incentivize casual riders to enroll in memberships.

Introduce flexible membership rates for warmer months & weekends.

**2. Improve Bike Availability & Service Efficiency**

Increase bike availability at peak hours (4-6 PM) when both groups ride the most.

Reduce docked bikes & increase classic bikes to match user preferences.

**3. Marketing & Awareness Campaign**

Educate casual riders that they can unlock bikes at one station and return them at another.

Referral programs: Offer slight discounts to member riders who bring in casual riders as new members.


