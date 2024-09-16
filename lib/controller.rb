class MusicLibraryController
  attr_reader :path
  def initialize(path='./db/mp3s')
    newsongs = MusicImporter.new(path)
    newsongs.import
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

    loop do
      a = gets.chomp
      break if a == 'exit'

      case a
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
      p_list = Song.all.sort_by {|s| s.name}
      c = 1
      p_list.each do |s|
        puts "#{c}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
        c +=1
      end
    end

    def list_artists
      p_list = Artist.all.sort_by {|s| s.name}
      c = 1
      p_list.each do |s|
        puts "#{c}. #{s.name}"
        c +=1
      end
    end

    def list_genres
      p_list = Genre.all.sort_by {|s| s.name}

      p_list.each_with_index do |s, i|
        puts "#{i+1}. #{s.name}"
      end
    end

    def list_songs_by_artist
      puts "Please enter the name of an artist:"
      input = gets.chomp
      artist = Artist.find_by_name(input)
      if artist
        p_list = artist.songs.sort_by {|s| s.name}
        p_list.each_with_index do |s, i|
          puts "#{i+1}. #{s.name} - #{s.genre.name}"
        end
      end
    end

    def list_songs_by_genre
      puts "Please enter the name of a genre:"
      input = gets.chomp
      genre = Genre.find_by_name(input)
      if genre
        p_list = genre.songs.sort_by {|s| s.name}
        p_list.each_with_index do |s, i|
          puts "#{i+1}. #{s.artist.name} - #{s.name}"
        end
      end
    end

    def play_song
      puts "Which song number would you like to play?"
      i = gets.chomp.to_i
      p_list = Song.all.sort_by {|s| s.name}
      if i > 0 && i <= p_list.length
        puts "Playing #{p_list[i-1].name} by #{p_list[i-1].artist.name}"
      end
    end

end
