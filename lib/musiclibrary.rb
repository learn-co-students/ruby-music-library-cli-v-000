require 'pry'


class MusicLibraryController

  extend Concerns::Findable

  def initialize(path = "./db/mp3s")
    new_import_music= MusicImporter.new(path)
    new_import_music.import
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
    Song.all.sort_by {|song| song.name}
      .each.with_index(1) do |song,i|   puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
  end

  def list_artists
    Artist.all.sort_by {|artist| artist.name}
      .each.with_index(1) do |artist,i| puts "#{i}. #{artist.name}"
      end
  end

  def list_genres
    Genre.all.sort_by {|genre| genre.name}
      .each.with_index(1) do |genre,i| puts "#{i}. #{genre.name}"
      end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    if artist = Artist.find_by_name(input)
      songs_by_artist = artist.songs.sort_by {|song| song.name}
        .each.with_index(1) do |song,i| puts "#{i}. #{song.name} - #{song.genre.name}"
        end
    end
  end

    def list_songs_by_genre
      puts "Please enter the name of a genre:"
      input = gets.chomp
      if genre = Genre.find_by_name(input)
        songs_by_genre = genre.songs.sort_by {|song| song.name}
          .each.with_index(1) do |song,i| puts "#{i}. #{song.artist.name} - #{song.name}"
          end
      end
    end

    def play_song
      puts "Which song number would you like to play?"
      input = gets.to_i
      sortedSongs = Song.all.sort_by {|song| song.name}
      if input > 0 && input <= sortedSongs.length
        song = sortedSongs[input-1]
        puts "Playing #{song.name} by #{song.artist.name}"
      end
    end
end
