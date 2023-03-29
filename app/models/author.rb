class Author
  attr_reader :name
  # attr_writer :name -> only write(change the value of the attribute)
  # attr_accessor :name

  def initialize(name:)
    @name = name
  end

  def whoami
    self
  end

  # def name=(new_name)
  #   @name = new_name
  # end

  # def name
  #   @name
  # end

  # Returns all the articles written by a specific author
  def articles
    Article.all.select { |article| article.author == self } #self -> the Author object that is/was created
  end

  def magazines
    author_mags = []
    Article.all.select do |article|
      author_mags << article.magazine if article.author == self
    end
    author_mags.uniq
  end

  def add_article(magazine:, title:)
    if magazine.is_a?(Magazine) && title.is_a?(String)
      Article.new(author: self, magazine: magazine, title: title)
    end
  end

  def topic_areas
    author_categories = []
    Article.all.select do |article|
      author_categories << article.magazine.category if article.author == self
    end
    author_categories.uniq
  end
end
