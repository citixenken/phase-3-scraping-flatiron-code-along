# require 'nokogiri'
# require 'open-uri'
# require 'awesome_print'

# html = URI.open('http://learn-co-curriculum.github.io/site-for-scraping/courses')
# doc = Nokogiri::HTML(html)
# courses = doc.css('article.post > h2')

# ap courses

class Course
    attr_accessor :title, :schedule, :description
    
    @@all = []

    def initialize
        @@all << self
    end

    def self.all
        @@all
    end

    def self.reset_all
        @@all.clear
    end
end

