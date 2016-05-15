class MusicLibraryController

  extend Concerns::Findable
  attr_accessor :path
 

  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end

  def call
    input = ""
    while input != "exit"
      
      puts "What would you like to do?
      list songs
      list artists
      list genres
      play a song
      list an artist's songs
      list songs by genre
      exit" 
      input = gets.strip

      case input
      when "list songs"
        Song.all.each_with_index do |song, index|
        puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end

      when "list artists"
        Artist.all.each do |artist|
        puts "#{artist.name}" 
        end

      when "list genres"
        Genre.all.each do |genre|
        puts "#{genre.name}" 
        end

      when "play song"
        puts "Choose a track to play."
        song_input = gets.strip
        puts "Playing #{Song.all[song_input.to_i-1]}"
        
      when "list artist"
        list_artist
      
      when "list genre"
        list_genre
      end
    end
  end

  def songs
    Song.all.each_with_index(1) do |song, index|
    puts "#{index}. #{song}"
    end
  end

  def list_artist
    puts "Enter the artist's name."
    artist_input = gets.strip
    if artist = Artist.find_by_name(artist_input)
    artist.songs.each do |song| 
    puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
      end
  end

  def list_genre
    puts "Pick a genre."
      genre_input = gets.strip
      genre = Genre.find_by_name(genre_input)
      genre.songs.each_with_index do |song, index| 
      puts "#{index}. #{song}"
    end
  end 
end 