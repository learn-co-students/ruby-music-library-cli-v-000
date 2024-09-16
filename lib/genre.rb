class Genre
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs
  @@all=[]

    def initialize(name)
      @name=name
      @songs=[]
    end

    def self.destroy_all
      @@all.clear
    end

    def self.all
      @@all
    end

    def save
      @@all << self
    end

    def self.create(name)
      genre=Genre.new(name)
      genre.save
      genre
    end

    def artists
      @artists=[]
      @songs.each do |song_i|
          @artists << song_i.artist if !@artists.include?(song_i.artist)
      end
      @artists
    end


end
