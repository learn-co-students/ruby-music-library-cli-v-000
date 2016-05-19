
class MusicLibraryController
  def initialize(path="./db/mp3s")
    @path = path
    MusicImporter.new(@path).import
  end

  def call
    input = "whatever"
    while input != "exit"
      puts "welcome to music lib"
      puts "what can we do for ya?"
      input = gets.chomp
      case input
      when "list songs"
        songs
      when "list artists"
        artists
      when "list genres"
        genres
      when "list artist"
        list_artist
      when "list genre"
        list_genre
      when "play song"
        play_song
      end
    end
  end

  def songs
    Song.all.each_with_index {|song, number| puts "# #{number + 1} - #{song}"}
  end

  def artists
    Artist.all.each_with_index {|song, number| puts "# #{number + 1} - #{song}"}
  end

  def genres
    Genre.all.each_with_index {|song, number| puts "# #{number + 1} - #{song}"}
  end

  def list_artist
    puts "which artist's list would you like to view"
    input = gets.chomp
    if artist = Artist.find_by_name(input)
      artist.songs.each_with_index {|song, number| puts "# #{number + 1} - #{song}"}
    end
  end

  def list_genre
    puts "which genre's list would you like to view"
    input = gets.chomp
    if genre = Genre.find_by_name(input)
      genre.songs.each_with_index {|song, number| puts "# #{number + 1} - #{song}"}
    end
  end

  def play_song
    puts "which song would you like to play"
    input = gets.chomp
    puts "playing #{Song.all[input.to_i-1]}"
  end
end