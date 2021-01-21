require 'nokogiri'
require 'open-uri'

PAGE_URL = "https://coinmarketcap.com/all/views/all/"


def page_fetcher
# Fetch and parse HTML document / récupère et analyse le HTML
doc = Nokogiri::HTML(URI.open(PAGE_URL)) 
return doc
end 


def get_names(doc)
names = doc.xpath("//tr/td[3]").map{ |data| data = data.text} #.text permet d'afficher uniquement le texte ; #//tr permet d'englober tous les symboles dans cet exemple au lieu de /tr[1]/td[3]/div ; /tr[4]/td[3]/div 
return names
end 

def get_prices(doc)
prices = doc.css('.price___3rj7O').map { |data| data = data.text.delete("$").to_f} #permet de supprimer le symbole dollar
return prices
end 

def hash_creation(names,prices)
crypto = {} #toute la data sera affiché dans ces accolades 
crypto = Hash[names.zip prices]  #attention .zip important devant première entrer
puts "------the hash is served------- #{crypto}" #pour délimiter la donnée
end 

def perform # sert de menu de methode; permet d'executer uniquement les methodes entre def et end. Ne fonctionne pas si on ajoute pas perform apres le end
doc = page_fetcher
names = get_names(doc)
prices = get_prices(doc)
get_names(doc)
get_prices(doc)
hash_creation(names,prices)

end 

perform #permet de lancer

