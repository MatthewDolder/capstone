# Project: Effect of Red Tide on Florida Gulf Coast Game Fishing
### Matthew Dolder
### January 6, 2022
### Last Updated: January 24, 2022

## Summary
This repository contains code and data used in the WGU capstone project entitled *Effect of Red Tide on Florida Gulf Coast Game Fishing*

## File Structure

### /wrangle/
Contains code used to process raw data and output in a for used for analysis.

### /analysis/
Contains code used to analyse the output data.  

### /data_sample/
Two months worth of raw data in csv format.  Jan-Feb 2020.  The full dataset is 30 years and too much to upload to Github. The full dataset can be downloaded from the sources listed below.  
See comment `#un-comment this line in test mode` in /wrangle/survey_Wrangle.Rmd

#### /data_sample/mrip
MRIP catch survey data. Courtesy: NOAA Fisheries. (NOAA 2021)

#### /data_sample/hab
K. brevis count data. Courtesy: Florida Fish and Wildlife Conservation Commission.  (FWFC 2021) 

### /data_out/
Data used for analysis.  Created by joining MRIP and HAB datasets, filtering unwanted fields, outliers, and geographic area. This data is for academic purposes only.  

## Sources
<p align="center">
Florida Fish and Wildlife Conservation Commission (2021, March 8) Recent Harmful Algal Bloom (HAB) Events. Tallahassee, FL: Florida Fish and Wildlife Conservation Commission. Retrieved from
https://geodata.myfwc.com/datasets/recent-harmful-algal-bloom-hab-events
</p>
<p align="center">
National Oceanic and Atmospheric Administration (2021, October 20) Recreational Fishing Data Downloads. (“Courtesy: NOAA Fisheries”) Washington, DC: U.S. Department of Commerce. Retrieved from https://www.fisheries.noaa.gov/recreational-fishing-data/recreational-fishing-data-downloads
</p>