class Artist

  attr_accessor :name,:songs
  extend Concerns::Findable

  @@all=[]

    def initialize(name)
      @name=name
      @songs =[]
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

    def add_song(song)
      if song.artist == nil
        song.artist = self
      end
      if @songs.detect(song)== false
        @songs << song
      end

    end

    def genres
      array =[]
      @songs.each{|song| array << song.genre}
      array.uniq
    end





end