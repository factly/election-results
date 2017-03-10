import scrapy
from scrapy import Request

class CWACResultsSpider(scrapy.Spider):
    name = "cw-all-candidates"
    def start_requests(self):
        for i in range(40):
            if self.endpoint == 'archive':            
                yield Request('https://web.archive.org/web/20160823114553/http://eciresults.nic.in/ConstituencywiseS03%s.htm?ac=%s' % (i+1,i+1), callback=self.parse)
            else:
                yield Request('http://eciresults.nic.in/ConstituencywiseS05%s.htm?ac=%s' % (i+1,i+1), callback=self.parse)              
    def parse(self, response):
	results = response.css('#div1 > table > tr')
        for result in results[3:len(results)-1]:
            yield {
                'state': results[0].css('td::text').extract_first().split(' - ')[0],
		'constituency': results[0].css('td::text').extract_first().split(' - ')[1],
		'candidate': result.css('td::text')[0].extract(),
                'party': result.css('td::text')[1].extract(),
                'votes': result.css('td::text')[2].extract(),
		'status': results[1].css('td::text').extract_first(),
            }

class CWTrendsSpider(scrapy.Spider):
    name = "cw-trends"
    def start_requests(self):
        if self.endpoint == 'archive':
            yield Request('https://web.archive.org/web/20160823114553/http://eciresults.nic.in/StatewiseS03.htm', callback=self.parse)
        else:
            yield Request('http://eciresults.nic.in/StatewiseS05.htm', callback=self.parse)
        for i in range(3):
            if self.endpoint == 'archive':
                yield Request('https://web.archive.org/web/20160823114553/http://eciresults.nic.in/StatewiseS03%s.htm' % (i+1), callback=self.parse)
            else:  
                yield Request('http://eciresults.nic.in/StatewiseS05%s.htm' % (i+1), callback=self.parse)
    
    def parse(self, response):
        results = response.css('#divACList > table > tr')
        for result in results[4:len(results)-1]:
            yield {
                'constituency': result.css('td::text')[0].extract(),
                'const. no.': result.css('td::text')[1].extract(),
                'leading candidate': result.css('td::text')[2].extract(),
                'leading party': result.css('td::text')[3].extract(),
		'trailing candidate': result.css('td::text')[4].extract(),
		'trailing party': result.css('td::text')[5].extract(),
		'margin': result.css('td::text')[6].extract(),
		'status': result.css('td::text')[7].extract()
            }

