class MusicLibraryController

  attr_accessor :path

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    puts "Music was imported!  Use the following commands:\n\n list songs (returns all songs in in the library)\n list artists (returns an unordered list of the artists in the library)\n list genres (returns an ordered list of the genres in the library)"
    puts " play song (plays selected song by entering song number)\n list artist (returns all songs by the specified artist)\n list genre (returns all songs in the specified genre)"
    puts " exit (ends the session and returns to prompt)\n\n"
    input = nil
    until input == "exit"
      puts "what do you want to do?"
      input = gets.chomp

      case input
      when "list songs"
        Song.all.each_with_index do |song, index|
          puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      when "list artists"
        Song.all.each do |song|
          puts "#{song.artist.name}"
        end
      when "list genres"
        Song.all.each do |song|
          puts "#{song.genre.name}"
        end
      when "play song"
       puts "enter the number of the song to play"
       song_number = (gets.chomp.to_i)-1 #based on import order of files/correction for indexing array of songs relative to user-displayed list
       puts "Playing #{Song.all[song_number].artist.name} - #{Song.all[song_number].name} - #{Song.all[song_number].genre.name}"
      when "list artist"
        puts "enter the artist"
        name = gets.chomp
        if Artist.find_by_name(name).songs.each do |song|
            puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
          end
        else
          puts "sorry, that artist isn't in the library"
        end
      when "list genre"
        puts "enter the genre"
        genre = gets.chomp
        if Genre.find_by_name(genre).songs.each do |song|
            puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
          end
        else
          puts "sorry, that genre isn't in the library"
        end
      end

    end
  end

end
