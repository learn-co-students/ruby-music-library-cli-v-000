class MusicLibraryController

  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
  end

  def call
    input = ""
    while input!= "exit"
      puts "What would you like to do? Your options are: list songs, list artists, list genres, play song, list artist, list genre, and exit. :)"
      input = gets.chomp
      if input == "list songs"
        Song.all.each_with_index do |song, i|
          puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      elsif input == "list artists"
        Artist.all.each do |artist|
          puts artist.name
        end
      elsif input == "list genres"
        Genre.all.each do |genre|
          puts genre.name
        end
      elsif input == "play song"
        puts "Enter the track number:"
        track = gets.chomp.to_i - 1
        puts "Playing #{Song.all[track].artist.name} - #{Song.all[track].name} - #{Song.all[track].genre.name}"
      elsif input == "list artist"
        list_artist
      elsif input == "list genre"
        list_genre
      end
    end
  end

  def list_artist
    puts "Enter the artist's name:"
    who = gets.chomp
    Artist.all.each do |artist|
      if artist.name == who
        artist.songs.each do |song|
          puts "#{artist.name} - #{song.name} - #{song.genre.name}"
        end
      end
    end
  end

  def list_genre
    puts "Enter the genre name:"
    what = gets.chomp
    Genre.all.each do |genre|
      if genre.name == what
        genre.songs.each do |song|
          puts "#{song.artist.name} - #{song.name} - #{genre.name}"
        end
      end 
    end
  end

end
