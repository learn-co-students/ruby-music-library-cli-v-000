require 'pry'
class MusicLibraryController
  extend Concerns::Findable
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    input = ""
    while input != "exit"
      puts "Welcome to the Music Library!"
      puts "What would you like to do?"
      puts ""
      puts "1. List songs\n2. List artists\n3. List genres"
      puts "4. List artist's songs\n5. List genre's songs\n6. Play song\n7. Exit"
      input = gets.chomp
      case input
      when "list songs"  #when "1" => does NOT work
          list_songs
        when "list artists"
          list_artists
        when "list genres"
          list_genres
        when "list artist"
          list_artist
        when "list genre"
          list_genre
        when "play song"
          play_song
        when "exit"
          exit
      end
    end
  end

  def songs
    Song.all.each_with_index(1) do |song, index|
      puts "#{index}. #{song}"
    end
  end

  def list_songs
    Song.all.each.with_index do |song, index|
      # binding.pry
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      # binding.pry
    end
  end
# binding.pry
  def list_artists
    Artist.all.each do |artist|
      puts "#{artist.name}"
    end
  end
    # if artist = Artist.find_by_name(artist_input)
    #   artist.songs.each do |song|
    #     puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    #   end
    # end
  # end

  def list_genres
    Genre.all.each do |genre|
      puts "#{genre.name}"
    end
  end
    # genre_input = gets.strip
    # genre = Genre.find_by_name(genre_input)
    # genre.songs.each_with_index do |song, index|
    #   puts "#{index}. #{song}"
  #   end
  # end


  def play_song
    puts "Please choose the song you would like to play:"
    input = gets.chomp
    puts "Now playing: #{Song.all[input.to_i-1].name}"
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
