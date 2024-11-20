
# Spotify Songs Analysis and Prediction 🎵

## Overview  
This project explores a dataset of Spotify songs sourced from Kaggle, analyzing key features like tempo, energy, danceability, and popularity. The project includes insights from exploratory data analysis (EDA), feature correlations, clustering, and machine learning techniques for predictions and classifications.

---

## Dataset  
The dataset used in this project comes from [Kaggle](insert-link). It contains information about songs, such as:
- **Title**: Song name  
- **Artist**: Performer  
- **Year**: Release year  
- **Genre**: Song genre  
- Features like **Beats Per Minute (BPM)**, **Energy**, **Danceability**, **Loudness**, **Acousticness**, **Speechiness**, and **Popularity**.  

---

## Project Structure  
The analysis is broken down into the following Jupyter notebooks:

1. **Data Loading and Cleaning**  
   - Loads the dataset and performs preprocessing steps like handling missing values, standardizing columns, and unifying genre types.

2. **Exploratory Data Analysis (EDA)**  
   - Visualizes the distribution of features such as song length, popularity, energy, and tempo.  
   - Analyzes relationships between features (e.g., Energy vs. Danceability).  
   - Highlights trends across genres and years.

3. **Feature Correlation Analysis**  
   - Explores the relationships between song attributes using heatmaps and statistical metrics.  
   - Identifies key features influencing popularity.

4. **Clustering**  
   - Groups songs based on features like energy and tempo to uncover patterns.  
   - Visualizes clusters to differentiate song categories.

5. **Machine Learning** (Coming Soon 🚧)  
   - Implements predictive models for song popularity.  
   - Explores classification techniques to predict genres based on song features.

---

## Key Insights  
- **Popular Songs**: Characteristics of the most popular tracks.  
- **Tempo Trends**: Distribution and impact of BPM on popularity.  
- **Genre Analysis**: Most common and influential genres in the dataset.  
- **Energy & Danceability**: How these features relate to each other and popularity.  

---

## How to Use  
1. Clone the repository:  
   ```bash
   git clone https://github.com/your-username/spotify-songs-analysis.git
   ```
2. Install required libraries:  
   ```bash
   pip install -r requirements.txt
   ```
3. Explore the notebooks in order:
   - `01_Load_and_Cleaning.ipynb`  
   - `02_EDA.ipynb`  
   - `03_Correlations.ipynb`  
   - `04_Clustering.ipynb`  
   - `05_Machine_Learning.ipynb` (coming soon)

---

## Tools & Libraries  
- **Python**: Primary programming language  
- **Pandas**: Data manipulation  
- **Matplotlib & Seaborn**: Data visualization  
- **Scikit-learn**: Machine learning models  

---

## Acknowledgements  
The dataset is sourced from [Kaggle](https://www.kaggle.com/code/eishkaran/spotify-music-recommendation-system). Special thanks to the contributors of this dataset.

---

## Future Work  
- Add predictions and classifications notebook for machine learning.  
- Explore advanced models for improving classification accuracy.  
- Extend the dataset with additional features, such as streaming metrics.

---

## Author  
[DianaMPaun](https://github.com/DianaMPaun)

--- 

