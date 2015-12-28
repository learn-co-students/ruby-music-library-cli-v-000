class MusicLibraryController

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    input = ""

    while input != "exit"
      input = gets.chomp

      if input == "list songs"
        num = 1
        Song.all.each do |song|
          puts "#{num}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
          num += 1
        end
      elsif input == "list artists"
        Artist.all.each do |artist|
          puts "#{artist.name}"
        end
      elsif input == "list genres"
        Genre.all.each do |genre|
          puts "#{genre.name}"
        end
      elsif input == "play song"
        puts "What song should I play?"
          user_input = gets.chomp
          song = Song.all[user_input.to_i - 1]
          puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
      elsif input == "list artist"
        puts "Which artist would you like me to list the songs for?"
          artist = gets.chomp
          Artist.find_by_name(artist).songs.each do |song|
            puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
          end
      elsif input == "list genre"
        puts "What genre would you like to list the songs for?"
          genre = gets.chomp
          Genre.find_by_name(genre).songs.each do |song|
            puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
          end
      elsif input == "exit"
        puts "Goodbye!"
        break
      else
        puts "That is not a valid input, please try again."
        input = gets.chomp
      end
    end

  end


end