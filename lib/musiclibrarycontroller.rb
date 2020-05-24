class MusicLibraryController

  attr_accessor :path

  def initialize(path="./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    user_input = 'keep_going'
    while user_input != 'exit'
    puts "\nType the command you'd like to run (list songs, list artists, list genres, play song, list artist, list genre, or exit"
    user_input = gets.chomp.downcase

    case user_input
      when 'list songs'
        list_songs
      when 'list artists'
        list_artists
      when 'list genres'
        list_genres
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
    Song.all.each.with_index(1) { |song, index|
      puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}" }
  end

  def list_artists
    Artist.all.each { |artist| puts "#{artist.name}" }
  end

  def list_genres
    Genre.all.each { |genre| puts "#{genre.name}" }
  end

  def play_song
    puts 'pick a song to play'
    user_song = gets.chomp.to_i
    Song.all.each.with_index(1) do |song, index|
      if index == user_song
        puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_artist
    puts 'pick an artist to list their songs'
    user_artist = gets.chomp
    Song.all.each do |song|
        if song.artist.name == user_artist
          puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
    end
  end

  def list_genre
    puts 'pick a genre to list their songs'
    user_genre = gets.strip
    Song.all.each do |song|
      if song.genre.name == user_genre
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end

end