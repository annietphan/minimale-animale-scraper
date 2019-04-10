require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  ROOT_URL = "https://minimale-animale.com"

  def self.scrape_minimaleanimale
    html = open(ROOT_URL + "/collections/cover-ups")
    doc = Nokogiri::HTML(html)
    doc.css(".products").css(".product-url").each do |coverup|
      item = coverup.css(".title").text.strip
      url = coverup.attr("href")
      coverup = Coverup.new(item, url)
      coverup.save
    end
  end

  def self.scrape_details(item)
    html = open(ROOT_URL + item.url)
    doc = Nokogiri::HTML(html)
    item.price = doc.css(".seven.columns.omega").css(".money").text.strip
  end

end
