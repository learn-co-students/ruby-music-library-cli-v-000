class MusicLibraryController

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    input = ""
    while input != "exit"
      puts "What do you want to do?"
      input = gets.strip
      case input
      when "list songs"
        counter = 1
          Song.all.each do |song|
            puts "#{counter}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
            counter += 1
          end
      when "list artists"
        Artist.all.each {|artist| puts "#{artist.name}"}
      when "list genres"
        Genre.all.each {|genre| puts "#{genre.name}"}
      when "play song"
        puts "Which song would you like to play?"
        song_number = gets.strip.to_i
        puts "Playing #{Song.all[song_number-1].artist.name} - #{Song.all[song_number-1].name} - #{Song.all[song_number-1].genre.name}}"
      when "list artist"
        puts "Which artists songs would you like to see?"
        a = gets.strip
        Song.all.each do |song|
          puts "#{song.artist.name} - #{song.name} - #{song.genre.name}" if song.artist.name == a
        end
      when "list genre"
        puts "Which genre would you like to see?"
        g = gets.strip
        Song.all.each do |song|
          puts "#{song.artist.name} - #{song.name} - #{song.genre.name}" if song.genre.name == g
        end
      end
    end
  end

end
