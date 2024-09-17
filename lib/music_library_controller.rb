require "pry"

class MusicLibraryController
attr_reader :path

  def initialize(path='./db/mp3s')
    @path = path
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def call
    user_input = nil
      while user_input != "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      user_input = gets

      case user_input
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
    num = 1
    sorted = Song.all.sort {|song_a, song_b| song_a.name <=> song_b.name}.uniq
    sorted.each {|song|
      puts "#{num}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      num += 1
    }
  end

  def list_artists
    num = 1
    sorted = Artist.all.sort {|artist_a, artist_b| artist_a.name <=> artist_b.name}.uniq
    sorted.each {|artist|
      puts "#{num}. #{artist.name}"
      num += 1
    }
  end

  def list_genres
    num = 1
    sorted = Genre.all.sort {|genre_a, genre_b| genre_a.name <=> genre_b.name}.uniq
    sorted.each {|genre|
      puts "#{num}. #{genre.name}"
      num += 1
    }
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
      artist_name = gets.chomp
      if artist = Artist.find_by_name(artist_name)
      num = 1
      sorted_songs = artist.songs.sort {|a,b| a.name <=> b.name}
      sorted_songs.each {|song|
        puts "#{num}. #{song.name} - #{song.genre.name}"
        num += 1
      }
    end
  end

  def list_songs_by_genre
      puts "Please enter the name of a genre:"
      genre_name = gets.chomp
      if Genre.find_by_name(genre_name) != nil
        genre = Genre.find_by_name(genre_name)
        num = 1
        sorted_genre = genre.songs.sort {|a,b| a.name <=> b.name}
        sorted_genre.each {|song|
          puts "#{num}. #{song.artist.name} - #{song.name}"
          num += 1
          }
      end
  end

  def play_song
    puts "Which song number would you like to play?"
    song_choice = gets.chomp.to_i
    song = nil
    if (1..Song.all.length).include?(song_choice)
      song = Song.all.sort{ |a, b| a.name <=> b.name }.uniq[song_choice - 1]
    end

    if song != nil
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  #  if song_choice <= @playlist.count && song_choice > 0
  #    binding.pry
  #    puts "Playing #{@playlist[song_choice -1].name} by #{@playlist[song_choice -1].artist.name}"
  #  else

  #  end

    #song_choice = gets.chomp #a stringed number
    #int_choice = Integer(song_choice)
    #if int_choice > 0 && int_choice <= playlist.count
    #  song = playlist[int_choice -1]
    #  puts "Playing #{song.name} by #{song.artist.name}"
    #end



    #split_playlist = playlist.collect {|song| song.split(".")}
    #if split_playlist.detect{|song| song[0] == song_choice} != nil
    #  song = split_playlist.detect{|song| song[0] == song_choice}
    #  song_cut = song[1].split(" - ")
    #  puts "Playing #{song[1]} by #{song_cut[0]}"
    #end
  end

end
