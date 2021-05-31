# The Data Visualization Tool Guide  
Author: Anni Chai  
Last Modified: May 2021

### About
This R shiny app is a self-guided tool that gives personalized recommendations of what data visualization tool to use based on user input.

### Files
__app.R__: R code for the webapp itself. Change in here when modifying or updating the display/logic of the app  
__r_matrix.csv__: Matrix that contains how each of the tool meets/does not meet the requirement. Columns are tools and rows are descriptions of requirements. This file needs to be updated when adding a new tool.  
__typical.csv__: Matrix that contains the rating of each feature category, that a typical user of each user type would give.  

### Data
The data used to determine a typical user's rating of each category is based on the reponses collected from Cyanna Chung's data visualization survey.  
The matrix that contains how each tool meets/does not meet a requirement comes from Anni Chai's research. This matrix should be cross-checked and needs to be maintained as technology evolves.  


### Calculation Method  
To make recommendations, we use the rating (0-5) of each category of features, and treat them as weights.
In every category, each requirement that the tool can meet will add a score of __question rating * category rating__ to the tool's total score.
The tools will then be ranked based on total score in descending order.  

Note: This calculation method is not proven to be perfect. Validating it and experimenting with other methods in the future is necessary.  

### Deployment  
This app is hosted on ____ server. 

### Change Security Settings/Share This repo
Go to "Members", "Invite a Member" and don't put in a expiration date if you do not want the access to expire.

