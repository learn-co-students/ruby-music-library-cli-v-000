class MusicLibraryController

  def initialize(path = "./db/mp3s")
    @path = path
    @music = []
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    input = ""
    while input != "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"

    input = gets.chomp

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
    num = 0
    s = Song.all.sort_by {|song| song.name}
    s.map do |song|
    puts "#{num +=1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end



  def list_artists
    num = 0
    a = Artist.all.sort_by {|artist| artist.name}.each do |artist|
     puts "#{num +=1}. #{artist.name}"
    end
  end

  def list_genres
    num = 0
    g = Genre.all.sort_by {|genre| genre.name}
    g.each do |genre|
      puts "#{num +=1}. #{genre.name}"
    end
  end


  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    a = Artist.find_by_name(input)
      if a
      a.songs.sort_by {|s| s.name}.each_with_index do |song, index|
      puts "#{index +1}. #{song.name} - #{song.genre.name}"
      end
    end
  end


  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    g = Genre.find_by_name(input)
    if g
      g.songs.sort_by {|s| s.name}.each_with_index do |song, index|
      puts "#{index +1}. #{song.artist.name} - #{song.name}"
    end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.chomp
    input = input.to_i
    count = Song.all.count
    if input <= count && input > 1
      a = Song.all.sort_by {|song| song.name}.each {|song|}
      puts "Playing #{a[input -1].name} by #{a[input -1].artist.name}"
    end
  end

end
