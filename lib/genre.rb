class Genre
    attr_accessor :name
    include Concerns::Findable
    extend Concerns::ClassMods

    @@all = []
    
    def self.all
        @@all
    end

end
