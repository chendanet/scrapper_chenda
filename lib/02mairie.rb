require 'nokogiri'
require 'open-uri'
PAGE_URL = "http://annuaire-des-mairies.com/77/pontault-combault.html"

def page_fetcher  
  return page = Nokogiri::HTML(URI.open(PAGE_URL))
end
 
def get_cities(page)  
  city = page.xpath('//html/body/div/header/section/div/div[1]/h1/small').map {|element| element = element.text.gsub("Commune de", "")}
  return city
end 

def get_email(page)  
  email = page.xpath('//html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').map {|element| element = element.text}
  return email   
end 

def pontault_hash (city, email)
  supahash = Hash[city.zip email]
  puts " Los Angeles of France : #{supahash}"
end



def perform

page = page_fetcher 
city = get_cities (page)
email = get_email (page)

get_cities(page)
get_email(page)
pontault_hash(city, email)

end 

perform 
