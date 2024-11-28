---

# Spotify Songs SQL Project 🎵

## Overview
This project explores a dataset of Spotify songs to demonstrate SQL skills. The dataset, sourced from [Kaggle](https://www.kaggle.com/code/eishkaran/spotify-music-recommendation-system), is cleaned and prepared using Python and uploaded to a SQL database. A variety of queries showcase analytical capabilities and data relationships.

---

## Goals
1. **Data Preparation**: 
   - Clean and organize raw data using Python.
   - Split the data into normalized tables (`songs`, `artists`, `genres`) for relational database design.
2. **SQL Mastery**: 
   - Perform complex queries to extract insights, showcase database proficiency, and analyze song trends.
3. **Highlight Relationships**:
   - Use JOINs and relationships to derive meaningful information from the data.

---

## Data Preparation
- **Source**: Dataset from Kaggle.
- **Steps**:
  - Cleaned and normalized data using a Jupyter notebook.
  - Split the data into three tables:
    - **Artists**: `artist_id`, `artist_name`
    - **Genres**: `genre_id`, `genre_name`
    - **Songs**: `song_id`, `title`, `artist_id`, `genre_id`, and other song features.
  - Added unique IDs to create relationships between the tables.

---

## Database Design
The data is organized into a relational schema:
1. **Artists Table**:
   - Contains unique artist names and IDs.
2. **Genres Table**:
   - Stores unique genres with corresponding IDs.
3. **Songs Table**:
   - Links songs to artists and genres using foreign keys and includes song attributes like BPM, energy, and popularity.

---

## SQL Queries
### Examples of Queries Performed:
1. **Top Artists by Song Count**:
   Identified the most prolific artists in the dataset.
2. **Top Genres by Popularity**:
   Determined the most popular genres based on average song popularity.
3. **Longest and Shortest Songs**:
   Retrieved the lengthiest and briefest tracks.
4. **Popularity Trends**:
   Analyzed how song popularity evolved over the years.
5. **One-Hit Wonders**:
   Highlighted artists with only one song in the dataset.

### Advanced Queries:
- **Genre Diversity per Artist**: Showcased artists with songs spanning multiple genres.
- **Energy and Danceability**: Found highly energetic and danceable tracks.
- **BPM Ranges**: Grouped songs into tempo categories (e.g., Slow, Moderate, Fast).

---

## Additional Features
- **Database Indexing**: Optimized performance by creating indexes.
- **Data Integrity Checks**: Verified data consistency and removed duplicates.
- **Visualization-Ready Insights**:
  - Suggested graphs and visualizations for query results, such as genre distributions and popularity trends.

---

## Tools Used
- **Python**: For data preparation, cleaning, and exporting tables.
- **Jupyter Notebook**: For exploratory data analysis and processing.
- **SQL**: For relational database design and advanced queries.

---

## Files in This Repository
- **Spotify_SQL.ipynb**: Jupyter notebook for cleaning and preparing the data, creating tables, and adding relationships.
- **queries.sql**: Collection of SQL queries used to analyze the data and demonstrate SQL skills.
- **erd_screenshot.png**: Visual representation of the database schema (ERD) showing relationships between tables.

---

## How to Use
1. Clone this repository.
2. Use the included Jupyter notebook to prepare the dataset (optional if starting from raw data).
3. Load the prepared CSV files into your preferred SQL database.
4. Execute the SQL queries in the provided script or your own database environment.

---

## Next Steps
- Add more advanced SQL queries to showcase skills in:
  - Window functions (e.g., running totals, rankings).
  - Recursive queries (e.g., finding related artists by genre).
  - Correlation analysis (e.g., linking BPM with popularity).
- Create visualizations of query results in Python or Tableau for deeper insights.

---

## Acknowledgments
- **Dataset**: The dataset is sourced from [Kaggle](https://www.kaggle.com/code/eishkaran/spotify-music-recommendation-system). Special thanks to the contributors of this dataset.
- **Inspiration**: Passion for music and data analysis.

---
