class MusicLibraryController
  attr_reader :sorted_list
  def initialize(path="./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"

    input = gets.chomp

    def list_songs
      sorted_list = Song.all.uniq.sort_by {|song| song.name.downcase}
      sorted_list.each_with_index {|song, i| puts "#{i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
    end

    def list_artists
      Artist.all.uniq.sort_by {|artist| artist.name.downcase}.each_with_index {|artist, i| puts "#{i + 1}. #{artist.name}"}
    end

    def list_genres
      Genre.all.uniq.sort_by {|genre| genre.name.downcase}.each_with_index {|genre, i| puts "#{i + 1}. #{genre.name}"}
    end

    def list_songs_by_artist
      puts "Please enter the name of an artist:"
      artist_name = gets.chomp
      artist = Artist.find_by_name(artist_name)
      artist.songs.sort_by {|song| song.name}.each_with_index {|song, i| puts "#{i + 1}. #{song.name} - #{song.genre.name}"} if artist
    end

    def list_songs_by_genre
      puts "Please enter the name of a genre:"
      genre_name = gets.chomp
      genre = Genre.find_by_name(genre_name)
      genre.songs.sort_by {|song| song.name}.each_with_index {|song, i| puts "#{i + 1}. #{song.artist.name} - #{song.name}"} if genre
    end

    def play_song
      puts "Which song number would you like to play?"
      number = gets.chomp
      index = number.to_i - 1
      sorted_list = Song.all.uniq.sort_by {|song| song.name.downcase}
      song = sorted_list[index]
      puts "Playing #{song.name} by #{song.artist.name}" if index.between?(0, sorted_list.length - 1)
    end

    case input
    when "list songs" then list_songs
    when "list artists" then list_artists
    when "list genres" then list_genres
    when "list artist" then list_songs_by_artist
    when "list genre" then list_songs_by_genre
    when "play song" then play_song
    end

    call unless input == "exit"
  end

end
