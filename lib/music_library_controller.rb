class MusicLibraryController

  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
  end

  def call
    i = 1
    input = nil
    until input == "exit"
      puts "What would you like to do?"
      input = gets.strip

      case input
      when "list songs"
        Song.all.each do |song|
          puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
          i += 1
        end
      when "list artists"
        Artist.all.each do |artist|
          puts "#{artist.name}"
        end
      when "list genres"
        Genre.all.each do |genre|
          puts "#{genre.name}"
        end
      when "play song"
        puts "Enter the number of the song you would like to play."
        song = Song.all[gets.strip.to_i-1]
        puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
      when "list artist"
        puts "Please enter the artist."
        artist = Artist.find_by_name(gets.strip)
        artist.songs.each do |song|
          puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      when "list genre"
        puts "Please enter the genre."
        genre = Genre.find_by_name(gets.strip)
        genre.songs.each do |song|
          puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      end


    end
  end

end
