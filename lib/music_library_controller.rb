class MusicLibraryController

  def initialize(path = "./db/mp3s")
    hold = MusicImporter.new(path)
    hold.import
  end

  def call
    input = ""

    # Sorts all songs by artist's name, then by song's name
    Song.all.sort_by!{|song| [song.artist.name, song.name]}

    while input != "exit"
      puts "Welcome to you music library!"
      puts "What would you like to do? (list songs/ list artists/ list genres/ exit)"
      input = gets.strip

      #Options based on input
      case input
        when "list songs"
          list_songs
        when "list artists"
          list_artists
        when "list genres"
          list_genres
        when "play song"
          play_song
        when "list artist"
          list_artist
        when "list genre"
          list_genre
        when "exit"
          break
      end
    end

  end

# My list_songs method
  def list_songs
    puts "Here are the songs in your music library:"
    Song.all.each.with_index(1){|song, index|
      puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      }
  end

    def list_artists
    puts "Here are the Artists in your music library:"
    Artist.all.each.with_index(1){|artist, index|
      puts "#{index}. #{artist.name}"
      }
  end

  def list_genres
    puts "Here are the Artists in your music library:"
    Genre.all.each.with_index(1){|genre, index|
      puts "#{index}. #{genre.name}"
      }
  end


  def play_song
    puts "What song number would you like to play?"
    song_input = gets.strip
    puts "Playing #{Song.all[song_input.to_i-1].artist.name} - #{Song.all[song_input.to_i-1].name} - #{Song.all[song_input.to_i-1].genre.name}"
  end

  def list_artist
    puts "What Artist would you like to play?"
    artist_input = gets.strip
      if Artist.find_by_name(artist_input)
        Artist.find_by_name(artist_input).songs.each.with_index(1) do |song, index|
          puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      else
        puts "The Artist you entered is not in your library"
      end
  end


  def list_genre
    puts "What Genre would you like to play?"
    genre_input = gets.strip
    if Genre.find_by_name(genre_input)
      Genre.find_by_name(genre_input).songs.each.with_index(1) do |song, index|
          puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      else
      puts "The Genre you entered is not in your library"
      end
  end


end