class MusicLibraryController
  attr_accessor :path

  def initialize(url="./db/mp3s")
    MusicImporter.new(url.to_s).import
  end

  def call
    loop do
      input = gets.strip
      break if input == "exit"

      if input == "list songs"
        list_songs
      elsif input == "list artists"
        list_artists
      elsif input == "list genres"
        list_genres
      elsif input == "play song"
        play_song
      elsif input == "list artist"
        list_artist
      elsif input == "list genre"
        list_genre
      end
    end
  end

  def list_songs
    Song.all.each_with_index do |song, index|
      puts "#{index+1}. #{song.to_s}"
    end
  end

  def list_artists
    Artist.all.each do |artist|
      puts artist.name
    end
  end

  def list_genres
    Genre.all.each do |genre|
      puts genre.name
    end
  end

  def play_song
    puts "Please enter the number of the song you'd like to hear."
    new_input = gets.chomp
    # binding.pry
    Song.all.sort!{|a, b| a.artist.name <=> b.artist.name}
    song = Song.all[new_input.to_i-1]
    puts "Playing #{song.to_s}"
  end

  def list_artist
    puts "Please enter the artst whose songs you'd like to see. You can type their name, then hit 'enter.'"
    new_input = gets.chomp
    Artist.all.each do |artist|
      if artist.name == new_input
        artist.songs.each do |song|
          puts song.to_s
        end
      end
    end
  end

  def list_genre
    puts "Please enter a genre to see all of the songs in that genre. You can type the genre name, then hit 'enter.'"
    new_input = gets.chomp
    Genre.all.each do |genre|
      if genre.name == new_input
        genre.songs.each do |song|
          puts song.to_s
        end
      end
    end
  end

end
