class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end

  def call
    input = ""

    while input != "exit"
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
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "list artist"
        list_songs_by_artist
      when "list genre"
        list_songs_by_genre
      when "play song"
        play_song
      end
    end
  end

  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
  end

  def list_songs
    song_array = []
    Song.all.each do |song|
      list = [song.artist.name, song.name, song.genre.name]
      song_array << list
    end
    song_array.sort_by{|p| p[1]}.each_with_index do |song, index|
      puts "#{index + 1}. #{song.join(" - ")}"
    end
  end

  def list_artists
    artist_array = []
    Artist.all.each { |artist| artist_array << artist.name }
    artist_array.sort!.uniq!
    artist_array.each_with_index do |artist, index|
      puts "#{index + 1}. #{artist}"
    end
  end

  def list_genres
    genre_array = []
    Genre.all.each { |genre| genre_array << genre.name }
    genre_array.sort!.uniq!
    genre_array.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    song_array = []
    Artist.all.each do |artist|
      if artist.name == input
        artist.songs.each { |song| song_array << "#{song.name} - #{song.genre.name}" }
        song_array.sort!
        song_array.each_with_index { |song, index| puts "#{index + 1}. #{song}" }
      end
    end
  end
    # files.each {|song| song_list << song if song.split(" - ")[0] == artist}
    #
    # song_list.collect! {|song| song.split(" - ")}
    # song_list.each_with_index do |song, index|
    #   puts "#{index + 1}. #{song[1]} - #{song[2].gsub(".mp3", "")}"
    # end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre = gets.strip
    song_list = []
    files.each {|song| song_list << song if song.split(" - ")[2].gsub(".mp3", "") == genre}

    song_list.collect! {|song| song.split(" - ")}
    song_list.sort_by! {|p| p[1]}
    song_list.each_with_index do |song, index|
      puts "#{index + 1}. #{song[0]} - #{song[1]}"
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    songs = files
    song = gets.strip
    index = song.to_i - 1
    length = files.length-1
    if index.between?(0, length)
      pieces = files.collect {|song| song.split(" - ")}.sort_by{|p| p[1]}
      puts "Playing #{pieces[index][1]} by #{pieces[index][0]}"
    end
  end
end
