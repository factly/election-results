# Scraping 2017 election results from ECI Results #

## Prerequisites: ##

* Python > 2.7
  
* Scrapy - To Install follow the steps from here: https://doc.scrapy.org/en/1.3/intro/install.html#intro-install

## Command to run the entire script ##

* From the top most directory, exectute the following command to get the Live results:
    * ./scrapeLiveResults.sh
* To test the archive assam results execute the following command:
    * ./scrapeArchiveResults.sh
## Steps to run the scripts individually##

* Execute the following command for the results for constituency-wise all candidates (for eg: assam): 
    * cd assam && scrapy crawl cw-all-candidates -a endpoint=live -t csv -o - > ../results/assam-cw-all-candidates.csv && cd .. (This is for the live results)
    * cd assam && scrapy crawl cw-all-candidates -a endpoint=archive -t csv -o - > ../results/assam-cw-all-candidates.csv && cd .. (This is for the archived results)
    
    * cd assam && scrapy crawl cw-all-candidates -a endpoint=live --nolog -t csv -o - > ../results/assam-cw-all-candidates.csv && cd .. (If you prefer executing the script without logging on the console)
    
* Execute the following command for the constituency-wise trends (for eg: assam): 
    * cd assam && scrapy crawl cw-trends -a endpoint=live -t csv -o - > ../results/assam-cw-trends.csv && cd .. (This is for the live results)
    * cd assam && scrapy crawl cw-trends -a endpoint=archive -t csv -o - > ../results/assam-cw-trends.csv && cd .. (This is for the archived results)
    
    * cd assam && scrapy crawl cw-trends -a endpoint=live --nolog -t csv -o - > ../results/assam-cw-trends.csv && cd .. (If you prefer executing the script without logging on the console)

* Execute the following command to get the party-wise results for all states: 
    * cd pwresults && scrapy crawl pw-results -a endpoint=live -t csv -o - > ../results/pw-results.csv && cd .. (This is for the live results)
    * cd pwresults && scrapy crawl pw-results -a endpoint=archive -t csv -o - > ../results/pw-results.csv && cd .. (This is for the archived results)
    
    * cd pwresults && scrapy crawl pw-results -a endpoint=live --nolog -t csv -o - > ../results/pw-results.csv && cd .. (If you prefer executing the script without logging on the console)
    
* The above commands creates new files in the results directory with the scraped election results for the state. If you run this multiple times it replaces the existing files.
