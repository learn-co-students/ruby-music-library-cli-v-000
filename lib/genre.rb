class Genre
  attr_accessor :name, :songs
  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []

  end

  def self.all 
    @@all 
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    Genre.all << self
  end 

  def self.create(name)
    new_genre = self.new(name)
    new_genre.save
    new_genre
  end

  def add_song(song)
    self.songs << song
    song.genre = self if song.genre != self
    @songs = @songs.uniq
  end

  def artists
    @songs.collect {|song| song.artist}.uniq
  end

  def print
    puts self.name
  end

  def self.print_all
     self.all.each do |genre| 
       genre.print
     end
  end



end 