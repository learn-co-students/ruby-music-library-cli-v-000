class MusicLibraryController

  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
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
    case input
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "list artist"
        list_songs_by_artist
      when "list genre"
        list_songs_by_genre
      when "play song"
        play_song
      end
    end
  end

  def list_songs
    Song.all.sort_by{|song| song.name}.each_with_index do |song, num|
       puts "#{num + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
  end

  def list_artists
    Artist.all.sort_by{|item| item.name}.each_with_index do |item, num|
        puts "#{num +1}. #{item.name}"
      end
    end

  def list_genres
    Genre.all.sort_by{|g| g.name}.each_with_index do |item, num|
      puts "#{num +1}. #{item.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"

    artist_name = gets.strip

    if   artist = Artist.find_by_name(artist_name)
        sorted_songs = artist.songs.sort_by{|s| s.name}
        sorted_songs.each_with_index do |s, num|
    puts "#{num + 1}. #{s.name} - #{s.genre.name}"
         end
       end
     end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets.strip

    if genre = Genre.find_by_name(genre_name)
        sorted_genres = genre.songs.sort_by{|g| g.name}
          sorted_genres.each_with_index do |g, num|
            puts "#{num + 1}. #{g.artist.name} - #{g.name}"
          end
        end

  def play_song
    puts "Which song number would you like to play?"
    song_number = gets.strip.to_i
       if (1..Song.all.length).include?(song_number)
         song = Song.all.sort{|a, b| a.name <=> b.name}[song_number - 1]
       end
         puts "Playing #{song.name} by #{song.artist.name}" if song
       end
  end

end
