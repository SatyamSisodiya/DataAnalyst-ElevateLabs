####Overview
This Jupyter Notebook (DataCleaning.ipynb) demonstrates basic data cleaning techniques applied to a car price dataset. It's part of the Task 1: Basic Data Cleaning module from the DataAnalyst-ElevateLabs program.

####Contents
The notebook walks through the following data cleaning steps:
1. Data Loading:
- Imports the car_prices.csv dataset

2. Data Exploration:
- Displays sample rows with head()
- Checks for null values
- Examines dataset dimensions

3. Missing Data Handling:
- Identifies and removes rows with null values
- Verifies null value removal

4. Data Understanding:
- Examines data types and structure with info()
- Reviews statistical summaries with describe()

5. Duplicate Detection:
- Identifies any duplicate rows in the dataset

6. Text Standardization:
- Normalizes text fields
- Standardizes 'make' and 'model' columns using string methods
- Converts text to title case

7. ate Handling:
- Converts 'year' column to proper datetime format
- Creates a separate integer year column for easier analysis
