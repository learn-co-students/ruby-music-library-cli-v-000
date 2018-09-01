class MusicLibraryController
  def initialize(path = "./db/mp3s")
    controller = MusicImporter.new(path)
    controller.import
  end

  def call
    input = ""
    while input != "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      input = gets.strip
        if input == "list songs"
          self.list_songs
        elsif input == "list artists"
          self.list_artists
        elsif input == "list genres"
          self.list_genres
        elsif input == "list artist"
          self.list_songs_by_artist
        elsif input == "list genre"
          self.list_songs_by_genre
        elsif input == "play song"
          self.play_song
        end
    end
  end

  def list_songs
    Song.all.sort_by {|song| song.name}.each_with_index {|a, b| puts "#{b + 1}. #{a.artist.name} - #{a.name} - #{a.genre.name}"}
  end

  def list_artists
    Artist.all.sort_by {|artist| artist.name}.each_with_index {|a, b| puts "#{b + 1}. #{a.name}"}
  end

  def list_genres
    Genre.all.sort_by {|genre| genre.name}.each_with_index {|a, b| puts "#{b + 1}. #{a.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip

    song = Song.all.select{|song| song.artist.name == input}
    song.sort_by! {|song| song.name}.each_with_index {|song, index| puts "#{index + 1}. #{song.name} - #{song.genre.name}"}
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip

    genre_songs = Song.all.select{|song| song.genre.name == input}
    genre_songs.sort_by! {|song| song.name}.each_with_index {|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name}"}
  end

  def play_song
    puts "Which song number would you like to play?"
    input = (gets.strip.to_i) - 1

    song = Song.all.sort_by{|song| song.name}
    if input > 1 && input < Song.all.count
      puts "Playing #{song[input].name} by #{song[input].artist.name}"
    end
  end
end
