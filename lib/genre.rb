class Genre
  
    attr_accessor :name,:songs
    extend Concerns::Findable

  @@all=[]

    def initialize(name)
      @name=name
      @songs=[]
    end

    def self.all
      @@all
    end

    def self.destroy_all
      @@all.clear
    end

    def save
      @@all << self
    end

    def self.create(name)
      new_created = self.new(name)
      new_created.save
      new_created
    end

    def artists
      array =[]
      @songs.each{|song| array << song.artist}
      array.uniq
    end

end