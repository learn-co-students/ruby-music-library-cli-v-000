# Read, big picture
# Create list of test file names to run


rspec spec/001_song_basics_spec.rb

rspec spec/002_artist_basics_spec.rb

rspec spec/003_genre_basics_spec.rb

rspec spec/004_songs_and_artists_spec.rb		

rspec spec/005_songs_and_genres_spec.rb	

rspec spec/006_artists_and_genres_spec.rb

rspec spec/007_findable_songs_spec.rb		

rspec spec/008_findable_module_spec.rb

rspec spec/009_music_importer_spec.rb

rspec spec/010_music_library_controller_spec.rb

rspec spec/011_music_library_cli_methods_spec.rb

rspec spec/012_music_library_cli_spec.rb

 
#################################

  def self.new_from_filename(file)
    artist_name, song_name = file.split(" - ")
    genre_name = (file.split.last).gsub!(".mp3","")
    artist_name = find_or_create_name(artist_name)
    genre_name = find_or_create_name(genre_name)
    
    self.create(song_name)
  end
#################################
  def self.create_from_filename(filename)
    artist, name, genre = file.split(" - ").gsub!(".mp3","")
    artist = Artist.find_or_create_name(artist_name)
    genre = Genre.find_or_create_name(genre_name)
    name = Song.new(name, artist, genre)
    binding.pry
  end
  
#################################