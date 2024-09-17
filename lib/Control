class MusicLibraryController
  attr_reader :path

  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
  end

  def music_cli_opts
    {
      'list songs' => :list_songs,
      'list artists' => :list_artists,
      'list genres' => :list_genres,
      'play song' => :play_song,
      'list artist' => :list_artist,
      'list genre' => :list_genre
    }
  end

  def welcome
    "
  ----------------------------
  Welcome to Music Library 🎵
  ----------------------------
    ".yellow
  end

  def help
    "  Commands:
    list songs - List all songs.
    list artists - List all artists.
    list genres - List all genres.
    play song - Play a single song (specify the song number).
    list artist - List songs of artist.
    list genre - List songs of certain genre.
    exit - Exit the Library.
    ".yellow
  end

  def call
    puts welcome
    puts help
    input = ''
    while input != 'exit'
      " ♯ ~ ".red.display
      input = gets.chomp
      if music_cli_opts.include? input
        send(music_cli_opts[input])
      elsif input.eql? 'exit'
        puts "Bye 👋".blue
      else
        puts help
      end
    end
  end

  def list_songs
    Song.all.each.with_index(1) do |song, index|
      puts "#{index}. #{song}".blue
    end
  end

  def list_artists
    puts [].tap { |result| Song.all.each { |x| result << x.artist } }.uniq
  end

  def list_genres
    puts [].tap { |result| Song.all.each { |x| result << x.genre } }.uniq
  end

  def play_song
    puts 'Please enter the song number.'.white.on_red
    song_no = gets.strip.to_i
    puts "🔊  Playing #{Song.all[song_no - 1]}".blue
  end

  def list_artist
    puts 'Please enter the artist name.'.white.on_red
    artist_name = gets.strip
    artist_ = Artist.find_by_name(artist_name)
    if artist_
      artist_.songs.each do |s|
        puts s.to_s.blue
      end
    else
      puts "🚷  Artist not found!".red
    end
  end

  def list_genre
    puts 'Please enter the genre.'.white.on_red
    genre_name = gets.strip
    genre_ = Genre.find_by_name(genre_name)
    if genre_
      genre_.songs.each do |s|
        puts s.to_s.blue
      end
    else
      puts "🚫  Genre not found!".red
    end
  end
end