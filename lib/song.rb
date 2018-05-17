require 'bundler'
require 'pry'
Bundler.require
require_all 'lib'

class Song 
  extend Concerns::Findable
  extend Concerns::ClassMethods
  include Concerns::InstanceMethods
  
  attr_accessor :name, :artist, :genre
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    super 
    if artist != nil
      self.artist=(artist)
    end
    if genre != nil
      self.genre=(genre)
    end
  end
  
  def self.all 
    @@all 
  end 
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.songs << self if !genre.songs.include?(self)
  end
  
  def genre 
    @genre 
  end
  
  def self.new_from_filename(file)
    a = file.split(" - ")[0]
    s = file.split(" - ")[1]
    g = file.split(" - ")[2].chomp(".mp3")
    
    artist = Artist.find_or_create_by_name(a)
    genre = Genre.find_or_create_by_name(g)
    song = Song.find_or_create_by_name(s)
    song.artist = artist
    song.genre = grene
    
    
    binding.pry
  end 
  
end

# learn --fail-fast

# PASSING
#    rspec spec/001_song_basics_spec.rb
#    rspec spec/002_artist_basics_spec.rb
#    rspec spec/003_genre_basics_spec.rb
#    rspec spec/004_songs_and_artists_spec.rb
#    rspec spec/005_songs_and_genres_spec.rb
#    rspec spec/006_artist_and_genres_spec.rb
#    rspec spec/007_findable_songs_spec.rb
#    rspec spec/008_findable_module_spec.rb

# IN PROGRESS
# 5 #    rspec spec/009_music_importer_spec.rb

# AHEAD

#    rspec spec/010_music_library_controller_spec.rb
#    rspec spec/011_music_library_cli_methods_spec.rb
#    rspec spec/011_music_library_cli_spec.rb

