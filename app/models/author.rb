class Author
  attr_reader :name


  def initialize(name:)
    @name = name
  end

  def articles
    Article.all.select { |article| article.author == @name }
  end

  def magazines
    author_mags = []
    Article.all.select do |article| 
      if article.author == @name
        author_mags << article.magazine
      end
    end
    author_mags.uniq
  end


end
