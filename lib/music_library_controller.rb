class MusicLibraryController

  def initialize(path = './db/mp3s')
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    input = ""
    puts "What's updog? You're in your music library."
    puts "Tell me what you want me to do, or enter 'options' for some suggestions."
    while input != "exit"
      input = gets.strip
      case input
        when "list songs"
          list_songs
        when "list artists"
          list_artists
        when "list genres"
          list_genres
        when "play song"
          play_song
        when "list artist"
          list_artist
        when "list genre"
          list_genre
        when "options"
          options
        when "exit"
          puts "Seeya"
      end
    end
  end

  def options
    puts "Your options are as follows:"
    puts "list songs"
    puts "list artists"
    puts "list genres "
    puts "play song"
    puts "list artist (lists all songs by a particular artist)"
    puts "list genre (lists all songs in a particular genre)"
    puts "options (this again??)"
    puts "exit"
    puts ""
    puts "Now what?"
  end

  def list_songs
    Song.all.each.with_index(1) {|song, i| puts "#{i}. #{song}"}
    puts ""
    puts "Now what?"
  end

  def list_artists
    Artist.all.each.with_index(1) {|artist, i| puts "#{i}. #{artist.name}"}
    puts ""
    puts "Now what?"
  end

  def list_genres
    Genre.all.each.with_index(1) {|genre, i| puts "#{i}. #{genre.name}"}
    puts ""
    puts "Now what?"
  end

  def play_song
    puts "Which song would you like to play? (1-99)"
    i = gets.strip
    i = i.to_i
    puts "Playing #{Song.all[i-1]}"
    puts ""
    puts "Now what?"
  end

  def list_artist
    puts "Which artist's songs do you want to list?"
    a = gets.strip
    if artist = Artist.find_by_name(a)
      artist.songs.each {|s,i| puts "#{i}. #{s}"}
    end
    puts ""
    puts "Now what?"
  end

  def list_genre
    puts "Which genre's songs do you want to list?"
    g = gets.strip
    if genre = Genre.find_by_name(g)
      genre.songs.each {|s,i| puts "#{i}. #{s}"}
    end
    puts ""
    puts "Now what?"
  end

end