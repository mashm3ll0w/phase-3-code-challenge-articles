require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end


###  WRITE YOUR TEST CODE HERE ###
author1 = Author.new(name: "Charles")
mag1 = Magazine.new(name: "Buzz", category: "Lifestyle")
art1 = Article.new(author: author1, magazine: mag1, title: "Sunrise")
author2 = Author.new(name: "Edwin")
mag2 = Magazine.new(name: "Insyder", category: "Teens")
art2 = Article.new(author: author2, magazine: mag2, title: "School")
mag3 = Magazine.new(name: "Saturday", category: "Adults")
art3 = Article.new(author: author2, magazine: mag3, title: "Marriage")
art4 = Article.new(author: author2, magazine: mag3, title: "Marriage")





### DO NOT REMOVE THIS
binding.pry

0
