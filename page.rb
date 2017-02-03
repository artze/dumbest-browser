
class Page
  def initialize(url)
    @url = url
  end
  
  def fetch!
    print 'Fetching'
    6.times do
      sleep(0.2)
      print '.'
    end
    puts ''
    @html = Nokogiri::HTML(open(@url))
  end
  
  def title
    puts 'Page Title: ' + @html.css('title').text
    puts ''
  end
  
  def links
    # Research alert!
    # How do you use Nokogiri to extract all the link URLs on a page?
    #
    # These should only be URLs that look like
    #   <a href="http://somesite.com/page.html">Click here!</a>
    # This would pull out "http://somesite.com/page.html"
    puts 'All links in page:'
    @html.css('a[href ^= http]').each do |link|
      puts link['href']
    end
    puts ''
  end
end