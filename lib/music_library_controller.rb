class MusicLibraryController
  attr_accessor :path, :array
  def initialize(path = "./db/mp3s")
    @path = path
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    response = nil
    while response != "exit"
      puts "What do you want to do? Options: list songs, list artists, list genres, play song, list artist, list genre"
      response = gets.chomp
      if response == "list songs"
        list_songs
      elsif response == "list artists"
        list_artists
      elsif response == "list genres"
        list_genres
      elsif response == "play song"
        play_song
      elsif response == "list artist"
        list_artist
      elsif response == "list genre"
        list_genre
      elsif response == "exit"
        break
      else
        puts "I don't know what that means. Please enter one of the following: list songs, list artists, list genres, play a song, list artist, list genre"
      end
    end
  end

  def list_songs
    @array = Song.all.collect {|song| song.name_without_mp3}.sort!
    @array.each_with_index { |song, index| puts "#{index + 1}. #{song}" }
  end

  def list_artists
    Artist.all.each { |artist| puts artist.name}
  end

  def list_genres
    Genre.all.each { |genre| puts genre.name}
  end

  def play_song
    list_songs
    puts "Which song number?"
    response = gets.chomp.to_i
    if response != 0
    puts "Playing #{@array[response -1]}"
    end
  end

  def list_artist
    puts "Which artist?"
    response = gets.chomp
    artist = Artist.find_by_name(response)
    artist.songs.each {|song| puts "#{song.name_without_mp3}"}
  end

  def list_genre
    puts "Which genre?"
    response = gets.chomp
    genre = Genre.find_by_name(response)
    genre.songs.each {|song| puts "#{song.name_without_mp3}"}
  end
end