class MusicLibraryController

  def initialize(path = './db/mp3s')
    music_importer = MusicImporter.new(path)
    music_importer.import
end

  def call
    input = nil
    until input == "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of your artists in your library, enter 'list artists'."
      puts "To list all of your genre in your library, enter ' list genres'."
      puts "To list all of your songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"

      input = gets.strip
      list_songs if input == "list songs"
      list_artists if input == "list artists"
      list_genres if input == "list genres"
      list_songs_by_artist if input == "list artist"
      list_songs_by_genre if input == "list genre"
      play_song if input == "play song"
end
end

def list_songs
  alphabetized_list = Song.all.sort{|a,b| a.name <=> b.name}.each_with_index{|file,index| puts "#{index +1}. #{file.artist.name} - #{file.name} - #{file.genre.name}"}
end

def list_artists
  Artist.all.sort{|a,b| a.name <=> b.name}.each_with_index{|artist, index| puts "#{index +1}. #{artist.name}"}
  end

  def list_genres
    Genre.all.sort{|a,b| a.name <=> b.name}.each_with_index{|genre, index| puts "#{index +1}. #{genre.name}"}
    end

    def list_songs_by_artist
      puts "Please enter the name of an artist:"
      artist_name = gets.strip
      if artist = Artist.find_by_name(artist_name)
        artist.songs.sort{|a,b| a.name <=> b.name}.each_with_index{|song, index| puts "#{index +1}. #{song.name} - #{song.genre.name}"}
  end

    def list_songs_by_genre
      puts "Please enter the name of a genre:"
      genre_name = gets.strip
      if genre = Genre.find_by_name(genre_name)
        genre.songs.sort{|a,b| a.name <=> b.name}.each.with_index{|song, index| puts "#{index +1}. #{song.artist.name} - #{song.name}"}
end
end
end
end
