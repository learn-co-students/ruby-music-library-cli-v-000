class MusicLibraryController

  def initialize(file_path = "./db/mp3s")
    MusicImporter.new(file_path).import
  end

  def call
    lists = Song.all.sort_by{|a| a.artist.name }
    input = ""
    while input != "exit"
      puts "input something"
      input = gets.strip

      if input == "list songs"
        lists.map.with_index do |song, i|
          puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      end

      if input == "list artists"
        Artist.all.sort_by{|a| a.name }.map do |artist|
          puts "#{artist.name}"
        end
      end

      if input == "list genres"
        Genre.all.sort_by{|a| a.name }.map do |genre|
          puts "#{genre.name}"
        end
      end

      if input == "play song"
        puts "input number"
        input = gets.strip
        playing_song = lists[input.to_i-1]
        puts "Playing #{playing_song.artist.name} - #{playing_song.name} - #{playing_song.genre.name}"
      end

      if Artist.find_by_name(input)
        Artist.find_by_name(input).songs.map do |song|
          puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      end

      if Genre.find_by_name(input)
        Genre.find_by_name(input).songs.map do |song|
          puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      end

    end
  end
end
