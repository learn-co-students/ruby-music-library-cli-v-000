class MusicLibraryController

  def initialize(path='./db/mp3s')
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
    user_input = gets.chomp
    while user_input != "exit"
      if user_input == "list songs"
        list_songs
      elsif user_input == "list artists"
        list_artists
      elsif user_input == "list genres"
        list_genres
      elsif user_input == "play song"
        play_song
      elsif user_input == "list artist"
        list_songs_by_artist
      elsif user_input == "list genre"
        list_songs_by_genre
      end
      user_input = gets
    end
  end

  def list_songs
    sorted_list=Song.all.sort_by {|song| song.name }
    sorted_list.each_with_index{|song, index| puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_artists
    sorted_list=Artist.all.sort_by {|artist| artist.name }
    sorted_list.each_with_index{|artist, index| puts "#{index+1}. #{artist.name}"}
  end

  def list_genres
    sorted_list=Genre.all.sort_by {|genre| genre.name }
    sorted_list.each_with_index{|genre, index| puts "#{index+1}. #{genre.name}"}
  end

  def play_song
    puts "Which song number would you like to play?"
    user_input = gets.to_i
    if user_input.between?(1, Song.all.length)
        song=Song.all.sort{|x, y| x.name<=>y.name}[user_input-1]
        puts "Playing #{song.name} by #{song.artist.name}"
      end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_input=gets.chomp
    if artist=Artist.find_by_name(user_input)
      artist.songs.sort{|x, y| x.name<=>y.name}.each_with_index{|song, index| puts "#{index+1}. #{song.name} - #{song.genre.name}" }
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_input=gets.chomp
    if genre=Genre.find_by_name(user_input)
      genre.songs.sort{|x, y| x.name<=> y.name}.each_with_index{|song, index| puts "#{index+1}. #{song.artist.name} - #{song.name}" }
    end
  end

end
