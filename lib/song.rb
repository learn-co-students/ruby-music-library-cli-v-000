
class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre

    @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name

    self.genre = genre if !genre.nil?
    self.artist = artist if !artist.nil? # <-- if there is an artist then create a class and add the artist
  end

  def self.all
    @@all
  end

  def self.destroy_all
    Song.all.clear
  end

  def self.create(name)
    name = self.new(name)
    name.save
    name
  end

  def self.find_by_name(name)
    Song.all.select{|song| return song if song.name == name}
  end

  def self.find_or_create_by_name(name)
    if Song.find_by_name(name)
      Song.find_by_name(name)
    else
      Song.create(name)
    end
  end

  def self.new_from_filename(filename)
    parsed_file = filename.split(' - ')
    artist = Artist.find_or_create_by_name(parsed_file[0])
    name = parsed_file[1]
    genre = Genre.find_or_create_by_name(parsed_file[2].gsub('.mp3', ''))
    new(name, artist, genre)
  end

  def self.create_from_filename(name)
    new_from_filename(name).tap do |f|
      f.save
    end
  end

  def save
    Song.all << self
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if !genre.songs.include?(self)
      genre.songs << self
    end
  end

end
