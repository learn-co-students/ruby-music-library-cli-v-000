class MusicLibraryController

  def initialize(path='./db/mp3s')
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    input = ''
    while input != 'exit'
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"


      input = gets.strip
      if input == "list songs"
        list_songs
      elsif input == "list artists"
        list_artists
      elsif input == "list genres"
        list_genres
      elsif input == "list artist"
        list_songs_by_artist
      elsif input == "list genre"
        list_songs_by_genre
      elsif input == "play song"
        play_song
      end
    end
  end

  def list_songs
    sort = Song.all.sort_by {|s| s.name}
    sorted = sort.collect {|s| "#{s.artist.name} - #{s.name} - #{s.genre.name}"}
    sorted.each {|list| puts "#{sorted.index(list)+1}. #{list}"}
  end

  def list_artists
    sort = Artist.all.sort_by {|a| a.name}
    sorted = sort.collect {|a| a.name}
    sorted.each {|list| puts "#{sorted.index(list)+1}. #{list}"}
  end

  def list_genres
    sort = Genre.all.sort_by {|g| g.name}
    sorted = sort.collect {|g| g.name}
    sorted.each {|list| puts "#{sorted.index(list)+1}. #{list}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets
    songs = Song.all.select {|song| song.artist.name == input}.sort_by {|s| s.name}
    songs.each {|s| puts "#{songs.index(s)+1}. #{s.name} - #{s.genre.name}"}
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets
    genres = Song.all.select {|song| song.genre.name == input}.sort_by {|s| s.name}
    genres.each {|s| puts "#{genres.index(s)+1}. #{s.artist.name} - #{s.name}"}
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.to_i
    if input < Song.all.length && input > 0
      songs = Song.all.sort_by {|s| s.name}
      puts "Playing #{songs[input-1].name} by #{songs[input-1].artist.name}"
    else
      gets
    end
  end
end
