class MusicLibraryController

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    input = ""
    while input != "exit"
      puts "Welcome to Your Music Library!"
      puts "What would you like to do?"
      input = gets.strip
      case input
      when "list songs"
        songs
      when "list artists"
        artists
      when "list genres"
        genres
      when "play song"
        play_song
      when "list artist"
        artist
      when "list genre"
        genre
      end
    end
  end

  def songs
    Song.all.each.with_index(1) do |song, i|
      puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def artists
    Artist.all.each.with_index(1) do |artist, i|
      puts "#{i}. #{artist.name}"
    end
  end

  def genres
    Genre.all.each.with_index(1) do |genre, i|
      puts "#{i}. #{genre.name}"
    end
  end

  def artist
    puts "Which artist would you like to list the songs of?"
    artist_choice = gets.strip
    if artist = Artist.find_by_name(artist_choice)
      artist.songs.each.with_index(1) do |song, i|
        puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    # else
    #   puts "I'm sorry, I don't recognize that name. Please try again."
    #   artist
    end
  end

  def genre
    puts "Which genre would you like to list the songs of?"
    genre_choice = gets.strip
    if genre = Genre.find_by_name(genre_choice)
      genre.songs.each.with_index(1) do |song, i|
        puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    # else
    #   puts "I'm sorry, I don't recognize that genre. Please try again."
    #   genre
    end
  end

  def play_song
    puts "What song number would you like to play?"
    song_number = gets.strip
    song = Song.all[song_number.to_i-1]
    puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end
end


  ####solution####
  #   def initialize(path = "./db/mp3s")
  #     importer = MusicImporter.new(path)
  #     importer.import
  #   end
   #
  #   def call
  #    input = ""
  #    while input != "exit"
  #      puts "Welcome to Your Music Library!"
  #      puts "What would you like to do?"
  #      input = gets.strip
  #      case input
  #      when "list songs"
  #        songs
  #      when "list artists"
  #        artists
  #      when "list genres"
  #        genres
  #      when "list artist"
  #        list_artist
  #      when "list genre"
  #        list_genre
  #      when "play song"
  #        play_song
  #      end
  #    end
  #  end
   #
  #  def artists
  #    Artist.all.each.with_index(1) do |a, i|
  #      puts "#{i}. #{a}"
  #    end
  #  end
   #
  #  def genres
  #    Genre.all.each.with_index(1) do |g, i|
  #      puts "#{i}. #{g}"
  #    end
  #  end
   #
  #  def list_artist
  #    puts "What artist by name you like to list songs for?"
  #    artist_input = gets.strip
  #    if artist = Artist.find_by_name(artist_input)
  #      artist.songs.each do |s,i|
  #        puts "#{i}. #{s}"
  #      end
  #    end
  #  end
   #
  #  def list_genre
  #    puts "What genre by name you like to list songs for?"
  #    genre_input = gets.strip
  #    if genre = Genre.find_by_name(genre_input)
  #      genre.songs.each do |s,i|
  #        puts "#{i}. #{s}"
  #      end
  #    end
  #  end
   #
  #  def play_song
  #    puts "What song number would you like to play?"
  #    song_input = gets.strip
  #    puts "Playing #{Song.all[song_input.to_i-1]}"
  #  end
   #
  #  def songs
  #    Song.all.each.with_index(1) do |s, i|
  #      puts "#{i}. #{s}"
  #    end
  #  end
