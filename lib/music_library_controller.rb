class MusicLibraryController

  attr_accessor :path

  def initialize(path = './db/mp3s')
    @path = path
    music_importer = MusicImporter.new(@path)
    music_importer.import
  end

  def call
    puts "Hello! Please enter a command: "
    user_input = gets.chomp
    if user_input != 'exit'
      cli_switch(user_input)
      call
    else
      puts 'Goodbye'
    end
  end

  def cli_switch(input)
    case input
    when "list songs"
      list_songs
    when "list artists"
      list_artists
    when "list genres"
      list_genres
    when "play song"
      puts "Enter Song Index Number:"
      play_song(gets.chomp)
    when "list artist"
      puts "Please enter the artist's name:"
      get_song_by_artist(gets.chomp)
    when "list genre"
      puts "Please enter the genre's name:"
      get_song_by_genre(gets.chomp)
    else
      puts 'Input not recognized!'
      return nil
    end
  end

  def list_songs
    Song.all.each_with_index do |elem, idx|
      puts "#{idx + 1}. #{elem.artist.name} - #{elem.name} - #{elem.genre.name}"
    end
  end

  def list_artists
    Artist.all.each{ |artist| puts "#{artist.name}" }
  end

  def list_genres
    Genre.all.each { |genre| puts "#{genre.name}"}
  end

  def play_song(idx)
    song = Song.all[idx.to_i - 1]
    puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end

  def get_song_by_artist(artist)
    Song.all.select{ |song| song.artist.name == artist }.each{ |elem| puts "#{elem.artist.name} - #{elem.name} - #{elem.genre.name}"}
  end

  def get_song_by_genre(genre)
    Song.all.select{ |song| song.genre.name == genre}.each{ |elem| puts "#{elem.artist.name} - #{elem.name} - #{elem.genre.name}"}
  end



end
