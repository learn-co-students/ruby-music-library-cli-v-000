require 'pry'

class Song
  attr_accessor :artist, :name, :genre, :songs, :title
  extend Concerns::Findable

    @@all = []
    @@count = 0

    def initialize(name, artist=nil, genre=nil)
      @name = name
      self.artist = artist if artist
      self.genre = genre if genre
    end

    def self.all
      @@all
    end

    def self.destroy_all
      @@all.clear
    end

    def save
      @@all << self
      self
    end

    def self.create(name)
      song = self.new(name)
      song.save
      song
    end

    def artist=(artist)
      @artist = artist
      artist.add_song(self)
    end

    def genre=(genre)
      @genre = genre
      genre.songs << self unless genre.songs.include?(self)
    end

    # def self.count
    #   @@count
    # end
    #
    # def self.genres
    #   @@genres.uniq!
    # end
    #
    # def self.genre_count
    #   all_genres = {}
    #   @@genres.each do |genre|
    #     all_genres[genre] ? all_genres[genre] += 1 : all_genres[genre] = 1
    #   end
    #   all_genres
    # end


    # def artist_name=(name)
    #   self.artist = Artist.find_or_create_by_name(name)
    # end
    #
    # def self.new_by_filename(filename)
    #   song_name = filename.split(" - ")[1]
    #   song_artist = filename.split(" - ")[0]
    #
    #   song = Song.new(song_name)
    #   song.artist_name=(song_artist)
    #   song.save
    # end
    #
    # def self.new_by_name(name)
    #   song = self.new
    #   song.name = name
    #   song
    # end
    #
    # def self.create_by_name(name)
    #   song = self.create
    #   song.name = name
    #   song
    # end
    # #the .create method saves the song to the @@all array
    #
    # def self.find_by_name(name)
    #   @@all.detect{|song| song.name == name}
    # end
    #
    # def self.find_or_create_by_name(name)
    #   self.find_by_name(name) || self.create_by_name(name)
    # end
    #
    # def self.alphabetical
    #   @@all.sort_by { |word| word.name }
    # end
    #
    def self.new_from_filename(filename)
      new_song = filename.split("-") #splits the string at the hyphen
      name = new_song[1].strip #returns the second element in the array at index 1 = song title
      song = Song.new(name) #new instance of a song with ne song title as name
      song.artist = Artist.find_or_create_by_name(new_song[0].strip) #pushes artist to new instnace of and Artist in new instance of Song
      song.genre = Genre.find_or_create_by_name(new_song[2].split(".")[0].strip) #splits element at period, returns first element at index 0
      song #returns new song
    end

    #
    # def self.create_from_filename(filename)
    #   song = Song.new
    #   new_song = filename.split("-")
    #   song.artist_name = new_song[0].strip
    #   song.name = new_song[1].split(".")[0].strip
    #   song.save
    # end





    # @@count = 0
    # @@genres = []
    # @@artists = []

    # def initialize(name, artist, genre)
    #   @name = name
    #   @artist =  artist
    #   @genre = genre
    #   @@count += 1
    #   @@genres << @genre
    #   @@artists << @artist
    # end
    #
    # def self.count
    #   @@count
    # end
    #
    # def self.artists
    #   @@artists.uniq!
    # end
    #
    # def self.genres
    #   @@genres.uniq!
    # end
    #
    # def self.genre_count
    #   all_genres = {}
    #   @@genres.each do |genre|
    #     all_genres[genre] ? all_genres[genre] += 1 : all_genres[genre] = 1
    #   end
    #   all_genres
    # end
    #
    # def self.artist_count
    #   all_artists = {}
    #   @@artists.each do |artist|
    #     all_artists[artist] ? all_artists[artist] += 1 : all_artists[artist] = 1
    #   end
    #   all_artists
    # end

    # class Song
    #   extend Memorable::ClassMethods
    #   extend Findable::ClassMethods
    #   include Memorable::InstanceMethods
    #   include Paramable::InstanceMethods
    #   attr_accessor :name
    #   attr_reader :artist
    #
    #   @@songs = []
    #
    #   # def initialize
    #   #   self.class.all << self
    #   # end
    #
    #   # def self.find_by_name(name)
    #   #   @@songs.detect{|a| a.name == name}
    #   # end
    #
    #   def artist=(artist)
    #     @artist = artist
    #   end
    #
    #   # def self.reset_all
    #   #   @@songs.clear
    #   # end
    #
    #   # def to_param
    #   #   name.downcase.gsub(' ', '-')
    #   # end
    #
    #   # def self.count
    #   #   self.all.count
    #   # end
    #
    #   def self.all
    #     @@songs
    #   end
    # end

  end
