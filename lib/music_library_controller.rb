class MusicLibraryController
  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
  end

  def call
    help
    loop do
      puts "Please enter a command:"
      input = gets.chomp
      case input
      when "help"
        help
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "play song"
        play_song
      when "list artist"
        list(:artist)
      when "list genre"
        list(:genre)
      when "exit"
        exit_music_library
        break
      end
    end
  end

  def exit_music_library
    puts "Goodbye"
  end

  def help
    puts %q(I accept the following commands:
  - list songs   : displays a list of songs
  - list artists : displays a list of artists
  - list genres  : displays a list of genres
  - play song    : plays a song you choose
  - list artist  : displays the songs of an artist you choose
  - list genre   : displays the songs of a genre you choose)
  end

  def display_song(song)
    "#{song.artist.name} - #{song.name} - #{song.genre.name}"
  end

  def list_songs
    Song.all.each_with_index do |song, index|
      puts "#{index + 1}. " + display_song(song)
    end
  end

  def list_artists
    Artist.all.each { |artist| puts artist.name }
  end

  def list_genres
    Genre.all.each { |genre| puts genre.name }
  end

  def list(type)
    puts "Please enter #{type.to_s}:"
    input = gets.chomp
    if type == :artist
      object = Artist.find_by_name(input)
    elsif type == :genre
      object = Genre.find_by_name(input)
    else
      object = nil
    end

    if object
      object.songs.each { |song| puts display_song(song) }
    else
      puts "Invalid input, please try again"
    end
  end

  def play_song
    puts "Please enter song number:"
    input = gets.chomp.to_i
    if (1..Song.all.count).include?(input)
      song = Song.all[input - 1]
      puts "Playing " + display_song(song)
    else
      puts "Invalid input, please try again"
    end
  end

end