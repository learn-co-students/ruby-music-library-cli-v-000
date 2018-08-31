require "pry"
class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre
  @@all=[]

    def initialize(name, artist=nil, genre=nil)
      @name=name
      self.artist=(artist) if artist !=nil
      self.genre=(genre) if genre !=nil
    end

    def self.destroy_all
      @@all.clear
    end

    def self.all
      @@all
    end

    def save
      @@all << self
    end

    def self.create(name)
      song=Song.new(name)
      song.save
      song
    end
    # binding.pry

    def artist=(artist) #artist argument is the instance
      @artist=artist
      artist.add_song(self)


      # binding.pry
    end

    def genre=(genre)
      @genre=genre
      genre_i = Genre.all.detect{|genre_i| genre_i==genre}
      if genre_i == nil
        new_genre_i = genre
        new_genre_i.songs << self if !new_genre_i.songs.include?(self)
        Genre.all << new_genre_i
        # binding.pry
      else
        genre_i.songs << self if !genre_i.songs.include?(self)
      end
    end


    def self.new_from_filename(path)
      song_name=path.split(" - ")[1].strip
      artist_name=path.split(" - ")[0].strip
      genre_name=path.split(" - ")[2].split(".")[0].strip
      artist_i=Artist.find_or_create_by_name(artist_name)
      genre_i=Genre.find_or_create_by_name(genre_name)
      song=find_or_create_by_name(song_name)
      song.artist=artist_i
      song.genre=genre_i
      song
    end

    def self.create_from_filename(path)
      new_from_filename(path)
    end


end
