#!/bin/bash
echo "********HELLO FOLKS, STARTING THE SCRIPT TO SCRAPE THE ARCHIVED RESULTS FROM ECIRESULTS************"
echo "********STARTING BACKUP FOR THE EXISTING RESULTS DIRECTORY TO THE BACKUPS FOLDER***************"
cp -R results backups/results_"$(date +%Y%m%d%H%M%S)"
echo "********COMPLETED BACKUP OF THE EXISING RESULTS TO THE BACKUPS FOLDER*******************"
echo "********STARTING SCRAPING THE ASSAM CONSTITUENCY-WISE RESULTS***************"
cd assam && scrapy crawl cw-all-candidates -a endpoint=archive -t csv -o - > ../results/assam-cw-all-candidates.csv && cd ..
echo "********COMPLETED SCRAPING THE ASSAM CONSTITUENCY-WISE RESULTS*************"
echo "********STARTING SCRAPING THE ASSAM CONSTITUENCY-WISE TRENDS***************"
cd assam && scrapy crawl cw-trends -a endpoint=archive -t csv -o - > ../results/assam-cw-trends.csv && cd ..
echo "********COMPLETED SCRAPING THE ASSAM CONSTITUENCY-WISE TRENDS*************"
echo "********STARTING SCRAPING THE ASSAM PARTY-WISE RESULTS***************"
cd pwresults && scrapy crawl pw-results -a endpoint=archive -t csv -o - > ../results/pw-results.csv && cd .. 
echo "********COMPLETED SCRAPING THE ASSAM PARTY-WISE RESULTS*************"
echo "********COMPLETED SCRAPING THE ARCHIVED ASSAM RESULTS*************"