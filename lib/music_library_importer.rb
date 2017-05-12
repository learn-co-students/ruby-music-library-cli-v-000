class MusicLibraryController

  attr_accessor :path

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    input = ""
    until input == "exit"
      puts "Please select one of the follow:"
      puts "     1 - List Songs"
      puts "     2 - List Artists"
      puts "     3 - List Genres"
      puts "     4 - Play Song"
      puts "     5 - List an Artist's Songs"
      puts "     6 - List a Genre's Songs"
      puts "     exit"
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
        artists_songs
      when "list genre"
        genres_songs
      end
    end
  end

  def list_songs
    Song.sort_by_artists_name.each.with_index do |song, index|
       puts "#{index + 1}. #{song.print}"
     end
  end

  def list_artists
    Artist.all.each {|artist| puts "#{artist.name}"}
  end

  def list_genres
    Genre.all.each {|genre| puts "#{genre.name}"}
  end

  def play_song
    puts "Which song?"
    user_input = gets.strip
    song = Song.all[user_input.to_i - 1]
    puts "Playing #{song.print}"
  end

  def artists_songs
    puts "Which artist?"
    user_input = gets.strip
    if artist = Artist.find_by_name(user_input)
      artist.songs.each.with_index do |song, index|
        puts "#{index + 1}. #{song.print}"
      end
    end
  end

  def genres_songs
    puts "Which genre?"
    user_input = gets.strip
    if genre = Genre.find_by_name(user_input)
      genre.songs.each.with_index do |song, index|
        puts "#{index + 1}. #{song.print}"
      end
    end
  end

end
