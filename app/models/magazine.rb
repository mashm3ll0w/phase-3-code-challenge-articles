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
