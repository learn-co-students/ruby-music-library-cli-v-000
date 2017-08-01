require 'pry'
class Song
  extend Concerns::Findable
  attr_accessor :name, :genre, :artist

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.all #class reader
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name, artist = nil, genre = nil)
    new(name, artist, genre).tap{|s| s.save}
  end

   def artist=(artist)
     #artist= instead of simply assigning to an @artist instance variable
     #to ensure that associations are created upon initialization
     @artist = artist
     artist.add_song(self)
  end

    def genre=(genre)
      @genre = genre
      genre.add_song(self)
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
