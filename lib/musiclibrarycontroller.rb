class MusicLibraryController

  def initialize(path = './db/mp3s')
    @path = path
    MusicImporter.new(path).import
  end

  def call
    input = ""
    while input != "exit"
      puts "What say we do?"
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
      end
    end
  end

  def list_songs
    Song.all.each.with_index {|s, i| puts "#{i + 1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"}
  end

  def list_artists
    Artist.all.each {|artist| puts "#{artist.name}"}
  end

  def list_genres
    Genre.all.each {|genre| puts "#{genre.name}"}
  end

  def play_song
    puts "What song should i play?"
    song_number = gets.strip
    Song.all.each.with_index do |s, i|
      if i == song_number.to_i - 1
        puts "Playing #{s.artist.name} - #{s.name} - #{s.genre.name}"
      end
    end
  end

  def list_artist
    puts "artist?"
    artist = gets.strip
    Artist.find_by_name(artist).songs.each {|s| puts "#{s.artist.name} - #{s.name} - #{s.genre.name}"}
  end

  def list_genre
    puts "genre?"
    genre = gets.strip
    Genre.find_by_name(genre).songs.each {|s| puts "#{s.artist.name} - #{s.name} - #{s.genre.name}"}
  end

end
