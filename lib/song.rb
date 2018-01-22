class Song
  attr_accessor :name
  include SongArtists::InstanceMethods
  extend SongArtists::ClassMethods

  @@all = []

  def initialize(name, artist = nil, genre = nil)

    @name = name
    if genre != nil
      self.genre = genre
    end
    if artist != nil
      self.artist = artist
    end

  end

  def self.all
    @@all
  end

  def artist=(artist)
    @artist = artist
    # if Artist.all.include?(self)
    @artist.add_song(self)
    # end
  end

  def artist
    if @artist!=nil
      @artist
    else
      return nil
    end
  end

  def genre=(genre)
    @genre = genre
    if !@genre.songs.include?(self)
      @genre.songs<<self
    end
  end

  def genre
    @genre
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
    #if self.find_by_name(name) == nil
    #  new_song = self.create(name)
    #else
    #  return self.find_by_name(name)
    #end
  end

  def self.new_from_filename(file_name)
    string_array = file_name.gsub(/.mp3/, '')
    new_string = string_array.split(" - ")
    # if new_string[1] == "For Love I Come"
    #   binding.pry
    # end
    new_song = Song.find_or_create_by_name(new_string[1])
    new_song.artist = Artist.find_or_create_by_name(new_string[0])
    new_song.genre = Genre.find_or_create_by_name(new_string[2])
    new_song.save
    new_song
  end

  def self.create_from_filename(file_name)
    self.new_from_filename(file_name)
  end

  def save
    Song.all << self
  end

end
