class Song

  attr_accessor :name
  attr_reader :artist, :genre

  extend Concerns::Findable

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    if artist != nil
      self.artist = artist
    end
    if genre != nil
      self.genre = genre
    end
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    @genre.add_song(self)
  end

  def save
    @@all << self
    self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.all
    @@all
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def self.new_from_filename(filename)
    name = filename.split(" - ")[1]
    song = self.new(name)
    song.artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
    song.genre = Genre.find_or_create_by_name(filename.split(" - ")[2].sub(".mp3", ""))
    song
  end

  def self.create_from_filename(name)
    self.new_from_filename(name).save
  end

  # def self.find_by_name(song)
  #   @@all.each do |instance|
  #     if instance.name == song
  #       return instance
  #     end
  #   end
  #   nil
  # end
  #
  # def self.find_or_create_by_name(name)
  #   if self.find_by_name(name)
  #     return self.find_by_name(name)
  #   else
  #     self.create(name)
  #   end
  # end

end
