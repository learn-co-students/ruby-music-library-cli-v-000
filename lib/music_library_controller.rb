class MusicLibraryController

  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
  end

  def call
    input = ""
    while input.downcase != "exit"
      puts "What would you like to do?"
      input = gets.chomp

      case input
      when "list songs"
        list_songs
        puts "Would you like to do anything else?"
      when "list artists"
        list_artists
        puts "Would you like to do anything else?"
      when "list genres"
        list_genres
        puts "Would you like to do anything else?"
      when "play song"
        play_song
        puts "Would you like to do anything else?"
      when "list artist"
        list_artist_songs
        puts "Would you like to do anything else?"
      when "list genre"
        list_genre_songs
        puts "Would you like to do anything else?"
      when "exit"
        break
      else
        puts "This is not a valid input. Try again!"
      end
    end
  end

  def list_songs
    Song.all.each_with_index do |song, index|
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.each {|artist| puts "#{artist.name}"}
  end

  def list_genres
    Genre.all.each {|genre| puts "#{genre.name}"}
  end

  def play_song
    Song.all.each do |song|
      puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artist_songs
    Artist.all.each do |artist|
      artist.songs.each do |song|
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_genre_songs
    Genre.all.each do |genre|
      genre.songs.each do |song|
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end

end