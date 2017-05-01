class MusicLibraryController
  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    puts "Initializing your music library..."
    puts "What would you like to do?"
    input = nil
    until input == "exit"
      input = gets.chomp
      case input
      when "list songs"
        Song.list_songs.each_with_index do |song_info, index|
          puts "#{index + 1}. #{song_info} "
        end
      when "list artists"
        Artist.all.each {|artist| puts artist.name}
      when "list genres"
        Genre.all.each {|genre| puts genre.name}
      when "play song"
        puts "Please input the number that corresponds with the song you'd like to hear."
        song_number = gets.chomp.to_i - 1
        song_info = Song.list_songs[song_number]
        puts "Playing #{song_info}"
      when "list artist"
        puts "Please enter the artist whose songs you would like listed:"
        artist_name = gets.chomp
        artist = Artist.find_by_name(artist_name)
        artist.songs.each_with_index do |song, index|
          puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      when "list genre"
        puts "Please enter the genre of songs you would like listed:"
        genre_name = gets.chomp
        genre = Genre.find_by_name(genre_name)
        genre.songs.each_with_index do |song, index|
          puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      end
    end
  end
end
