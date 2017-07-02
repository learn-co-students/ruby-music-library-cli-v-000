class MusicLibraryController

  def initialize(path = "./db/mp3s")
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def call
    input = ""
    while input != "exit"
      puts "What are you looking for?"
      input = gets.chomp
        case input
          when "list songs"
            Song.all.each_with_index {|song, index| puts "#{index + 1}. #{song}"}
          when "list artists"
            Artist.all.each_with_index {|artist, index| puts "#{index + 1}. #{artist}"}
          when "list genres"
            Genre.all.each_with_index {|genre, index| puts "#{index + 1}. #{genre}"}
          when "play song"
            puts "Which song number would you like to play?"
            song_input = gets.chomp.to_i-1
            puts "Playing #{Song.all[song_input]}"
          when "list artist"
            puts "What artist by name would you like to list songs for?"
            artist_input = gets.chomp
            artist = Artist.find_by_name(artist_input)
            artist.songs.each {|song, index| puts "#{index}. #{song}"}
          when "list genre"
            puts "What genre by name would you like to list songs for?"
            genre_input = gets.chomp
            genre = Genre.find_by_name(genre_input)
            genre.songs.each {|song, index| puts "#{index}. #{song}"}
        end
    end
  end

end
