class Song
  extend Concerns::Creatable
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist unless artist == nil
    self.genre = genre unless genre == nil
  end

  def name=(name)
    @name = name
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



  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    self.genre.songs << self unless genre.songs.include?(self)
  end

  def self.find_by_name(name)
    @@all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(name)
    summary = name.split(' - ')
    summary[2].slice!('.mp3')
    self.new(summary[1], Artist.find_or_create_by_name(summary[0]), Genre.find_or_create_by_name(summary[2]))
  end

  def self.create_from_filename(name)
    summary = self.new_from_filename(name)
    summary.save
    summary
  end
end
