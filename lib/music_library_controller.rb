require 'pry'

class MusicLibraryController
  def initialize(path = "./db/mp3s")
    @path = path
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def call
    input = " "
    while input != "exit"
      puts "Welcome to your Music Library!"
      puts "What would you like to do?"
      input = gets.strip
      case input
      when "list songs"
          songs
        when "list artists"
          artists
        when "list genres"
          genres
        when "play song"
          play_song
        when "list artist"
          list_artist
        when "list genre"
          list_genre
        end
    end
  end

  def songs
    Song.all.each_with_index do |song,index|
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def artists
    Artist.all.each do |artist|
      puts "#{artist.name}"
    end
  end

  def genres
    Genre.all.each do |genre|
      puts "#{genre.name}"
    end
  end

  def play_song
    self.songs
    puts "Which song would you like to play? Hint: Pick a number"
    input = gets.strip.to_i
    Song.all.each_with_index do |song,index|
      if input == index + 1
        puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_artist
    puts "Enter an artist name:"
    artist = gets
    artist = Artist.find_by_name(artist)
    artist.songs.each{|s| puts "#{s.artist.name} - #{s.name} - #{s.genre.name}"}
  end

  def list_genre
    puts "Enter a genre:"
    genre = gets
    genre = Genre.find_by_name(genre)
    genre.songs.each{|s| puts "#{s.artist.name} - #{s.name} - #{s.genre.name}"}
  end

end
