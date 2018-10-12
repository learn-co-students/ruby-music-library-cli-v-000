class MusicLibraryController
  attr_accessor :path

  def initialize(path="./db/mp3s")
    @path = path
    music = MusicImporter.new(path)
    music.import
  end

  def call
    input = ""
    while input != "exit"
      puts "Welcome to your music library!"
      input = gets.chomp
      case input
      when "list songs"
        get_song_list
      when "list artists"
        get_artist_list
      when "list genres"
        Genre.all.each do |genre|
          puts "#{genre.name}"
        end
      when "play song"
        puts "choose a song"
        song_list = get_song_list
        song_input = gets.chomp
        puts "Playing #{song_list[song_input.to_i-1].artist.name} - #{song_list[song_input.to_i-1].name} - #{song_list[song_input.to_i-1].genre.name}"
      when "list artist"
        puts "choose an artist"
        artist_list = get_artist_list
        artist_input = gets.chomp
        puts "you chose #{artist_input}"
        artist = Artist.find_by_name(artist_input)
        artist.songs.each do |song|
          puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      when "list genre"
        puts "choose a genre"
        genre_list = get_genre_list
        genre_input = gets.chomp
        puts "you chose #{genre_input}"
        genre = Genre.find_by_name(genre_input)
        genre.songs.each do |song|
          puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      end
    end
  end
  
  def get_song_list
    Song.all.each_with_index do |song, index|
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
  
  def get_artist_list
    Artist.all.each do |artist|
      puts "#{artist.name}"
    end
  end
  
  def get_genre_list
    Genre.all.each do |genre|
      puts "#{genre.name}"
    end
  end
end
