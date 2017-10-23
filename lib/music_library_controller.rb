class MusicLibraryController
  extend Concerns::Findable
  attr_reader :music_importer
  def initialize(path='./db/mp3s')
    @music_importer = MusicImporter.new(path)
    @music_importer.import
  end
  def call
    input = ""
    while input != "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      input = gets.strip
      case input
      when 'list songs'
        list_songs
      when 'list artists'
        list_artists
      when 'list genres'
        list_genres
      when 'list artist'
        list_songs_by_artist
      when 'list genre'
        list_songs_by_genre
      when 'play song'
        play_song
      end
    end
    # case input
    # when input != 'exit'
    #   binding.pry
    #   call
    # end
  end
  def list_songs
    files = self.files
    files_sorted = files.sort{|f1, f2|f1.split(" - ")[1] <=> f2.split(" - ")[1]}
    files_sorted.each_with_index do |f, i|
      puts "#{i + 1}. #{f.split(".")[0]}"
    end
  end
  def files
    self.music_importer.files
  end
  def list_artists
    sorted = Artist.all.collect{|artist|artist.name}.uniq.sort
    sorted.each_with_index{|a,i|puts "#{i+1}. #{a}"}
  end
  def list_genres
    sorted = Genre.all.collect{|genre|genre.name}.uniq.sort
    sorted.each_with_index{|g,i|puts "#{i+1}. #{g}"}
  end
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    artist = Artist.find_by_name(input)
    songs = artist.songs.sort{|s1, s2|s1.name <=> s2.name} if artist != nil
    if songs.kind_of?(Array)
      songs.each_with_index do |song, i|
        puts "#{i+1}. #{song.name} - #{song.genre.name}"
      end
    end
      # "Please enter the name of an artist:" #=> Real Estate
      # "1. Green Aisles - country"
      # "2. It's Real - hip-hop"
      # "3. Wonder Years - dream pop"
  end
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    genre = Genre.find_by_name(input)
    songs = genre.songs.sort{|s1, s2|s1.name <=> s2.name} if genre != nil
    if songs.kind_of?(Array)
      songs.each_with_index do |song, i|
        puts "#{i+1}. #{song.artist.name} - #{song.name}"
      end
    end
  end
  def play_song
    files = self.files
    puts "Which song number would you like to play?"
    input = gets.strip
    if input.to_i.between?(1,files.size)
      files_sorted = files.sort{|f1, f2|f1.split(" - ")[1] <=> f2.split(" - ")[1]}
      song_choice = files_sorted[input.to_i - 1]
      song = song_choice.split(" - ")[1]
      artist = song_choice.split(" - ")[0]
      puts "Playing #{song} by #{artist}"
    end
  end
end
