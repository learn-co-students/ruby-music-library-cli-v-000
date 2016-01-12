class MusicLibraryController

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    puts "+-------------------------------------+"
    puts "|      Your Ballin Music Library      |"
    puts "+-------------------------------------+"
    puts "Please Select One Of The Options Below:"
    puts "1. List Songs"
    puts "2. List Artists"
    puts "3. List Genres"
    puts "4. Play Song"
    puts "5. List Artist"
    puts "6. List Genre"
    puts "7. Exit"
    exit = false
    while !exit
      input = gets.strip.upcase
      case input
        when 'LIST SONGS'
          Song.print_all
          again?
        when 'LIST ARTISTS'
          Artist.print_all
          again?
        when 'LIST GENRES'
          Genre.print_all
          again?
        when 'PLAY SONG'
          Song.print_all
          puts "Please select a # for the song you want to play."
          selection = gets.strip.to_i-1
          print "Playing: "
          Song.all[selection].print
          again?
        when 'LIST ARTIST'
          Artist.print_all
          puts "Please select an artist."
          selection = gets.strip.split(" ").each {|word| word.capitalize!}
          selection = selection.join(" ")
          Artist.find_by_name(selection).songs.each {|song| song.print}
          again?
        when "LIST GENRE"
          Genre.print_all
          puts "Please select a genre."
          selection = gets.strip
          Genre.find_by_name(selection).songs.each {|song| song.print}
          again?
        when 'EXIT'
          exit = true
        else
      end
    end
  end

  def again?
    puts "Would you like to do something else? (Y/N)"
    input = gets.strip.upcase
    if input == "Y"
      call
    elsif input == "N"
      exit
    else
      puts "That is not a valid choice."
      again?
    end
  end

end