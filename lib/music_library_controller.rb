class MusicLibraryController
  attr_accessor :path

  def initialize(path="./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    system 'clear'
    puts "Welcome to Khalil's music player."
    puts "Your options are as follows 'list songs', 'list artists', 'list genres', 'play song', 'list artist' and 'list genre' "
    answer = ''
    while answer != 'exit'
      puts "What would you like to do?"
      answer = gets.chomp.downcase
      case answer
      when 'list songs'
        list_songs
      when 'list artists'
        artists
      when 'list genres'
        genres
      when 'play song'
        play_song
      when 'list artist'
        list_artist
      when 'list genre'
        list_genre
      end
    end
  end

  def list_songs
     Song.all.each_with_index do |song, index|
     puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def artists
    Song.all.each {|song| puts song.artist.name}
  end

  def genres
    Song.all.each {|song| puts song.genre.name}
  end

  def play_song
    puts "What song would you like to play?"
    answer = gets.chomp.to_i
    puts "Playing #{Song.all[answer-1].artist.name} - #{Song.all[answer-1].name} - #{Song.all[answer-1].genre.name}"
  end

  def list_artist
    puts "Please enter the name of the artist to see songs by that artist"
    choice = gets.chomp.downcase
    Song.all.each do |song|
      if song.artist.name.downcase == choice
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
    if Song.all.none? {|song| song.artist.name.downcase == choice}
      puts "Sorry, artist not found!"
    end
  end

  def list_genre
    puts "Please enter the name of the artist to see songs by that artist"
    choice = gets.chomp.downcase
    Song.all.each do |song|
      if song.genre.name.downcase == choice.downcase
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
    if Song.all.none? {|song| song.genre.name.downcase == choice}
      puts "Sorry, genre not found!"
    end
  end
end
