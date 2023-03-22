require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end


###  WRITE YOUR TEST CODE HERE ###
author1 = Author.new(name: "Charles")
author2 = Author.new(name: "Edwin")
author3 = Author.new(name: "Pauline")

mag1 = Magazine.new(name: "Buzz", category: "Lifestyle")
mag2 = Magazine.new(name: "Insyder", category: "Teens")
mag3 = Magazine.new(name: "Saturday", category: "Adults")

art1 = Article.new(author: author1, magazine: mag1, title: "Sunrise")
art5 = Article.new(author:author3, magazine: mag1, title: "Fun")
art2 = Article.new(author: author2, magazine: mag2, title: "School")
art3 = Article.new(author: author2, magazine: mag3, title: "Marriage")
art4 = Article.new(author: author2, magazine: mag3, title: "Marriage")







### DO NOT REMOVE THIS
binding.pry

0
