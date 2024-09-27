class MusicLibraryController
  attr_accessor :input
  attr_reader :options

  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    @input = nil
    @options = ["list songs", "list artists", "list genres", "play song", "play song by name", "list artist", "list genre", "menu options"]

    puts "Welcome to Your Music Library! What would you like to do?"
    puts "Your options are:"
    menu_options
    puts "and exit."

    until self.input == "exit"
      self.input = gets.strip

      if correct_option? == true

        case self.input
          when "list songs"
            list_songs
          when "list artists"
            list_artists
          when "list genres"
            list_genres
          when "play song"
            play_song
          when "play song by name"
            play_song_by_name
          when "list artist"
            list_artist_songs
          when "list genre"
            list_genre_songs
          when "menu options"
            menu_options
            puts "and exit."
          end

      elsif correct_option? == false
        puts "Sorry, your selected option is invalid. Please enter another option:"
      end
    end
    puts "Thank you for using Your Music Library. Goodbye!"
  end

  def menu_options
    self.options.each do |o|
      print "#{o}, "
    end
  end

  def correct_option?
    true if self.options.detect {|o| o == self.input} != nil
  end

  def list_songs
    Song.all.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.each {|artist| puts "#{artist.name}"}
  end

  def list_genres
    Genre.all.each {|genre| puts "#{genre.name}"}
  end

  def play_song
    puts "Which song number would you like to play?"
    song_number = gets.strip.to_i
    song = Song.all[song_number - 1]
    puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end

  def play_song_by_name
    puts "What is the name of the song you'd like to play?"
    song_choice = Song.find_by_name(gets.strip)
    puts "Playing #{song_choice.artist.name} - #{song_choice.name} - #{song_choice.genre.name}"
  end

  def list_artist_songs
    puts "Which artist's songs would you like to see?"
    artist_choice =  Artist.find_by_name(gets.strip)
    artist_choice.songs.each do |song|
      puts "#{artist_choice.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_genre_songs
    puts "Which genre's songs would you like to see?"
    genre_choice = Genre.find_by_name(gets.strip)
    genre_choice.songs.each do |song|
      puts "#{song.artist.name} - #{song.name} - #{genre_choice.name}"
    end
  end

end