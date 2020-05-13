if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require 'uri'
require 'net/http'
require 'rexml/document'
require 'date'

date = Date.today

uri_dpr = URI.parse('https://pf-soft.net/service/rates-dnr/')
uri_ua = URI.parse('https://bank.gov.ua/NBUStatService/v1/statdirectory/exchange')
uri_ru = URI.parse('http://www.cbr.ru/scripts/XML_daily.asp')

response_dpr = Net::HTTP.get_response(uri_dpr)
response_ua = Net::HTTP.get_response(uri_ua)
response_ru = Net::HTTP.get_response(uri_ru)

doc_dpr = REXML::Document.new(response_dpr.body)
doc_ua = REXML::Document.new(response_ua.body)
doc_ru = REXML::Document.new(response_ru.body)

#---------------------------------------------------------------------------------

name_dpr_usd = doc_dpr.root.elements['Valute[@id="1"]'].elements['Name'].text
value_dpr_usd = doc_dpr.root.elements['Valute[@id="1"]'].elements['Value'].text
code_dpr_usd = doc_dpr.root.elements['Valute[@id="1"]'].elements['CharCode'].text
name_dpr_eur = doc_dpr.root.elements['Valute[@id="2"]'].elements['Name'].text
value_dpr_eur = doc_dpr.root.elements['Valute[@id="2"]'].elements['Value'].text
code_dpr_eur = doc_dpr.root.elements['Valute[@id="2"]'].elements['CharCode'].text
name_dpr_ua = doc_dpr.root.elements['Valute[@id="3"]'].elements['Name'].text
value_dpr_ua = doc_dpr.root.elements['Valute[@id="3"]'].elements['Value'].text
code_dpr_ua = doc_dpr.root.elements['Valute[@id="3"]'].elements['CharCode'].text

#------------------------------------------------------------------------------------

name_ru_usd = doc_ru.root.elements['Valute[@ID="R01235"]'].elements['Name'].text
value_ru_usd = doc_ru.root.elements['Valute[@ID="R01235"]'].elements['Value'].text
code_ru_usd = doc_ru.root.elements['Valute[@ID="R01235"]'].elements['CharCode'].text
name_ru_eur = doc_ru.root.elements['Valute[@ID="R01239"]'].elements['Name'].text
value_ru_eur = doc_ru.root.elements['Valute[@ID="R01239"]'].elements['Value'].text
code_ru_eur = doc_ru.root.elements['Valute[@ID="R01239"]'].elements['CharCode'].text
name_ru_ua = doc_ru.root.elements['Valute[@ID="R01720"]'].elements['Name'].text
value_ru_ua = doc_ru.root.elements['Valute[@ID="R01720"]'].elements['Value'].text
code_ru_ua = doc_ru.root.elements['Valute[@ID="R01720"]'].elements['CharCode'].text

#------------------------------------------------------------------------------------

name_ua_usd = doc_ua.root.elements[27].elements['txt'].text
value_ua_usd = doc_ua.root.elements[27].elements['rate'].text
code_ua_usd = doc_ua.root.elements[27].elements['cc'].text
name_ua_eur = doc_ua.root.elements[34].elements['txt'].text
value_ua_eur = doc_ua.root.elements[34].elements['rate'].text
code_ua_eur = doc_ua.root.elements[34].elements['cc'].text
name_ua_ru = doc_ua.root.elements[19].elements['txt'].text
value_ua_ru = doc_ua.root.elements[19].elements['rate'].text
code_ua_ru = doc_ua.root.elements[19].elements['cc'].text


#------------------------------------------------------------------------------------

puts "\nКурс валют на сегодня, #{date.strftime('%d.%m.%Y')}."
puts "\n**************************************"
puts "Центральный Республиканский Банк, ДНР."
puts

puts "#{name_dpr_usd}(#{code_dpr_usd}): #{value_dpr_usd} руб."
puts "#{name_dpr_eur}(#{code_dpr_eur}): #{value_dpr_eur} руб."
puts "#{name_dpr_ua}(#{code_dpr_ua}): #{value_dpr_ua} руб."

puts "\n**************************************"
puts "Нацбанк, Украина."
puts

puts "#{name_ua_usd}(#{code_ua_usd}): #{value_ua_usd} грн."
puts "#{name_ua_eur}(#{code_ua_eur}): #{value_ua_eur} грн."
puts "#{name_ua_ru}(#{code_ua_ru}): #{value_ua_ru} грн."

puts "\n**************************************"
puts "Центробанк, Российская Федерация."
puts

puts "#{name_ru_usd}(#{code_ru_usd}): #{value_ru_usd} руб."
puts "#{name_ru_eur}(#{code_ru_eur}): #{value_ru_eur} руб."
puts "#{name_ru_ua}(#{code_ru_ua}): #{value_ru_ua} руб."
puts
gets
