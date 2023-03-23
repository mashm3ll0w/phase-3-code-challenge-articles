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
