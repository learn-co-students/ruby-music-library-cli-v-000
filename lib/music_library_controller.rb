


class MusicLibraryController
  #attr_accessor :path

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end



  def call
    input = nil
    while input != "exit"
      input = gets.chomp

      if input == "list songs"
        Song.all.each_with_index do |song, index|
          puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      end

      if input == "list artists"
        Artist.all.each do |artist|
          puts artist.name
        end
      end

      if input == "list genres"
        Genre.all.each do |genre|
          puts genre.name
        end
      end

      if input == "play song"
        new_input = gets.to_i - 1
        song = Song.all[new_input]
        puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end

      if input == "list artist"
        new_input = gets.chomp
        artist = Artist.find_by_name(new_input)
        artist.songs.each do |song|
          puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      end

      if input == "list genre"
        new_input = gets.chomp
        genre = Genre.find_by_name(new_input)
        genre.songs.each do |song|
          puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      end


    end
  end


end

