class MusicLibraryController

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    puts "Welcome to your CLI music library. Please enter a command"
    first_level_commands
  end

  def list_songs
    song_number = 0
    Song.all.collect do |song|
      puts "#{song_number += 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}" 
    end
  end

  def list_artists
    Artist.all.each{|artist| puts artist.name}
  end

  def list_genres
    Genre.all.each{|genre| puts genre.name}
  end

  def play_song
    puts "Choose a song number."
    input = gets.to_i
    if Song.all.count >= input
      input -= 1
      puts "Playing #{Song.all[input].artist.name} - #{Song.all[input].name} - #{Song.all[input].genre.name}"
    elsif Song.all.count < input
      puts "There is no song of that number. Here is a list of all song numbers."
      list_songs
      play_song
    end
  end

  def list_genre_songs(genre)
    puts "These are all the #{genre} songs:"
    Genre.find_by_name(genre).songs.each{|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_artist_songs(artist)
    puts "These are all the #{artist} songs:"
    Artist.find_by_name(artist).songs.each{|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def first_level_commands
    loop do
      input = gets.strip
      if input == "list songs"
        list_songs
      elsif input == "list artists"
        list_artists
      elsif input == "list genres"
        list_genres
      elsif input == "play song"
        play_song
      elsif Genre.find_by_name(input)
        list_genre_songs(input)
      elsif Artist.find_by_name(input)
        list_artist_songs(input)
      elsif input == "exit"
        break
      else
        puts "Invalid command, please try again."
      end
    end
  end

end
