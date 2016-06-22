class Song

  extend Concerns::Findable

  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist unless artist == nil
    self.genre = genre unless genre == nil
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def save
    @@all << self
  end

  def self.create(name, artist=nil, genre=nil)
    new(name, artist, genre).tap {|x| x.save}
  end

  def self.find_by_name(name)
    @@all.each{|song| return song if song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) != nil
      self.find_by_name(name)
    else
      self.create(name, artist, genre)
    end
  end

  def self.new_from_filename(filename)
    terms = filename.split(" - ")
    artist_name = terms[0]
    name = terms[1]       
    genre_label = terms[2].gsub(".mp3", "")
    genre = Genre.find_or_create_by_name(genre_label)
    artist = Artist.find_or_create_by_name(artist_name)
    self.create(name, artist, genre)  
  end

end