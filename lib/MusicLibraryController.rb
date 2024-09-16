class MusicLibraryController
  def initialize(path = "./db/mp3s")
    music = MusicImporter.new(path)
    music.import
  end

  def call
    input = nil
    until input == "exit"
      input = gets.strip

      case input
      when "list songs"
        all_songs = Song.all
        sorted = all_songs.sort_by!{ |song| song.artist.name }
        sorted.each.with_index do |song, index|
          puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end

      when "list artists"
        Artist.all.each do |artist|
          puts artist.name
        end

      when "list genres"
        Genre.all.each do |genre|
          puts genre.name
        end

      when "play song"
        puts "Enter the number of the song you would like to hear."
        number = gets.chomp
        song = Song.all[number.to_i - 2]
        puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"

      when "list artist"
        puts "Enter an artist's name to see their songs."
        artist_name = gets.chomp

        if artist = Artist.find_by_name(artist_name)
          artist.songs.each do |song|
            puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
          end
        end

      when "list genre"
        puts "Enter a genre."
        genre = gets.chomp

        if genre = Genre.find_by_name(genre)
          genre.songs.each do |song|
            puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
          end
        end
      end
    end
  end
end
