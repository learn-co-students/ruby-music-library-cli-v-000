class MusicLibraryController
  attr_accessor :path
  def initialize(path = "./db/mp3s")
    self.path = path
    MusicImporter.new(path).import
  end
  def call
    puts "Welcome to RMML (Ruby Magick Music Library)"
    input = nil
    until (input == "list songs" or input == "exit" or input == "list artists" or input == "list genres" or input == "play song" or input == "list artist" or input == "list genre")
      puts "Enter your command, fair traveller!"
      input = gets.chomp
    end
    if input == "list songs"
      song_counter = 1
      Song.all.each do |song| 
        puts "#{song_counter}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        song_counter += 1
      end
      call
    elsif input == "list artists"
      Artist.all.each do |artist| 
        puts "#{artist.name}"
      end
      call
    elsif input == "list genres"
      Genre.all.each do |genre| 
        puts "#{genre.name}"
      end
      call
    elsif input == "play song"
      song_counter = 1
      Song.all.each do |song| 
        puts "#{song_counter}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        song_counter += 1
      end      
      puts "Which song do you want to play? (Enter the number from the list above)"
      play_song_number = gets.chomp
      puts "Playing #{Song.all[play_song_number.to_i-1].artist.name} - #{Song.all[play_song_number.to_i-1].name} - #{Song.all[play_song_number.to_i-1].genre.name}"
      call
    elsif input == "list artist"
      puts "Which artist's songs would you like to see?"
      artist_choice = gets.chomp
      found_artist = Artist.all.find do |artist| 
        artist.name == artist_choice
      end
      found_artist.songs.each do |song|
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
      call
    elsif input == "list genre"
      puts "Which genre's songs would you like to see?"
      genre_choice = gets.chomp
      found_genre = Genre.all.find do |genre| 
        genre.name == genre_choice
      end
      found_genre.songs.each do |song|
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
      call                     
    elsif input == "exit"
      puts "Goodbye"
    end
  end
end