class MusicLibraryController
  attr_accessor :path

  # class methods

  def initialize(path = './db/mp3s')
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    loop do
      user_input = ""

      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      user_input = gets.chomp


    case user_input

    when 'list songs'
      list_songs
    when 'list artists'
      list_artists
    when 'list genre'
      list_genres
    when 'play song'
      play_song
    end

    break if user_input == 'exit'
  end
end



# CLI Methods

    def list_songs
      sorted_songs = Song.all.sort {|a, b| a.name <=> b.name}
      sorted_songs.each_with_index do |value, index|
        puts "#{index+1}. #{value.artist.name} - #{value.name} - #{value.genre.name}"
      end
    end

    def list_artists
      sorted_artists = Artist.all.sort {|c, d| c.name <=> d.name}
      sorted_artists.each_with_index do |value, index|
        puts "#{index+1}. #{value.name}"
      end
    end

    def list_genres
      sorted_genres = Genre.all.sort {|e, f| e.name <=> f.name}
      sorted_genres.each_with_index do |value, index|
        puts "#{index+1}. #{value.name}"
      end
    end

    def list_songs_by_artist
      puts "Please enter the name of an artist:"
      artist = gets.chomp
      artist = Artist.find_by_name(artist)
      if artist
        sorted_songs = artist.songs.sort {|a, b| a.name <=> b.name}
        sorted_songs.each_with_index do |value, index|
          puts "#{index+1}. #{value.name} - #{value.genre.name}"
        end
      end
    end

    def list_songs_by_genre
      puts "Please enter the name of a genre:"
      genre = gets.chomp
      genre = Genre.find_by_name(genre)
      if genre
        sorted_songs = genre.songs.sort {|c, d| c.name <=> d.name}
        sorted_songs.each_with_index do |value, index|
          puts "#{index+1}. #{value.artist.name} - #{value.name}"
        end
      end
    end

    def play_song
      puts "Which song number would you like to play?"
      user_input = gets.chomp.to_i
      songs = Song.all.uniq.sort! {|a, b| a.name <=> b.name}
      if (1..songs.length).include?(user_input)
        puts "Playing #{songs[user_input-1].name} by #{songs[user_input-1].artist.name}"
      end
    end
end
