class MusicLibraryController

  def initialize(path = "./db/mp3s")
    library = MusicImporter.new(path)
    library.import
  end

  def call
    input = ""
    output_array = []
    until input == "exit" do
      input = gets.chomp
      case input
        when "list songs"
          i = 1
          output_array = Song.all.collect do |song|
            "#{song.artist.name} - #{song.name} - #{song.genre.name}"
          end
          output_array.sort!
          output_array.collect do |output_string|
            puts "#{i}. #{output_string}"
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
          i = 1
          output_array = Song.all.collect do |song|
            "#{song.artist.name} - #{song.name} - #{song.genre.name}"
          end
          output_array.sort!
          output_array.each do |output_string|
            "#{i}. #{output_string}"
            i += 1
          end
          input = gets.chomp.to_i
          puts "Playing #{output_array[input-1]}"

        when "list artist"
          output_array = Song.all.collect do |song|
            "#{song.artist.name}"
          end
          input = gets.chomp
          artist = Artist.find_by_name(input)
          artist.songs.each do |song|
           puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
          end

        when "list genre"
          output_array = Song.all.collect do |song|
            "#{song.genre.name}"
          end
          input = gets.chomp
          genre = Genre.find_by_name(input)
          genre.songs.each do |song|
           puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
          end

        end
      end
    end
  end
