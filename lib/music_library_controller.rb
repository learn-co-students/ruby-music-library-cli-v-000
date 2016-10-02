class MusicLibraryController
  require 'pry'

    def initialize(path = "./db/mp3s")
    @path = path
      import_music = MusicImporter.new(path)
      import_music.import
    end
  
    def call
      input = nil
      until input == "exit"
      puts "Welcome to your Music Library"
      puts "Please tell me what you would like to do"
      input = gets.chomp

      if input == "list songs"
        songs
      elsif input == "play song"
        play_song
      elsif input == "list artists"
        list_artists
      elsif input == "list genres"
        list_genres
      elsif input == "list artist"
        list_artist
      elsif input == "list genre"
        list_genre
      end
    end
  end
  
  def songs
    Song.all.each.with_index(1) do |s, i|
      puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    end
  end

  def list_artists
   Artist.all.each do |artist|
      puts"#{artist.name}"
    end
  end

  def list_genres
    Genre.all.each do |genre|
      puts "#{genre.name}"
    end
  end

  def play_song
    puts "What song would you like to play?"
    input = gets.strip
    puts "Playing #{Song.all[input.to_i - 1].artist.name} - #{Song.all[input.to_i - 1].name} - #{Song.all[input.to_i - 1].genre.name}"
  end

  def list_artist
    puts "What artist would you like to list songs for?"
    input = gets.strip
    Artist.all.each do |artist|
      if artist.name == input
        artist.songs.each do |song|
        puts "#{artist.name} - #{song.name} - #{song.genre.name}"
        end
      end
    end
  end

  def list_genre
    puts "What genre would you like to list songs for?"
    input = gets.chomp
    Genre.all.each do |genre|
      if genre.name == input
        genre.songs.each do |song|
          puts "#{song.artist.name} - #{song.name} - #{genre.name}"
        end
      end
    end
  end
end   