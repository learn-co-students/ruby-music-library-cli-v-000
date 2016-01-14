class MusicLibraryController
  attr_accessor :music_importer, :input
  def initialize(filepath='./db/mp3s')
    @music_importer = MusicImporter.new(filepath)
    @music_importer.import
    # puts "Welcome to the Music Library CLI"
    # puts "Enter @input:"
  end

  def call
    @input = nil 
    while @input != "exit"
      @input = gets.chomp.downcase
      options
    end
    @input
  end

  def options
    if @input == "list songs"
      list_songs
    elsif @input == "list artists"
      list_artists
    elsif @input == "list genres"
      list_genres
    elsif @input == "play song"
      play
    elsif @input == "list artist"
      list_artist
    elsif @input == "list genre"
      list_genre
    end
  end

  def list_songs
    # binding.pry
    @music_importer.files.each.with_index(1) do |string,index|
      string = string.gsub(/.mp3/,'')
      puts "#{index}. #{string}"
    end
  end

  def list_artists
      Artist.all.each.with_index(1) do |artist,index|
        puts "#{index}. #{artist.name}"
      end
      @input = gets.chomp.downcase
  end

  def list_genres
    Genre.all.each.with_index(1) do |genre,index|
      puts "#{index}. #{genre.name}"
    end
  end

  def play
    # binding.pry
    while @input != "exit"
      # binding.pry
      inp = inp.to_i
      puts "Playing #{music_importer.files[inp].gsub(/.mp3/,'')}"
      @input = gets.chomp.downcase
    end
  end

  def list_artist
    @input = gets.chomp
    list_artist_songs
  end

  def list_artist_songs
    art = @input
    # art = art.split.map(&:capitalize).join(' ')
    temp = Artist.find_by_name(art)
    temp.songs.each.with_index(1) do |song,index|
      puts "#{index}. #{temp.name} - #{song.name} - #{temp.songs[index-1].genre.name}"
    end
  end

  def list_genre
    @input = gets.chomp
    list_genre_songs
  end

  def list_genre_songs
    genre = @input
    # art = art.split.map(&:capitalize).join(' ')
    temp = Genre.find_by_name(genre)
    temp.songs.each.with_index(1) do |song,index|
      puts "- #{temp.songs[index - 1].artist.name} - #{song.name} - #{genre}"
    end
  end
end