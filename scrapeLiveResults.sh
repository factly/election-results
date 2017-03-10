#!/bin/bash
echo "********HELLO FOLKS, STARTING THE SCRIPT TO SCRAPE THE ARCHIVED RESULTS FROM ECIRESULTS************"
echo "********STARTING BACKUP FOR THE EXISTING RESULTS DIRECTORY TO THE BACKUPS FOLDER***************"
cp -R results backups/results_"$(date +%Y%m%d%H%M%S)"
echo "********COMPLETED BACKUP OF THE EXISING RESULTS TO THE BACKUPS FOLDER*******************"

echo "********STARTING SCRAPING THE PUNJAB CONSTITUENCY-WISE RESULTS***************"
cd punjab && scrapy crawl cw-all-candidates -a endpoint=archive -t csv -o - > ../results/punjab-cw-all-candidates.csv && cd ..
echo "********COMPLETED SCRAPING THE PUNJAB CONSTITUENCY-WISE RESULTS*************"
echo "********STARTING SCRAPING THE PUNJAB CONSTITUENCY-WISE TRENDS***************"
cd PUNJAB && scrapy crawl cw-trends -a endpoint=archive -t csv -o - > ../results/punjab-cw-trends.csv && cd ..
echo "********COMPLETED SCRAPING THE PUNJAB CONSTITUENCY-WISE TRENDS*************"

echo "********STARTING SCRAPING THE GOA CONSTITUENCY-WISE RESULTS***************"
cd goa && scrapy crawl cw-all-candidates -a endpoint=archive -t csv -o - > ../results/goa-cw-all-candidates.csv && cd ..
echo "********COMPLETED SCRAPING THE GOA CONSTITUENCY-WISE RESULTS*************"
echo "********STARTING SCRAPING THE GOA CONSTITUENCY-WISE TRENDS***************"
cd goa && scrapy crawl cw-trends -a endpoint=archive -t csv -o - > ../results/goa-cw-trends.csv && cd ..
echo "********COMPLETED SCRAPING THE GOA CONSTITUENCY-WISE TRENDS*************"

echo "********STARTING SCRAPING THE MANIPUR CONSTITUENCY-WISE RESULTS***************"
cd manipur && scrapy crawl cw-all-candidates -a endpoint=archive -t csv -o - > ../results/manipur-cw-all-candidates.csv && cd ..
echo "********COMPLETED SCRAPING THE MANIPUR CONSTITUENCY-WISE RESULTS*************"
echo "********STARTING SCRAPING THE MANIPUR CONSTITUENCY-WISE TRENDS***************"
cd manipur && scrapy crawl cw-trends -a endpoint=archive -t csv -o - > ../results/manipur-cw-trends.csv && cd ..
echo "********COMPLETED SCRAPING THE MANIPUR CONSTITUENCY-WISE TRENDS*************"

echo "********STARTING SCRAPING THE UTTARAKHAND CONSTITUENCY-WISE RESULTS***************"
cd uttarakhand && scrapy crawl cw-all-candidates -a endpoint=archive -t csv -o - > ../results/uttarakhand-cw-all-candidates.csv && cd ..
echo "********COMPLETED SCRAPING THE UTTARAKHAND CONSTITUENCY-WISE RESULTS*************"
echo "********STARTING SCRAPING THE UTTARAKHAND CONSTITUENCY-WISE TRENDS***************"
cd uttarakhand && scrapy crawl cw-trends -a endpoint=archive -t csv -o - > ../results/uttarakhand-cw-trends.csv && cd ..
echo "********COMPLETED SCRAPING THE UTTARAKHAND CONSTITUENCY-WISE TRENDS*************"

echo "********STARTING SCRAPING THE UTTAR PRADESH CONSTITUENCY-WISE RESULTS***************"
cd uttarpradesh && scrapy crawl cw-all-candidates -a endpoint=archive -t csv -o - > ../results/uttarpradesh-cw-all-candidates.csv && cd ..
echo "********COMPLETED SCRAPING THE UTTAR PRADESH CONSTITUENCY-WISE RESULTS*************"
echo "********STARTING SCRAPING THE UTTAR PRADESH CONSTITUENCY-WISE TRENDS***************"
cd uttarpradesh && scrapy crawl cw-trends -a endpoint=archive -t csv -o - > ../results/uttarpradesh-cw-trends.csv && cd ..
echo "********COMPLETED SCRAPING THE UTTAR PRADESH CONSTITUENCY-WISE TRENDS*************"

echo "********STARTING SCRAPING THE PARTY-WISE RESULTS***************"
cd pwresults && scrapy crawl pw-results -a endpoint=archive -t csv -o - > ../results/pw-results.csv && cd .. 
echo "********COMPLETED SCRAPING THE PARTY-WISE RESULTS*************"

echo "********COMPLETED SCRAPING ALL THE LIVE RESULTS*************"