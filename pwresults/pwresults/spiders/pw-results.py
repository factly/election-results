import scrapy
from scrapy import Request

class PWResults(scrapy.Spider):
    name = "pw-results"
    def start_requests(self):
        if self.endpoint=='archive':
            urls = [
                'https://web.archive.org/web/20160823114553/http://eciresults.nic.in/PartyWiseResultS03.htm?st=S03',
                'https://web.archive.org/web/20160816191804/http://eciresults.nic.in/PartyWiseResultS22.htm?st=S22'
            ]
        else:
            urls = [
                'http://eciresults.nic.in/PartyWiseResultS24.htm?st=S24',
                'http://eciresults.nic.in/PartyWiseResultS19.htm?st=S19',
                'http://eciresults.nic.in/PartyWiseResultS05.htm?st=S05',
                'http://eciresults.nic.in/PartyWiseResultS14.htm?st=S14',
                'http://eciresults.nic.in/PartyWiseResultS28.htm?st=S28'
         ]        
        for url in urls:
            yield scrapy.Request(url=url, callback=self.parse)
    
    def parse(self, response):
        results = response.css('#div1 > table > tr')
        for result in results[3:len(results)-4]:
            yield {
                'state': results[0].css('td::text').extract_first().split('<br>')[0].lstrip().split(u'\xa0')[0],
                'party': result.css('td::text')[0].extract(),
                'won': result.css('td::text')[1].extract(),
                'leading': result.css('td::text')[2].extract(),
                'total': result.css('td::text')[3].extract()
            }
