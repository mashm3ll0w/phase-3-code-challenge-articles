class Magazine
  attr_accessor :name, :category

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
      mag_contributors << article.author if article.magazine == self
    end
    mag_contributors.uniq
  end

  def self.find_by_name(name)
    Magazine.all.find { |magazine| magazine.name == name }
  end

  def article_titles
    all_titles = []
    Article.all.select do |article|
      all_titles << article.title if article.magazine == self
    end
    all_titles
  end

  def contributing_authors
    all_authors = []

    Article
      .all
      .select { |article| article.magazine == self }
      .map { |article| article.author.name }
      .tally
      .select { |key, value| value > 2 }
      .keys
  end
end
