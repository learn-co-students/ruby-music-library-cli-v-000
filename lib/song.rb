# require 'nokogiri'
# require 'open-uri'
# require 'pry'

# #require_relative './ .rb'

class Song
  extend Concerns::Findable

  attr_accessor :name, :artist, :genre #, :genres
  @@all = []

    def initialize(name, artist = nil, genre = nil)
       @name = name
       self.artist = artist if artist  #Songs and Artists initializing a song with an artist new songs accept an optional argument for the artist
       self.genre = genre if genre
        #artist.song = self
        #@@all << self
    end

    def artist=(artist)  #assigns songs to artist
#       artist=(artist=nil)
      @artist = artist
      artist.add_song(self)
    end

#     def genre=(genre)
#       @genre = genre
#       genre.songs = self unless genre.songs.include?(self)
#     end


#     def genres
#       self.songs.collect do |song|
#         song.genre
#       end
#     end

#     def genre
#       @genre
#     end
#     def genre=(genre)
#        @genre = genre
#     end

#     def genre=(genre)
#       @genre = genre
#       #self.genre = genre if genre
#      # genre.add_genre(song)
#      # @@all << self unless @all.include?(self)
#     end


    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def new_from_filename(filename)
    end


    def self.create(name, artist = nil, genre = nil)
        new(name, artist = nil, genre = nil).tap {|song| song.save}
       # @name =name
#         song.name = name
# self.all << song
#         return song
    end

    def self.destroy_all
        @@all = []
    end
end
