class MusicLibraryController

  attr_reader :name, :song, :artist, :genre

  def initialize(path = "./db/mp3s")
    music = MusicImporter.new(path)
    music.import
  end

  def call
#* Add a `#call` method that starts the CLI and asks the user for input. Check out the tests for specifics.

  #output = []

  input = ""
    while input != "exit"
      puts "\nWelcome to Benton's Music Library\n\nlist songs | list artists | list genres\n----------------------------------------------------\nplay song | list artist (songs) | list genre (songs)\n\nType \'exit\' to quit the program.\n\nWhat would you like to do?\n\n"
      input = gets.strip
    
      case input
        when "list songs"
          i = 0
          Song.all.each do |x|
            i += 1
            puts "#{i}. #{x.artist.name} - #{x.name} - #{x.genre.name}"
          end
        when "list artists"
          Artist.all.each do |x|
            puts x.name
          end
        when "list genres"
          Genre.all.each do |x|
            puts x.name
          end
        when "play song"
          temp_song_array = []
          puts "Select a song by its number on the left below:\n"
          i = 0
          Song.all.each do |x|
            i += 1
            puts "#{i}. #{x.artist.name} - #{x.name} - #{x.genre.name}"
            temp_song_array << "#{x.artist.name} - #{x.name} - #{x.genre.name}"
          end
          selection = gets.strip
          if (1..i).cover?(selection.to_i)
            puts "Playing #{temp_song_array[selection.to_i - 1]}"
          else
            puts "Not a valid number. Try again."
          end
        when "list artist"
          puts "Which artist?"
          input = gets.strip
          if Artist.find_by_name(input)
            Song.all.each do |x|
              if x.artist.name == input
                puts "#{x.artist.name} - #{x.name} - #{x.genre.name}"
              end
            end
          else
            "Artist not found. Try again."
          end
        when "list genre"
          puts "Which genre?"
          input = gets.strip
          if Genre.find_by_name(input)
            Song.all.each do |x|
              if x.genre.name == input
                puts "#{x.artist.name} - #{x.name} - #{x.genre.name}"
              end
            end
          else
            "Genre not found. Try again."
          end
        end
    end
  end

end
