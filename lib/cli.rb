require 'nokogiri'
require 'open-uri'
require 'pry'


class Cli
  def run
    puts "Hey there! Check out Minimale Animale's new cover-ups below:"
    Scraper.scrape_minimaleanimale
    display_coverups
    menu
  end

  def display_coverups
    Coverup.all.each.with_index(1) do |item, i|
      puts "#{i}. #{item.name}"
    end
  end

  def menu
    puts "What do you want to splurge on today?"
    input = gets.chomp

    item = Coverup.all[input.to_i - 1]

    if !item
      puts "That's not a part of our collection!"
      puts "Please choose another coverup!"
      menu
    else
      Scraper.scrape_details(item)
      puts "Here are the product details for #{item.name}:"
      puts "Price: #{item.price}"
      choice
    end
  end

  def choice
    puts "Would you like to add another item to your cart? Please enter y/n."

    input = gets.chomp

    if input == "y"
      menu
    elsif input == "n"
      puts "Thank you for your purchase! Your order is now pending."
    end
  end



end
