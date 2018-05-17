require 'bundler'
require 'pry'
Bundler.require
require_all 'lib'

class Genre
  extend Concerns::Findable
  extend Concerns::ClassMethods
  include Concerns::InstanceMethods
  
  attr_accessor :name, :song, :artist
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = [] 
  end 
  
  def self.all 
    @@all 
  end 
  
  def artists
    artists = []
  @songs.each {|song| artists << song.artist if !artists.include?(song.artist)}
  artists
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


# AHEAD
#    rspec spec/009_music_importer_spec.rb
#    rspec spec/010_music_library_controller_spec.rb
#    rspec spec/011_music_library_cli_methods_spec.rb
#    rspec spec/011_music_library_cli_spec.rb


