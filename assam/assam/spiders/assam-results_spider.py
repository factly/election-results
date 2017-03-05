import scrapy
from scrapy import Request

class QuotesSpider(scrapy.Spider):
    name = "results"
    # start_urls = [
    #    'http://eciresults.nic.in/ConstituencywiseS0335.htm?ac=35',
    # ]
    
    url = 'http://eciresults.nic.in/ConstituencywiseS03'
    def start_requests(self):
        for i in range(126):
            yield Request('http://eciresults.nic.in/ConstituencywiseS03%s.htm?ac=%s' % (i,i), callback=self.parse)

    def parse(self, response):
	results = response.css('#div1 > table > tr')
        for result in results[3:len(results)-1]:
            yield {
                'state': results[0].css('td::text').extract_first().split(' - ')[0],
		'constituency': results[0].css('td::text').extract_first().split(' - ')[1],
		'candidate': result.css('td::text')[0].extract(),
                'party': result.css('td::text')[1].extract(),
                'votes': result.css('td::text')[2].extract()
            }
