class Artist
  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    new(name).tap { |artist| artist.save }
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def self.print_artists
    all.collect { |a| puts a.name }
  end

  def self.print_artist_songs(artist)
    find_by_name(artist).songs.each { |s| puts "#{s.artist.name} - #{s.name} - #{s.genre.name}" }
  end

  def save
    @@all << self
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist
  end

  def genres
    @songs.collect { |song| song.genre }.uniq
  end
end
