# Lyrics Sentiment Analysis

## Project Description
This project explores sentiment analysis of song lyrics using Python. The main goal is to analyze the emotional tone of lyrics from various artists and genres. Sentiment analysis was performed using two different methods:
1. **TextBlob**: A lexicon-based sentiment analysis tool.
2. **VADER (Valence Aware Dictionary and Sentiment Reasoner)**: Designed for analyzing social media and text with a mix of positive and negative emotions.

By comparing these methods, the project highlights how sentiment scores vary depending on the tool used and the lyrical content analyzed.

## Features
- **Lyrics Scraping**: Utilized the **Genius API** to collect lyrics from selected artists and genres.
- **Sentiment Analysis**:
  - **TextBlob**: Provides sentiment polarity as a continuous value between -1 (negative) and +1 (positive).
  - **VADER**: Outputs a compound sentiment score in the same range, with more sensitivity to extreme tones.
- **Comparison of Methods**: The project compares results to identify patterns and insights.
- **Insights by Artist**: The project analyzes how different artists and genres influence the overall sentiment.

## Tools and Libraries
- **Python Libraries**:
  - `lyricsgenius`: For fetching lyrics via the `Genius API`.
  - `textblob`: For lexicon-based sentiment analysis.
  - `vaderSentiment`: For rule-based sentiment analysis.
  - `pandas`: For data organization and analysis.
- **Genius API**: To collect lyrics data.

## How It Works
1. **Scraping Lyrics**:
   - A list of artists is provided (e.g., Linkin Park, Ed Sheeran, The Weeknd).
   - For each artist, the Genius API retrieves a set number of songs and their lyrics.
2. **Performing Sentiment Analysis**:
   - The lyrics are analyzed using both TextBlob and VADER.
   - Sentiment scores are stored in a DataFrame alongside the song title and artist.
3. **Output**:
   - Sentiment scores for all songs are presented in a tabular format for comparison.
   - Insights about emotional tendencies of artists or genres are extracted.

## Example Output
| Title                            | Artist         | TextBlob Score | VADER Score |
|----------------------------------|----------------|----------------|-------------|
| 1Stp Klosr                       | Linkin Park    | -0.1962        | 0.5948      |
| 26 Lettaz in Da Alphabet         | Linkin Park    | 0.0450         | -0.5940     |
| 1000 Nights                      | Ed Sheeran     | 0.0058         | 0.9662      |
| Acquainted                       | The Weeknd     | 0.1510         | 0.9736      |
| 10 Bands                         | Drake          | -0.0654        | 0.9531      |

## Insights
- TextBlob scores tend to be closer to neutral, while VADER is more sensitive to emotional extremes.
- Artists like Ed Sheeran often score higher on the positive sentiment scale, reflecting the upbeat tone of their lyrics.
- Songs from The Weeknd and Drake showcase both positive and negative sentiments, consistent with their emotionally diverse lyrical styles.

## How to Run
1. Clone this repository.
2. Install the required Python libraries:
   ```bash
   pip install lyricsgenius textblob vaderSentiment pandas
4. Get your Genius API token and save it in a Python file (e.g., `config.py`) as `GENIUS_API_TOKEN`.
5. Run the notebook or Python scripts for scraping and analysis.

## Future Improvements
- Expand the analysis to include more artists and genres.
- Visualize sentiment distributions using graphs (e.g., histograms, scatterplots).
- Apply machine learning models for more nuanced sentiment prediction.
- Analyze lyrical themes or keywords in conjunction with sentiment.

## Acknowledgments
- Genius API
- Python libraries: TextBlob, VaderSentiment, Pandas
