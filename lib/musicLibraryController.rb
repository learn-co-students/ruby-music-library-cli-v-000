class MusicLibraryController

  def initialize(path="./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    input = ""

    while input.downcase != "exit"
      puts "What would you like to do?\nlist songs,\nlist artists\nlist genres\nplay song\nlist artist songs\nlist song genres"
      input = gets.chomp

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
      elsif input =="list genre"
        song_genres
      end
    end
  end

  def list_songs
    songs = Song.all.sort_by! {|song| song.artist.name}
    songs.each_with_index do |song,num|
      if num < 4
        puts "#{num + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_artists
    songs = Song.all.sort_by! {|song| song.artist.name}
    songs.each do |song|
        puts "#{song.artist.name}"
    end
  end

  def list_genres
    songs = Song.all
    songs.each do |song|
        puts "#{song.genre.name}"
    end
  end

  def play_song
    songs = Song.all
    puts "Which song from 1 to #{songs.count}?"
    play_list = gets.strip.to_i
    song = songs[play_list]
    if play_list.between?(1, songs.count)
      puts "\nPlaying #{song.artist.name} - #{song.name} - #{song.genre.name}"
    else
      puts "Not a valid option"
      play_song
    end
  end

  def artist_songs
    puts "What artist are you looking for?"
    artist_input = gets.chomp

    artist = Artist.find_by_name(artist_input)
    artist.songs.each do |song|
      puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def song_genres
    puts "What genre are you looking for?"
    genre_input = gets.chomp

    genre = Genre.find_by_name(genre_input)
    genre.songs.each do |song|
      puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
end
