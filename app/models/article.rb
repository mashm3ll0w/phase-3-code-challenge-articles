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
        @author.name
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
