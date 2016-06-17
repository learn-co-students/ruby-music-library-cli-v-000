class MusicLibraryController
  extend Concerns::Findable
  attr_accessor :path
  def initialize(path = "./db/mp3s")
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def call
    puts "What would you like to do?"
    input = gets.chomp
    until input == "exit"
      if input == "list songs"
        list_songs
      elsif input == "list artists"
        list_artists
      elsif input == "list genres"
        list_genres
      elsif input == "play song"
        play_song
      elsif input == "list artist"
        artist_songs
      elsif input == "list genre"
        genre_songs
      end
      input = gets.chomp
    end
  end

  def list_songs
    alpha = Song.all.sort_by{|s| s.artist.name}
    alpha.each.with_index do |s, i|
      puts "#{i+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    end
  end

  def list_artists
    artists = Artist.all.sort_by{|a| a.name}
    artists.each do |artist|
      puts "#{artist.name}"
    end
  end

  def list_genres
    genres = Genre.all.sort_by{|g| g.name}
    genres.each do |genre|
      puts "#{genre.name}"
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    play_input = gets.chomp
    Song.all.each_with_index do |s, i|
      play_input.include?((i + 1).to_s)
      puts "Playing #{s.artist.name} - #{s.name} - #{s.genre.name}"
    end
  end

  def artist_songs
    puts "Which artist are you looking for?"
    artist_input = gets.chomp
    artist_songs = Artist.find_by_name(artist_input)
    artist_songs.songs.each do |song|
      puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def genre_songs
    puts "Which genre are you looking for?"
    genre_input = gets.chomp
    genre_songs = Genre.find_by_name(genre_input)
    genre_songs.songs.each do |song|
      puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

end
