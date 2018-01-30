class MusicLibraryController

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    input = ""
    puts "*** Awesome Music Library v1.0 ***\n"

    until input == "exit"
      puts "What would you like to do?"
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
      else
        puts "Invalid command!"
      end
    end
  end

  def songs
    Song.all.sort_by {|s| [s.artist.name, s.name]}
  end

  def list_songs
    songs.each_with_index do |song, i|
      puts "#{i+1}. #{format_song(song)}"
    end
  end

  def list_artists
    Artist.all.sort_by {|artist| artist.name}.each { |artist| puts artist.name }
  end

  def list_genres
    Genre.all.sort_by {|genre| genre.name}.each { |genre| puts genre.name }
  end

  def play_song
    puts "What song do you want to play?"
    num = gets.strip.to_i
    puts "#Playing #{format_song(songs[num - 1])}"
  end

  def list_artist
    puts "Whose songs would you like to see?"
    input = gets.strip
    songs.each { |song| puts format_song(song) if song.artist.name == input }
  end

  def list_genre
    puts "What genre of songs would you like to see?"
    input = gets.strip
    songs.each { |song| puts format_song(song) if song.genre.name == input }
  end

  def format_song(song)
    "#{song.artist.name} - #{song.name} - #{song.genre.name}"
  end
end