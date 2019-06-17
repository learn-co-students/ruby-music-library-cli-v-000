class MusicLibraryController
  def initialize(path="./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"

    loop do
      input = gets
      if input == "exit"
        break
      end

      case input
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "list artist"
        list_songs_by_artist
      when "list genre"
        list_songs_by_genre
      when "play song"
        play_song
      end
    end
  end

  def list_songs
    song_list = Song.all.sort do |a,b|
      if a.name < b.name
        -1
      elsif a.name > b.name
        1
      else
        0
      end
    end
        
    song_list.each.with_index(1) do |song, i|
      puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    artist_list = Artist.all.sort do |a,b|
      if a.name < b.name
        -1
      elsif a.name > b.name
        1
      else
        0
      end
    end

    artist_list.each.with_index(1) do |artist, i|
      puts "#{i}. #{artist.name}"
    end
  end

  def list_genres
    genre_list = Genre.all.sort do |a,b|
      if a.name < b.name
        -1
      elsif a.name > b.name
        1
      else
        0
      end
    end

    genre_list.each.with_index(1) do |genre, i|
      puts "#{i}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets
    artist = Artist.find_by_name(artist_name)
    if artist
      song_list = artist.songs.sort do |a,b|
        if a.name < b.name
          -1
        elsif a.name > b.name
          1
        else
          0
        end
      end
      song_list.each.with_index(1) do |song, i|
        puts "#{i}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets
    genre = Genre.find_by_name(genre_name)
    if genre
      song_list = genre.songs.sort do |a,b|
        if a.name < b.name
          -1
        elsif a.name > b.name
          1
        else
          0
        end
      end
      song_list.each.with_index(1) do |song, i|
        puts "#{i}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    song_list = Song.all.sort do |a,b|
      if a.name < b.name
        -1
      elsif a.name > b.name
        1
      else
        0
      end
    end

    puts "Which song number would you like to play?"
    song_number = gets.to_i
    if song_number > 0 && song_number <= song_list.size
      song = song_list[song_number - 1]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end

end