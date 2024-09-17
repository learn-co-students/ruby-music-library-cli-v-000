class Genre

  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @songs = []
    @name = name
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = Array.new
  end

  def save
    @@all << self
    self
  end

  def self.create(name)
    Genre.new(name).save
  end

  def add_song(song)
    @songs << song if !@songs.include?(song)
    song.genre = self if song.genre == nil
  end

  def artists
    artists = []
    self.songs.each {|song| artists << song.artist}
    artists.uniq
  end

  def self.list_genres
    @@all.sort_by!{|genre| genre.name}
    i = 1
    @@all.each do |genre|
      puts("#{i}. #{genre.name}")
      i+=1
    end
  end

  def list_songs
    @songs.sort_by!{|song| song.name}
    i = 1
    @songs.each do |song|
      puts("#{i}. #{song.artist.name} - #{song.name}")
      i+=1
    end
  end

end
