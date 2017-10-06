class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    importer = MusicImporter.new(path)
    importer.import
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
    end
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

  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
  end

  def list_songs
    list = files
    song_sorter = []
    final_list = []
    files.each {|song| song_sorter << song.split(" - ")}
    song_sorter.map {|song| song[0], song[1] = song[1], song[0] }
    song_sorter.sort!
    song_sorter.map {|song| song[0], song[1] = song[1], song[0] }
    song_sorter.collect! {|song| song.join(" - ").gsub(".mp3", "")}
    list = song_sorter
    list.each_with_index do |song, index|
      final_list << "#{index + 1}. #{song}"
      puts "#{index + 1}. #{song}"
    end
    final_list

  end

  def list_artists
    list = files.sort
    list.collect! {|song| song.split(" - ")[0]}.uniq!
    list.each_with_index do |song, index|
      puts "#{index + 1}. #{song}"
    end
  end

  def list_genres
    list = files
    list.collect! {|song| song.split(" - ")[2].gsub(".mp3", "")}.uniq!
    list.sort!
    list.each_with_index do |song, index|
      puts "#{index + 1}. #{song}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist = gets.strip
    song_list = []
    files.each {|song| song_list << song if song.split(" - ")[0] == artist}

    song_list.collect! {|song| song.split(" - ")}
    song_list.each_with_index do |song, index|
      puts "#{index + 1}. #{song[1]} - #{song[2].gsub(".mp3", "")}"
    end
  end

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
    song_list = list_songs
    puts "Which song number would you like to play?"
    song = gets.strip
    index = song.to_i - 1
    if index.between(0, song_list.length -1)

      pieces = choice.split(" - ")
      puts "Playing #{pieces[1]} by #{pieces[0]}"
    end

  end
end
