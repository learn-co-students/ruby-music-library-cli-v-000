class MusicLibraryController
  
  def initialize(path="./db/mp3s")
    MusicImporter.new(path).import
  end
  
  def call
    user_input = ""
      while user_input != "exit"
        messages
        user_input = gets.strip
        case user_input
        when 'list songs';   list_songs
        when 'list artists'; list_artists
        when 'list genres';  list_genres
        when 'list artist';  list_songs_by_artist
        when 'list genre';   list_songs_by_genre
        when 'play song';    play_song
        end
      end
  end
  
  def messages
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
  end
  
  def compile_song_array
    Song.all.collect{|s| [s.artist.name, s.name, s.genre.name]}
  end
  
  def sort_by_artist
    Artist.all.collect{|a| a.name}.sort
  end
  
  def sort_by_genre
    Genre.all.collect{|g| g.name}.sort
  end
  
  def sort_by_song(arr=compile_song_array, neglect='')
    if neglect=='artist'
      arr.sort{|a,b| a[1]<=>b[1]}.collect{|a| [a[1],a[2]].join(" - ")}
    elsif neglect=='genre'
      arr.sort{|a,b| a[1]<=>b[1]}.collect{|a| [a[0],a[1]].join(" - ")}
    else
      arr.sort{|a,b| a[1]<=>b[1]}.collect{|a| a.join(" - ")}
    end
  end
  
  def list_artists
    sort_by_artist.each.with_index(1){|arr,i| puts "#{i}. #{arr}"}
  end
  
  def list_genres
    sort_by_genre.each.with_index(1){|arr,i| puts "#{i}. #{arr}"}
  end
  
  def list_songs
    sort_by_song.each.with_index(1){|arr,i| puts "#{i}. #{arr}"}
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name  = gets.strip
    artist_array = compile_song_array.select{|a| a[0]==artist_name}
    sort_by_song(artist_array,'artist').each.with_index(1){|arr,i| puts "#{i}. #{arr}"} if artist_array
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name  = gets.strip
    genre_array = compile_song_array.select{|a| a[2]==genre_name}
    sort_by_song(genre_array,'genre').each.with_index(1){|arr,i| puts "#{i}. #{arr}"} if genre_array
  end
  
  def play_song
    puts "Which song number would you like to play?"
    song_lib = sort_by_song(compile_song_array,'genre')
    song_num = gets.strip.to_i
    if song_num.between?(1,song_lib.size)
      a, s = song_lib[song_num-1].split(" - ")
      puts "Playing #{s} by #{a}"
    end
  end
  
end