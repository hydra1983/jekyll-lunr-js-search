require 'nokogiri'

module Jekyll

  class PageRenderer
    def initialize(site)
      @site = site
    end
    
    # render the item, parse the output and get all text inside <p> elements
    def render(item)
      item.render({}, @site.site_payload)
      doc = Nokogiri::HTML(item.output)
      paragraphs = doc.search('//text()').map {|t| t.content }
      paragraphs = paragraphs.join(" ").gsub("\r"," ").gsub("\n"," ").gsub("\t"," ")
    end
  end
  
end