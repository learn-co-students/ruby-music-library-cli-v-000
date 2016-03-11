class MusicLibraryController
  attr_accessor :path

  def initialize(path='./db/mp3s')
    MusicImporter.new(path).import
  end

  def call

    puts "Welcome to your friendly Music Library Controller"
    exit = false
    while exit == false
      puts "\nPlease enter a command from the following list:"
      puts "list songs"
      puts "list artists"
      puts "list genres"
      puts "play song"
      puts "list artist"
      puts "exit"

      input = gets.chomp
      case input
        when "list songs"
          Song.print_all
        when "list artists"
          Artist.print_all
        when "list genres"
          Genre.print_all
        when "play song"
          puts "Please enter the number of the song you would like played:"
          input = gets.chomp
          song= Song.all[(input.to_i) -1]
          puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
        when "list artist"
          Artist.print_all
          puts "Please enter the name of artist:"
          input = gets.chomp
          Artist.find_by_name(input).songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
        when "list genre"
            Artist.print_all
            puts "Please enter the genre:"
            input = gets.chomp
            Genre.find_by_name(input).songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
          when "list artist"
            Artist.print_all
            puts "Please enter the name of artist:"
            input = gets.chomp
            Artist.find_by_name(input).songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
        when "exit"
          exit = true
        else
          puts "Incorrrect Selection.  Please enter choice"
      end
    end
  end
end
