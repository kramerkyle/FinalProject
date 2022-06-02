# Final Project

## Link to Tableau Dashboards
* Exploratory Visualizations: 
  *  https://public.tableau.com/app/profile/kyle.kramer2933/viz/CountyViz/MedianIncomebyCounty?publish=yes
* Visualizations Based on the Model
  *  https://public.tableau.com/app/profile/christopher.j.swan/viz/Obesity_16536641738470/Obesity
## Link to Final Presentation Slides
* https://docs.google.com/presentation/d/1TxfKXZuDRwYgDGhfXwnc6uuwzr87GkwT84908qumvGI/edit?usp=sharing

## Presentation Paragraph
### Selected Topic
Our topic is:
How are health outcomes affected by city's walkability and the availability of public transit?
### Reason We Picked the Topic
We picked this topic because we have all been in a situation where we have not had a car and realized how difficult it is to get everyday necessities. We wanted to know if people are healthier who live in a more walkable area. A good example of this is if the grocery store is two miles and fast food is only a mile would that make a difference, same with health care.
### Questions We Hope to Answer with the Data
  1. Housing density and its effect on overall health
      - Public transit
      - Walkability 
  2. Distance from doctor's / emergency rooms
      - Distance form affordable health care (maybe approved by ACA)
  3. What other factors might affect the outcomes
      - median income
      - car ownership
      - average age
      - food availability
      - size of city
      - ethnicity
  4. Which variables affected the model the most
## Description of the data exploration phase of the project 
#### Finding a Link
In order to perform analysis on infrastructure and health data we first needed to find datasets that would be able to communicate well. This required us to identify a common thread, or column, that each dataset contained so that we could relate them to each other. Since we were analyzing how a location's infrastructure affected the health of the people living there, we could use that location's identifying information to link our health datasets to our infrastructure datasets. The Census Tract Number ended up being the perfect thread to tie each dataset together. Most government datasets would contain it, and it was a unique code to each Census Tract, allowing us to correctly link together a location's infrastructure and health data with little confusion.
#### Cleaning the Data
We were able to find a dataset containing health data for 500 cities in America, gathered by the CDC. Each city was split up by Census Tract Number, which allowed us to easily extract the rates of obesity of each individual Census Tract into its own dataframe. We found a similar dataset for life expectancy.

For infrastructure, we were able to find a dataset containing information on food accessibility in America from the USDA. This was also split up by Census Tract Number, and we narrowed the dataset down to the most prevalent information, which was food accessibility scores based on distance to travel. We then found a dataset containing a wealth of information on walkability, transit frequency, pedestrian network density, and other information pertinent to how people move about a city. This dataset, unfortunately, only contained the truncated Census Tract Number and not the full, unique ID that could communicate with the rest of the datasets. We fixed this by finding a dataset containing the State and County FIPS codes by county, which we merged with the previous dataset on the county column. We then concatenated the FIPS with the truncated Census Tract Number, which produced the full, unique ID for each census tract in the dataset.
### Modeling the Data
#### Data Preprocessing
To start off the model, we first loaded the data from SQL into dataframes within the notebook. Since the data had already been cleaned, we could merge the two dataframes, one containing the infrastructure data and the other containing the health data, on the Census Tract Number into one dataframe that would be easier to work with.
#### Feature Engineering
For the features, we decided to drop the columns describing the location of the data points (County, State, and Census Tract Number) since we only wanted to have the infrastructure of these data points affect the model. We also dropped the targets of the models, which were the rate of obesity and the life expectancy of people living in these areas. This left only the data we wanted to model, which described population density, employment density, walkability, car ownership, accessibility of food, frequency of transit usage, and connectivity of pedestrian walkways. The targets were then separated into two different models, one for life expectancy, and one for the rate of obesity.
#### Training and Testing Sets
We used the sklearn train_test_split to split the features and targets into training and testing sets for each model. The obesity model had obesity_X_train, obesity_X_test, obesity_y_train, and obesity_y_test, while the life expectancy model had life_X_train, life_X_test, life_y_train, and life_y_test.
#### Modeling
We chose to use the Random Forest Regressor model for this project. This was perfect for our needs since it could predict continuous values without having to use PCA to cut down on the number of features. This would allow us to use much more than three features in our model as well as letting us calculate the feature importance later. We needed the importance of the features so that we could see which aspects of infrastructure affected our targets the most so that we could build our presentation around them. Random Forest as a whole reduces overfitting and doesn't require feature normalization as well.
#### Model Training
The training required for this model was minimal. After a preliminary testing of the model, we dropped the % Low Income from the features since it heavily skewed the feature importance towards itself, and didn't fit the thesis of "Infrastructure vs. Health". Further training is not required due to the high accuracy of the model.
#### Accuracy and Confusion Matrix
Random Forest Regressor does not have a balanced accuracy score, but an accuracy score can be determined by first finding the mean absolute percentage error (MAPE) by subtracting the actual value from the predicted value, dividing by the actual value, and multiplying by 100. We then find the accuracy by subtracting the mean of the MAPE values from 100. The obesity model had an accuracy score of 88.33%, while the life expectancy model had an accuracy score of 96.67%.

Random Forest Regressor also does not have a confusion matrix since we are dealing with continuous values and not binary values. 
### Sites Used
  1. https://appdividend.com/2020/04/27/python-pandas-how-to-convert-sql-to-dataframe/
  2. https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/reviewing-changes-in-pull-requests/approving-a-pull-request-with-required-reviews
  3. https://chronicdata.cdc.gov/browse?category=500+Cities+%26+Places
  4. https://data.cdc.gov/NCHS/U-S-Life-Expectancy-at-Birth-by-State-and-Census-T/5h56-n989
  5. https://www.ers.usda.gov/data-products/food-access-research-atlas/
  6. https://chronicdata.cdc.gov/500-Cities-Places/500-Cities-Census-Tract-level-Data-GIS-Friendly-Fo/k86t-wghb
  7. https://edg.epa.gov/metadata/catalog/search/resource/details.page?uuid=%7B33514B4C-54F2-464A-BCC7-35F441B7E21A%7D
  8. https://www.kaggle.com/datasets/danofer/zipcodes-county-fips-crosswalk


## Commit to the Git
### Overview
We the people of Commit to the Git, in order to form a more perfect Union, establish justice, insure team tranquility, provide for the common communication, promote the general welfare, and secure the blessings of an excellent project to ourselves do ordain and establish this file.

### Communication Protocols
- In Person Meetings
  - Timing: Will be conducted between 7 - 9 PM ET, Mondays and Wednesdays
  - Purpose: Strategy, align on group action plans for the week and build connection
- Slack
  - Timing: Asynchronous and On-Going
  - Purpose: Task coordination, answering questions, and group bonding
- GitHub Comments
  - Timing: Tuesday, Thursday, Saturday, Sunday
  - Purpose: Deliver specific feedback on technical aspects
