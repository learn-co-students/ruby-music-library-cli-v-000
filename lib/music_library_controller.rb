class MusicLibraryController

  def initialize(path='./db/mp3s')
    MusicImporter.new(path).import
  end

  def call
    puts "Your Music Library"
    puts "Please Select One Of The Options Below:"
    puts "1. List Songs"
    puts "2. List Artists"
    puts "3. List Genres"
    puts "4. Play A Song"
    puts "5. List An Artist's Songs"
    puts "6. List A Genre's Songs"
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
          Genres.print_all
          again?
      end
    end
  end
end
