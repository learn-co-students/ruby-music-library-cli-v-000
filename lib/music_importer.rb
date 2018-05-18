class MusicImporter
  #extend Concerns::Findable
  #extend Concerns::ClassMethods
  #include Concerns::InstanceMethods
  
  attr_accessor :path, :song, :genre, :artist
  
  def initialize(path)
    @path = path
  end
  
  def files
    Dir.entries(@path).select {|f| !File.directory? f}
  end 
  
  def import 
    files.each {|file| 
      Song.create_from_filename(file)}
  end 
end


# learn --fail-fast

# PASSING
#    rspec spec/001_song_basics_spec.rb
#    rspec spec/002_artist_basics_spec.rb
#    rspec spec/003_genre_basics_spec.rb
#    rspec spec/004_songs_and_artists_spec.rb
#    rspec spec/005_songs_and_genres_spec.rb
#    rspec spec/006_artists_and_genres_spec.rb
#    rspec spec/007_findable_songs_spec.rb
#    rspec spec/008_findable_module_spec.rb

# IN PROGRESS
# 9 #    rspec spec/009_music_importer_spec.rb

# AHEAD

#    rspec spec/010_music_library_controller_spec.rb
#    rspec spec/011_music_library_cli_methods_spec.rb
#    rspec spec/011_music_library_cli_spec.rb