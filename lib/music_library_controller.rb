
class MusicLibraryController

  def initialize(path = "./db/mp3s")
    @path = path
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    input = ""
    while input != "exit"
      puts "Welcome to Music Library!"
      puts "What would you like to do?"
      input = gets.strip
      case input
      when "list songs"
        songs
      when "list artists"
        artists
      when "list genres"
        genres
      when "play song"
        play_song
      when "list artist"
        list_songs
      when "list genre"
        list_genres_songs
      end
    end
  end

  def songs
    Song.sort_all_alphabet.each.with_index(1) do |song, index|
      puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def artists
    Artist.all.each.with_index(1) do |a, i|
      puts "#{i}. #{a.name}"
    end
  end

  def genres
    Genre.all.each.with_index(1) do |g, i|
      puts "#{i}. #{g.name}"
    end
  end

  def play_song
    puts "What song number would you like to play?"
    song_input = gets.strip
    song = Song.sort_all_alphabet[song_input.to_i-1]
    puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end

  def list_songs
    puts "Which artist would you like to list the songs of?"
    artist_input = gets.strip
    if artist = Artist.find_by_name(artist_input)
      artist.songs.each do |s,i|
        puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
      end
    end
  end

  def list_genres_songs
    puts "Which genre would you like to list the songs of?"
    genre_input = gets.strip
      if genre = Genre.find_by_name(genre_input)
        genre.songs.each do |s,i|
          puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
        end
      end
  end

end
