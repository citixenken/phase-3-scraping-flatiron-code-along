require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper
  def get_page
    html = URI.open('http://learn-co-curriculum.github.io/site-for-scraping/courses')
    Nokogiri::HTML(html)

    # binding.pry test data
    # =====================
    # doc = Nokogiri::HTML(html)
    # doc.css('article.post').first.css('h2').text => title
    # doc.css('article.post').first.css('em.date').text => schedule
    # doc.css('article.post').first.css('p').text => description

    # doc.css('article.post').collect do |post|
    #   course = Course.new
    #   course.title = post.css('h2').text
    #   course.schedule = post.css('em.date').text
    #   course.description = post.css('p').text
    # end
    # binding.pry
  end

  def get_courses
    self.get_page.css('article.post')
  end

  def make_courses
    self.get_courses.collect do |post|
        course = Course.new
        course.title = post.css('h2').text
        course.schedule = post.css('em.date').text
        course.description = post.css('p').text
      end
  end
  
  def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title && course.title != ""
        puts "  Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end
  
end

Scraper.new.get_page


