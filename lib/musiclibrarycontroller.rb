class MusicLibraryController

  def initialize(path="./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    puts "Welcome to the Music Library Controller!"
    input = nil
    until input == "exit"
      puts "What would you like to do?"
      input = gets.strip
      if input == "list artists"
        artist_names = Artist.all.collect { |artist| artist.name }
        artist_names.sort.each { |name| puts name }
        puts "If you would like to see all songs by a given artist, please enter that artist's name."
      elsif input == "list genres"
        genre_names = Genre.all.collect { |genre| genre.name }
        genre_names.sort.each { |name| puts name }
        puts "If you would like to see all songs in a given genre, please enter that genre."
      elsif input == "list songs"
        songs = Song.all.sort { |x, y| x.artist.name <=> y.artist.name }
        songs.each_with_index { |song, i| puts "#{i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}" }
      elsif input == "play song"
        puts "Which song would you like to play? Please choose by entering the corresponding number from the displayed by the 'list songs' command."
        song_number = gets.strip.to_i
        songs = Song.all.sort { |x, y| x.artist.name <=> y.artist.name }
        song = songs[song_number - 1]
        if song
          puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
        else
          puts "Sorry, looks like I couldn't find the song!"
        end
      elsif Artist.all.any? { |artist| input == artist.name }
        artist = Artist.all.find { |artist| input == artist.name }
        artist.songs.each { |song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}" }
      elsif Genre.all.any? { |genre| input == genre.name }
        genre = Genre.all.find { |genre| input == genre.name }
        genre.songs.each { |song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}" }
      end
    end
  end

end
