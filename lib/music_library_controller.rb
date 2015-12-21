class MusicLibraryController
  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end 

  def call
    puts "Your Music Library"
    puts "Please Choose One Of The Options Below:"
    puts "1. List Songs"
    puts "2. List Artists"
    puts "3. List Genres"
    puts "4. Play Song"
    puts "5. List Artist"
    puts "6. List Genre"
    puts "Exit"
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
          puts "Please choose a # for the song you want to play."
          choice = gets.strip.to_i - 1
          print "Playing "
          Song.all[choice].print
          again?
        when "LIST ARTIST"
          Artist.print_all
          puts "Please choose an artist's name."
          choice = gets.strip.split(" ").each {|word| word.capitalize!}
          choice = choice.join(" ")
          Artist.find_or_create_by_name(choice).songs.each {|song| song.print}
          again?
        when "LIST GENRE"
          Genre.print_all
          puts "Please choose a genre."
          choice = gets.strip
          Genre.find_or_create_by_name(choice).songs.each {|song| song.print}
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
      puts 'That s not a valid choice!!'
      again?
    end
  end
end