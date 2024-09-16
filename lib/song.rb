
class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) unless artist == nil
    self.genre=(genre) unless genre == nil
  end
  def self.all

    @@all

    @@all.dup.freeze

  end
  def save
    @@all << self
    self
  end
  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    self.new(name).save
  end

  def artist=(name)
    @artist = name unless @artist != nil
    name.add_song(self) unless name.songs.include?(self)
  end
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.new_from_filename(filename)
    file_artist, file_song, file_genre = filename.split(" - ")
    file_genre = file_genre.gsub(".mp3", "")
    song = self.find_or_create_by_name(file_song)
    artist = Artist.find_or_create_by_name(file_artist)
    genre = Genre.find_or_create_by_name(file_genre)
    song.artist = artist
    song.genre = genre
    song
  end
  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end

  def self.find_by_name(name)
    @@all.each do |song|
      if song.name == name
        return song
      end
    end
    false
  end
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create(name)
    end
  end

  def self.get_song_by_name(artist_name)
    song_list = []
    i = 0
    @@all.collect do |instance|
      if instance.artist.name == artist_name
        song_list[i] = "#{instance.name} - #{instance.genre.name}"
        i += 1
      end
    end
    song_list
  end

  def self.get_song_by_genre(genre_name)
    genre_list = []
    song_name = []
    ordered_list = []
    i = 0
    x = 0
    @@all.collect do |instance|
      if instance.genre.name == genre_name
        genre_list[i] = "#{instance.artist.name} - #{instance.name}"
        song_name[i] = instance.name
        i += 1
      end
    end

    song_name.each do |name|
      genre_list.each do |list|
        if list.include? "#{name}"
          ordered_list[x] = list
          x += 1
        end
      end
    end
    ordered_list
  end

end
