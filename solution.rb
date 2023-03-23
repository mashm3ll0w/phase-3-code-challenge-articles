# Please copy/paste all three classes into this file to submit your solution!
class Article
  attr_reader :author, :magazine, :title

  @@all = []

  def initialize(author:, magazine:, title:)
    if author.is_a?(Author) && magazine.is_a?(Magazine)
      @author = author
      @magazine = magazine
      @title = title
      @@all << self
    else
      begin
        raise WrongClassError
      rescue WrongClassError => error
        puts error.message
      end
    end
  end

  def self.all
    @@all
  end

  def author
    @author
  end

  def magazine
    # ["#{@magazine.name}, #{@magazine.category}"]
    @magazine
  end

  class WrongClassError < StandardError
    def message
      "Check the data types of the Author and/or Magazine"
    end
  end
end

class Magazine
  # attr_accessor :name, :category

  @@all = []

  def initialize(name:, category:)
    @name = name
    @category = category
    @@all << self
  end

  def name
    @name
  end

  def category
    @category
  end

  def self.all
    @@all
  end

  def contributors
    mag_contributors = []
    Article.all.select do |article|
      if article.magazine.name == @name
        mag_contributors << article.author
      end
    end
    mag_contributors.uniq
  end

  def self.find_by_name(name)
    Article.all.find do |article|
      article.magazine.name == name
    end
  end

  def article_titles
    all_titles = []
    Article.all.select do |article|
      if article.magazine == self
        all_titles << article.title
      end
    end
    all_titles
  end

  def contributing_authors
    all_authors = []
    Article.all.select do |article|
      article.magazine == self
    end.map do |article|
      article.author.name
    end.tally.select do |key, value|
      value > 2
    end.keys
  end
end

class Author
  attr_reader :name

  def initialize(name:)
    @name = name
  end

  def articles
    Article.all.select { |article| article.author == self }
  end

  def magazines
    author_mags = []
    Article.all.select do |article|
      if article.author == self
        author_mags << article.magazine
      end
    end
    author_mags.uniq
  end

  def add_article(magazine:, title:)
    Article.new(author: self, magazine: magazine, title: title)
  end

  def topic_areas
    author_categories = []
    Article.all.select do |article|
      if article.author == self
        author_categories << article.magazine.category
      end
    end
    author_categories.uniq
  end
end
