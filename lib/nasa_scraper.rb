require 'nokogiri'
require 'open-uri'

def nasa_search_scrapper(search)
  url = "https://nasasearch.nasa.gov/search?affiliate=nasa&sort_by=&query=#{search}"
  html = URI.open(url)
  doc = Nokogiri::HTML(html)

  result_array = []

  doc.search('#results h4 a').each_with_index do |element, index|
    result_array << "#{index + 1} - #{element.text.strip}"
  end

  puts result_array
end

puts "Welcome to the NASA Web Scraper, what would you like to search"
search = gets.chomp

nasa_search_scrapper(search)
