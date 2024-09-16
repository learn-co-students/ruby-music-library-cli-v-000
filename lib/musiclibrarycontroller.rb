class MusicLibraryController

  attr_accessor :path

  def initialize(path='./db/mp3s')
    MusicImporter.new(path).import
  end

  def call
    input = ""
    while input != "exit"
      input = gets.strip
      puts "\nPlease enter a command from the following list:"
      puts "list songs"
      puts "list artists"
      puts "list genres"
      puts "play song"
      puts "list genre"
      puts "list artist"
      puts "exit"

      case input
        when "list songs"
          Song.print_all
        when "list artists"
          Artist.print_all
        when "list genres"
          Genre.print_all
        when "play song"
          puts "please enter the song number you wish to play:"
            requested_song = gets.strip.to_i - 1
            song = Song.all[requested_song]
            puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
          when "list genre"
              puts "Please enter genre:"
              requested_genre = gets.strip
              Genre.find_by_name(requested_genre).songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
              puts "test"
        when "list artist"
            puts "Please enter the name of artist:"
            requested_artist = gets.strip
            Artist.find_by_name(requested_artist).songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}

        else
          puts "Incorrect. Please type a valid choice."
        end

      end
  end



end
