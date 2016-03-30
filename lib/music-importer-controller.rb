class MusicLibraryController

  attr_accessor :path
  attr_reader :controller

  def initialize(path="./db/mp3s")
    @path = path
    @controller = MusicImporter.new(@path).import
  end

  OPTIONS = ["list songs", "list artists", "list genres", "list artist", "list genre", "play song"]

  def execute_action(op)
    case op
    when "list songs"
      list_songs
    when "list artists"
      list_artists
    when "play song"
      play_song
    when "list genres"
      list_genres
    when "list artist"
      list_artist
    when "list genre"
      list_genre
    end
  end

  def call
    puts "Hi! Welcome to Music CLI!"
    loop do
      puts " "
      puts "What would you like to do?"
      puts <<-MSG
      _________________________
      I accept
        > list songs
        > list artists
        > play song
        > list genres
        > list artist
        > list genre
      _________________________
      MSG
      option = gets.chomp.downcase.strip
      if OPTIONS.include?(option)
        execute_action(option)
      else
        break
      end
    end
  end

  def list_songs
    self.controller.each.with_index(1) do |file, index|
      puts "#{index}. #{file.chomp(".mp3")}"
    end
  end

  def list_artists
    Artist.all.uniq.each do |artist|
      puts artist.name
    end
  end

  def list_genres
    Genre.all.uniq.each do |genre|
      puts genre.name
    end
  end

  def play_song
    puts "What song number?"
    song_number = gets.chomp.strip
    self.controller.each.with_index(1) do |file, index|
      if song_number.to_i == index
        puts "Playing #{file.chomp(".mp3")}"
      end
    end
  end

  def list_artist
    puts "What artist?"
    artist = gets.chomp
    Artist.find_by_name(artist).songs.each do |song|
      puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_genre
    puts "What genre?"
    genre = gets.chomp.downcase.strip
    Genre.find_by_name(genre).songs.each do |song|
      puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end


end