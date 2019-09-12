class MusicLibraryController
  attr_accessor :path
  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(@path).import
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
    command = gets
    while command != "exit"
      if command == "list songs"
        return list_songs
      elsif command == "list artists"
        return list_artists
      elsif command == "list genres"
        return list_genres
      elsif command == "play song"
        return play_song
      elsif command == "list artist"
        return list_songs_by_artist
      elsif command == "list genre"
        return list_songs_by_genre
      else
        puts "What would you like to do?"
        command = gets
      end
    end
  end
  def list_songs
    a = Song.all.sort {|a, b| a.name <=> b.name}
    a.uniq!
    a_names = a.map {|x| x.name}
    a_artists = a.map {|x| x.artist.name}
    a_genres = a.map {|x| x.genre.name}
    a.each_with_index {|x, i| puts "#{i+1}. #{a_artists[i]} - #{a_names[i]} - #{a_genres[i]}"}
  end
  def list_artists
    a = Artist.all.sort {|a, b| a.name <=> b.name}
    b = a.map {|x| x.name}
    b.uniq!
    b.each_with_index {|x, i| puts "#{i+1}. #{x}"}
  end
  def list_genres
    a = Genre.all.map {|x| x.name}
    a.uniq!
    a.sort!
    a.each_with_index {|x, i| puts "#{i+1}. #{x}"}
  end
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    art_name = gets.strip
    a = Artist.find_by_name(art_name)
    if a
      a.songs.sort! {|a, b| a.name <=> b.name}
      a.songs.each_with_index {|x, i| puts "#{i+1}. #{x.name} - #{x.genre.name}"}
    end
    def list_songs_by_genre
      puts "Please enter the name of a genre:"
      gen_name = gets.strip
      a = Genre.find_by_name(gen_name)
      if a
        a.songs.sort! {|a, b| a.name <=> b.name}
        a.songs.each_with_index {|x, i| puts "#{i+1}. #{x.artist.name} - #{x.name}"}
      end
    end
    def play_song
      puts "Which song number would you like to play?"
      a = Song.all.sort {|a, b| a.name <=> b.name}
      a.uniq!
      s_names = a.map {|x| x.name}
      s_artists = a.map {|x| x.artist.name}
      s_num = gets.to_i
      s_quant = a.size
      if s_num > 1 && s_num <= s_quant
        s_num -= 1
        puts "Playing #{s_names[s_num]} by #{s_artists[s_num]}" if s_names[s_num]
      end
    end
  end
end
