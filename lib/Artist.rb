class Artist
  extend Concerns::Findable

  attr_accessor :name
  @@all = []

    def initialize(name)
      @name = name
      @songs = []
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
      artist = self.new(name)
      artist.save
      artist
    end

    def add_song(s_obj)
        if @songs.include?(s_obj) || s_obj.artist.nil? == false
          @songs
        #elsif s_obj.artist.nil? == false
        #  @songs
        else
          @songs << s_obj
          s_obj.artist = self
        end

        #s_obj.artist = self
        #@songs << s_obj unless @songs.include?(self)
      end

    def songs
      @songs
    end

    def genres
      @songs.collect{|song| song.genre}.uniq
    end
end # => End Artist class
