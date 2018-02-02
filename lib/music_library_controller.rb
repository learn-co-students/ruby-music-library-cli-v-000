class MusicLibraryController
  def initialize(path='./db/mp3s')
    new_import = MusicImporter.new(path)
    new_import.import
  end

  def call
    input = ""
    until input == "exit"
      puts 'Welcome to your music library!'
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts 'What would you like to do?'
      input = gets.chomp
      case input.downcase
      when 'list songs'
        list_songs
      when 'list artists'
      list_artists
      when 'list genres'
        list_genres
      when 'list artist'
        list_songs_by_artist
      when 'list genre'
        list_songs_by_genre
      when 'play song'
        play_song
      end
    end
  end

  def list_songs
    Song.all.sort_by!(&:name)
    Song.all.each_with_index {|s, i| puts "#{i+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"}
  end

  def list_artists
    Artist.all.sort_by!(&:name)
    Artist.all.each_with_index {|a, i| puts "#{i+1}. #{a.name}"}
  end

  def list_genres
    Genre.all.sort_by!(&:name)
    Genre.all.each_with_index {|a, i| puts "#{i+1}. #{a.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    n=1
    Song.all.sort_by!(&:name)
    Song.all.each_with_index do |s, i|
      if s.artist.name == input
        puts "#{n}. #{s.name} - #{s.genre.name}"
        n+=1
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    n=1
    Song.all.sort_by!(&:name)
    Song.all.each do |s|
      if s.genre.name == input
        puts "#{n}. #{s.artist.name} - #{s.name}"
        n+=1
      end
    end
  end

  def play_song
    # list_songs
    puts "Which song number would you like to play?"
    Song.all.sort_by!(&:name)
    # list_songs
    input = gets.chomp
    song_number = input.to_i - 1
    if song_number > 0 && song_number < Song.all.count
      puts "Playing #{Song.all[song_number].name} by #{Song.all[song_number].artist.name}"
    else
      # play_song
    end
  end
end
