require 'pry'
class Song
  attr_accessor :name, :genre, :artist
  @@all = []
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist= (artist) if artist != nil
    self.genre= (genre) if artist != nil
  end

  def self.all #class reader
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(song)
    songs = new(song)
    songs.save
    songs
  end

   def artist=(artist_name)
     #artist= instead of simply assigning to an @artist instance variable
     #to ensure that associations are created upon initialization
     artist_name.add_song(self) unless artist_name.songs.include?(self)
    @artist = artist_name
  end

    def genre=(genre)
      genre.songs << self unless genre.songs.include?(self)
      @genre = genre
    end

    def self.new_from_filename(file_name)
      file_array = file_name.chomp('.mp3').split(' - ')
      song = self.new(file_array[1],Artist.find_or_create_by_name(file_array[0]),Genre.find_or_create_by_name(file_array[2]))
    end

    def self.create_from_filename(file_names)
      @@all << new_from_filename(file_names)
    end

    # def self.find_by_name(name)
    #   all.detect do |song|
    #     song.name == name
    #   end
    # end
    #
    # def self.find_or_create_by_name(name)
    # if self.find_by_name(name) == nil
    #     self.create(name)
    #   else
    #     self.find_by_name(name)
    #   end
    # end

end
