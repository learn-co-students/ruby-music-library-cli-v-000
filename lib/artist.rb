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

  def self.list_all
    self.all.each_with_index do |artist, i|
      puts "#{artist.name}"
    end
    return nil
  end

  def self.list_artist(my_artist)
    the_one = Artist.find_by_name(my_artist)
    the_one.songs.each do |song|
      puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
    return nil
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(name)
    new_artist = Artist.new(name)
    new_artist.save
    return new_artist
  end

  def songs
    @songs
  end

  def genres
    @songs.collect{|song| song.genre }.uniq
  end

  def add_song(song)
    if song.artist != self
      song.artist = self
    end
    if !@songs.include?(song)
      self.songs.push(song)
    end
  end

  def save
    @@all.push(self)
  end
end
