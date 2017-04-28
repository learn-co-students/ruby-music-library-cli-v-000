class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name,artist=nil,genre=nil)
    Song.new(name,artist,genre).tap do |new_song|
      new_song.save
    end
  end

  def self.new_from_filename(filename)
    data = filename.split("-").collect{|text| text.strip}

    if found = Song.find_by_name(data[1])
      found
    else
      artist = Artist.find_or_create_by_name(data[0])
      genre = Genre.find_or_create_by_name(data[2].gsub(".mp3",""))

      self.new(data[1],artist,genre)
    end
  end

  def self.create_from_filename(filename)
    data = filename.split(" - ").collect{|text| text.strip}

    if found = Song.find_by_name(data[1])
      found
    else
      artist = Artist.find_or_create_by_name(data[0])
      genre = Genre.find_or_create_by_name(data[2].gsub(".mp3",""))

      self.create(data[1],artist,genre)
    end
  end

  def self.list_songs
    self.all.each_with_index do |song,index|
      output = "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      puts output
    end
  end

  def initialize(name,artist=nil,genre=nil)
    self.name = name
    self.artist = artist unless artist==nil
    self.genre = genre unless genre==nil
  end

  def save
    @@all << self
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def print_song
    output = "#{self.artist.name} - #{self.name} - #{self.genre.name}"
  end

end
