require 'net/http'
require 'nokogiri'
require 'uri'
require 'open-uri'

require_relative './page'

class Browser
  def run!
    # Run the browser
    # Display a prompt for a user
    # Parse their input
    # Display useful results by instantiating
    #   a new Page and calling methods on it.
    
    # Questions:
    #  1. How can a user quit the browser gracefully?
    #  2. How can a user ask for help, i.e., how do they know what commands are available to them?
    puts "Insert URL"
    user_url = gets.chomp
    new_page = Page.new(user_url)
    new_page.fetch!

    loop do 
      puts 'What to extract?'
      puts '1. Title'
      puts '2. Links'
      puts '3. Exit'

      print 'Enter option number '
      input = gets.chomp
      puts ''

      case input

      when '1'
        new_page.title
      when '2'
        new_page.links
      when '3'
        break
      else
        puts 'Input not recognized. Please try again.'
        puts ''
        next
      end
    end
  end
end

Browser.new.run!