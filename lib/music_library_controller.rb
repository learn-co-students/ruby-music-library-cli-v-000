class MusicLibraryController
  attr_reader :song_list

  def initialize(file_path = './db/mp3s')
    music_importer = MusicImporter.new(file_path)
    music_importer.import
    @song_list = Song.all
  end

  def call
    input = nil

    until input == "exit"
      puts "What would you like to do?"

      display_options
      input = gets.chomp

      valid_input.fetch(input) do |bad_input|
        -> { puts "#{bad_input} is not valid. Please try again." }
      end.call
    end
  end

  protected
  def sort_by_artist
    song_list.sort_by do |song|
      "#{song.artist.name} #{song.name}"
    end
  end

  def song_format(song)
    "#{song.artist.name} - #{song.name} - #{song.genre.name}"
  end

  def list_songs
    counter = 0

    sort_by_artist.each do |song|
      counter += 1
      puts "#{counter}. #{song_format(song)}"
    end
  end

  def list_(x)
    xs = sort_by_artist.map do |song|
      song.__send__(x).name
    end

    xs.uniq.each { |i| puts i }
  end

  def list_match_(x, input)
    sort_by_artist.each do |song|
      if song.__send__(x).name == input
        puts "#{song_format(song)}"
      end
    end
  end

  def play_song
    puts "Enter a number."
    input = gets.chomp.to_i

    unless input == 0
      song = sort_by_artist.fetch(input - 1) do |bad_input|
        puts "There's no song with that number."
        play_song
      end
      puts "Playing #{song_format(song)}" unless song.nil?
    else
      puts "Let's try that again."
      play_song
    end
  end

  def list_artist
    list_('artist').uniq.each { |artist| puts artist }
    puts "Choose an artist."
    input = gets.chomp
    list_match_('artist', input)
  end

  def list_genre
    list_('genre')
    puts "Choose a genre."
    input = gets.chomp
    list_match_('genre', input)
  end

  def display_options
    options = ["list songs","list artists", "list genres", "play song",
    "list artist", "list genre", "exit"]

    options.each { |option| puts option }
  end

  def valid_input
    valid_input = {
        "list songs"   => ->{ list_songs },
        "list artists" => ->{ list_'artist' },
        "list genres"  => ->{ list_'genre' },
        "play song"    => ->{ list_songs; play_song },
        "list artist"  => ->{ list_artist },
        "list genre"   => ->{ list_genre },
        "exit"         => ->{ puts "Goodbye!"}}
    valid_input
  end
end
