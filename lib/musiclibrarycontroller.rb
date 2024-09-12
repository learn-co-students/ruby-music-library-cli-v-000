class MusicLibraryController

  attr_accessor :path

  def initialize(path = './db/mp3s')
    @path = path
    MusicImporter.new(@path).import
  end

  def call
    input = nil
     until input == "exit"
        puts "Welcome to your music library!"
        puts "To list all of your songs, enter 'list songs'."
        puts "To list all of the artists in your library, enter 'list artists'."
        puts "To list all of the genres in your library, enter 'list genres'."
        puts "To list all of the songs by a particular artist, enter 'list artist'."
       puts "To list all of the songs of a particular genre, enter 'list genre'."
        puts "To play a song, enter 'play song'."
        puts "To quit, type 'exit'."
        puts "What would you like to do?"
      input = gets.strip

      case input
        when "list songs"
          list_songs
        when "list artists"
          list_artists
        when "list artist"
          list_songs_by_artist
        when "list genres"
          list_genres
        when "list genre"
          list_songs_by_genre
        when "play song"
          play_song
        end
      end
  end

  def list_songs
    song_list = Song.all.sort_by {|song| song.name}
    i = 0
    while i < song_list.length
    song_list.each do |song|
      puts "#{i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      i +=1
    end
  end
  end

  def list_artists
    artist_list = Artist.all.sort_by {|artist| artist.name}
    i = 0
    while i < artist_list.length
    artist_list.each do |artist|
      puts "#{i + 1}. #{artist.name}"
      i +=1
    end
  end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist = Artist.find_by_name(gets)

    if artist == nil
      nil
    else

    song_list = artist.songs.sort_by {|song| song.name}
    i = 0
    while i < song_list.length
    song_list.each do |song|
      puts "#{i + 1}. #{song.name} - #{song.genre.name}"
      i +=1
    end
  end
end
  end

  def list_genres
    genre_list = Genre.all.sort_by {|genre| genre.name}
    i = 0
    while i < genre_list.length
    genre_list.each do |genre|
      puts "#{i + 1}. #{genre.name}"
      i +=1
    end
  end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre = Genre.find_by_name(gets)

    if genre == nil
      nil
    else

    song_list = genre.songs.sort_by {|song| song.name}
    i = 0
    while i < song_list.length
    song_list.each do |song|
      puts "#{i + 1}. #{song.artist.name} - #{song.name}"
      i +=1
    end
  end
end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i

    song_list = Song.all.sort_by{|song| song.name}

    if (1...song_list.length).include?(input)
         puts "Playing #{song_list[input-1].name} by #{song_list[input-1].artist.name}"
     end

  end



end
