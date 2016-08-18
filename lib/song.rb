require 'pry'
class Song
  extend Concerns::Findable

  attr_accessor :name, :artist, :genre

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all # Song.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    Song.new(name).tap {|song| song.save}
  end

  def songs
    @song
  end



    def artist=(artist)
      @artist = artist
      artist.add_song(self)
    end

      def genre=(genre)
        @genre = genre
        genre.songs << self unless genre.songs.include?(self)
      end

  def self.new_from_filename(filename)
     parts = filename.split(" - ")
     song = Song.new(parts[1])
     song.artist = Artist.find_or_create_by_name(parts[0])
     song.genre = Genre.find_or_create_by_name(parts[2].gsub(".mp3", ""))
     song
   end

   def self.create_from_filename(filename)
     song = self.new_from_filename(filename)
     song.save
     song
   end









    end
