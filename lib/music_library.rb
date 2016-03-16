class MusicLibraryController
  attr_accessor :path

  COMMANDS  =  ['list songs', 'list artists', 'list genres', 'play song', 
                'list artist', 'list genre']

  def initialize(path = './db/mp3s')
    music = MusicImporter.new(path)
    music.import
  end

  def call()
    puts "What would you like to do?"
    method = as_method(gets.chomp)

    if respond_to? method
      send(method)
    else
      puts "Sorry, I can only respond to the following commands:"
      list_commands
    end
  end

  def list_songs
    Song.all.each_with_index {|song, i| puts "#{i+1}. #{song.to_string}"}
    call
  end

  def list_artists
    Artist.all.each {|artist| puts "#{artist.name}"}
    call
  end

  def list_genres
    Genre.all.each {|genre| puts "#{genre.name}"}
    call
  end

  def play_song
    puts "Which song? (enter a number)"
    song_request = gets.chomp
    song = Song.all[song_request.to_i - 1]

    puts "Playing #{song.to_string}"
    call
  end

  def list_artist
    puts "Which artist?"
    artist_request = gets.chomp

    artist = Artist.find_by_name(artist_request)
    artist.songs.each {|song| puts "#{song.to_string}"}
    call
  end

  def list_genre
    puts "Which genre?"
    genre_request = gets.chomp

    genre = Genre.find_by_name(genre_request)
    genre.songs.each {|song| puts "#{song.to_string}"}
    call
  end

  def list_commands
    COMMANDS.each {|com| puts "> #{com}"}
    call
  end

  def exit
    puts "Goodbye!"
  end

  def as_method(str)
    str.gsub(/\s/, '_').downcase
  end
end