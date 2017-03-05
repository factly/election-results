# Scraping 2017 election results from ECI Results #

## Prerequisites: ##

* Python > 2.7
  
* Scrapy - To Install follow the steps from here: https://doc.scrapy.org/en/1.3/intro/install.html#intro-install


## Steps to run the scripts ##

* cd into the state for which you would like to scrape the results. for eg: cd assam
* Execute the following command: 
    * scrapy crawl results -t csv  -o - > results.csv
    * scrapy crawl results -t csv --nolog -o - > results.csv (If you prefer executing the script without logging on the console)
* The above command creates a new file with the name results.csv with the scraped election results for the state. If you run this multiple times it replaces the existing results.csv file.
