class MusicLibraryController

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    option = ""
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    while option != "exit"
      option = gets.strip
      if option == "list songs"
        self.list_songs
      elsif option == "list artists"
        self.list_artists
      elsif option == "list genres"
        self.list_genres
      elsif option == "list artist"
        self.list_songs_by_artist
      elsif option == "list genre"
        self.list_songs_by_genre
      elsif option == "play song"
        self.play_song
      end
    end
  end

  def list_songs
     Song.all.sort_by!{|s| s.name}.each_with_index do |song, i|
       puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
     Artist.all.sort_by!{|a| a.name}.each_with_index do |artist, i|
       puts "#{i+1}. #{artist.name}"
    end
  end

  def list_genres
     Genre.all.sort_by!{|g| g.name}.each_with_index do |genre, i|
       puts "#{i+1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist = gets.strip
    artist = Artist.find_by_name(artist)
    if artist
      artist.songs.sort_by!{|s| s.name}.collect.with_index do |s, i|
        puts "#{i+1}. #{s.name} - #{s.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre = gets.strip
    genre = Genre.find_by_name(genre)
    if genre
      genre.songs.sort_by!{|s| s.name}.collect.with_index do |s, i|
        puts "#{i+1}. #{s.artist.name} - #{s.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    song_num = gets.strip.to_i - 1
    if song_num.between?(1, Song.all.count-1)
      puts "Playing #{Song.all.sort_by!{|s| s.name}[song_num].name} by #{Song.all.sort_by!{|s| s.name}[song_num].artist.name}"
    end
  end
end
