class MusicLibraryController
  attr_accessor :path, :input, :exit

  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(@path).import
  end

  def call
    @input = gets.chomp
    @input == "exit" ? return : option
  end

  def option
    if @input == "list songs"
      list_songs
      call
    elsif @input == "list artists"
      Artist.all.each{|artist| puts artist.name}
      call
    elsif @input == "list genres"
      Genre.all.each{|genre| puts genre.name}
      call
    elsif @input == "play song"
      play_song
    elsif @input == "list artist"
      list_artist
    elsif @input == "list genre"
      list_genre
    end
  end

  def list_songs
    count = 1
    Song.all.each do |song|
      puts "#{count}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      count += 1
    end
  end

  def play_song
    puts "Enter the number of the song you would like to play."
    input = gets.chomp
    song = Song.all[input.to_i - 1]
    puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}."
    call
  end

  def list_artist
    artist = gets.chomp
    Artist.find_by_name(artist).songs.each{|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
    call
  end

  def list_genre
    input = gets.chomp
    Genre.find_by_name(input).songs.each{|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
    call
  end
end
