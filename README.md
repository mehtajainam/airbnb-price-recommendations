# Airbnb price recommendations

GitHub repository for our final project of the 'Data Mining Principles' course at the University of Chicago. 
https://github.com/mehtajainam/airbnb-price-recommendations

### Authors: Amy Lin, Brad Jumagulov, Jainam Mehta, Prabhat Singh, Rameez Jafri
### Date: 11 March 2020

As an Airbnb host, pricing your new listing can be a tricky problem to solve. One needs to account for several factors such as the location of the listing, the amenities being offered, the property and room types, and much more, in order to competitively price their listing. If you price too high, you might drive away potentials guests to other listing, but price too low and you wouldn't be making the most potential income. 

In order to solve this problem, we use data mining techinques and machine learning to predict the ideal price for an Airbnb listing. We use a public dataset on listings from New York City found [here](http://insideairbnb.com/get-the-data.html).

The insights from this analysis project can be used by new Airbnb hosts, in helping them set a price for their new listings. Furthermore, existing hosts and Airbnb themselves could use this to determine whether or not a current listing is priced competitively and in line with the rest of the listings in a particular city. 

This project and repository comprises the following:


### Data Cleaning and Preparation

1. Data-preparation.ipynb

Here, we clean the data by removing all listings with no reviews in the past 12 months. Furthermore, we handle outliers and missing data and create train and test datasets to perform further modelling on. 


### Data Exploration and Supervised Modelling

1. Data Exploration 

2. Preliminary analysis on Amenities

3. Latent Class Analysis

4. K-means Clustering


### Unsupervised Modelling

1. Linear model

2. Decision Trees

3. Cluster-wise Decision Trees

4. RandomForest.ipynb  




### Data Dictionary

LCA Analysis:

* hos2_is_superhos2: 1 - false, 2 - true
* room type: 1 - Entire home/apt, 2 - Hotel room, 3 - Private room, 4 - Shared room
* amenities: 1 - false, 2 - true
* neighbourhood_group_cleansed: 1 - Bronx, 2 - Brooklyn, 3 - Manhattan, 4 - Queens, 5 - Staten Island
* property_type: 1 - Condominium, 2 - Apartment, 3 - Townhouse, 4 - House, 5 - Loft, 6 - Other


### Previous work on this data:

https://towardsdatascience.com/airbnb-rental-listings-dataset-mining-f972ed08ddec  
https://rstudio-pubs-static.s3.amazonaws.com/407929_afc5ef0f2ad648389447a6ca3f4a7cd4.html