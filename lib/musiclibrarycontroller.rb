class MusicLibraryController

  attr_accessor :path

  def initialize(path = "./db/mp3s")
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def list_songs
    Song.all.sort_by!{ |a| a.artist.name}.each_with_index do |s, index|
      puts "#{index.to_i + 1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    end
  end

  def list_artists
    Song.all.each {|a| puts "#{a.artist.name}, "}
  end

  def list_genres
    Song.all.each { |a| puts "#{a.genre.name}, "}
  end


  def play_song
    puts "What song number would you like to play?"
    Song.all.sort_by! do |a|
      a.artist.name
    end
    song_number = gets.strip.to_i - 1
    puts "Playing #{Song.all[song_number].artist.name} - #{Song.all[song_number].name} - #{Song.all[song_number].genre.name}"
 end

  def list_artists_songs
    puts "Please type the name of the artist whose songs you would like to play."
    artist = gets.chomp
    Artist.all.each do |a|
      if a.name == artist
        a.songs.collect { |s| puts "#{s.artist.name} - #{s.name} - #{s.genre.name}" }
      end
    end
  end

  def list_genres_songs
    puts "Write the name of the genre whose song you would like to play."
    genre = gets.chomp
    Genre.all.each do |a|
      if a.name == genre
        a.songs.collect { |s| puts "#{s.artist.name} - #{s.name} - #{s.genre.name}" }
      end
    end
  end

  def call
      puts "Welcome! Begin browsing this music library by songs, artists or genres."
      user_input = ""

      until user_input == "exit"
        puts "Please type a command."
        user_input = gets.chomp.downcase
        case user_input
        when "list songs"
          self.list_songs
        when "list artists"
          self.list_artists
        when "list genres"
          self.list_genres
        when "play song"
          self.play_song
        when "list artist"
          self.list_artists_songs
        when "list genre"
          self.list_genres_songs
        when "exit"
          puts "We hope you enjoyed browsing our music library. Goodbye for now!"
        else
          puts "That course of action could not be executed. Please enter a valid command."
        end
      end
    end
  end
