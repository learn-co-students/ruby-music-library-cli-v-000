require 'pry'

class Song

  extend Concerns::Findable

#  attr_accessor :name, :artist
  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  # def self.find_by_name(name)
  #   @@all.find {|song| name == song.name}
  # end
  #
  # def self.find_or_create_by_name(name)
  #   if self.find_by_name(name) == nil
  #     self.create(name)
  #   else
  #     self.find_by_name(name)
  #   end
  # end

  def self.new_from_filename(name)
    if self.find_by_name(name) == nil
      array = name.split(" -")
      person = array[0]
      title = array[1]
      musicprototype = array[2].split(".mp3")
      music = musicprototype[0]
      artist = Artist.find_or_create_by_name(person)
      genre = Genre.find_or_create_by_name(music.lstrip)
      song = Song.new(title.lstrip, artist, genre)
    else
    end
  end


  def self.create_from_filename(name)
    self.new_from_filename(name).save
  end

  def initialize(name, artist = nil, genre = nil)
      @name = name
      if artist != nil
        self.artist=(artist)
      else
        @artist = artist
      end
      if genre != nil
        self.genre=(genre)
      else
        @genre = genre
      end
  end

  def name
    @name
  end

  def name=(name)
    @name = name
  end

  def artist
    @artist
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre
    @genre
  end

  def genre=(genre)
    @genre = genre
    if !genre.songs.find {|song| song.name == self.name}
      genre.songs << self
    end
  end

  def save
    @@all << self
  end

  def import

  end

end
