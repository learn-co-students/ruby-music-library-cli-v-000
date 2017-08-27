class MusicLibraryController
  extend Concerns::Findable
  attr_accessor :path
  def initialize(path='./db/mp3s')
    music_importer = MusicImporter.new(path)
    music_importer.import
  end
  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    input = gets.strip
    case input
    when "list songs"
      list_songs
      call
    when "list artists"
      list_artists
      call
    when "list genres"
      list_genres
      call
    when "list artist"
      list_songs_by_artist
      call
    when "list genre"
      list_songs_by_genre
      call
    when "play song"
      play_song
      call
    when "exit"
      # we do nothing here so it just ends the method which exits your program
    else
      puts "invalid command"
      call
    end
  end
  #  MusicImporter.new(path)
  def list_songs
    Song.sorted.each_with_index do |song, i|
      puts "#{i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
  def list_artists
    Artist.sorted.each_with_index do |artist, i|
      puts "#{i+1}. #{artist.name}"
    end
  end
  def list_genres
    Genre.sorted.each_with_index do |genre, i|
      puts "#{i+1}. #{genre.name}"
    end
  end
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    users_artist = Artist.find_by_name(input)
    if !users_artist.nil?
      sorted = users_artist.songs.sort_by do |song|
        song.name
      end
      sorted.each_with_index do |song, i|
        puts "#{i+1}. #{song.name} - #{song.genre.name}"
      end
    end
    # Artist.songs.each_with_index do |song, i|
    #   puts "#{i}. #{song}"
    # end
  end
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    users_genre = Genre.find_by_name(input)
    if !users_genre.nil?
      sorted = users_genre.songs.sort_by do |song|
        song.name
      end
      sorted.each_with_index do |song, i|
        puts "#{i+1}. #{song.artist.name} - #{song.name}"
      end
    end
  end
  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip
    Song.sorted.each_with_index do |song, i|
      if input.to_i == i+1

        puts "Playing #{song.name} by #{song.artist.name}"
      end
    end  #Song.sorted[3].name
  end
end
# 1) CLI Methods #play_song upon receiving valid input 'plays' the matching song from the alphabetized lis
# t output by #list_songs
#      Failure/Error: expect($stdout).to receive(:puts).with("Playing Larry Csonka by Action Bronson")
#        (#<IO:<STDOUT>>).puts("Playing Larry Csonka by Action Bronson")
#            expected: 1 time with arguments: ("Playing Larry Csonka by Action Bronson")
#            received: 0 times
