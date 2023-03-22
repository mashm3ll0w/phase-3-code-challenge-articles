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


end
