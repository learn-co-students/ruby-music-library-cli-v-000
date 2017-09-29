class MusicLibraryController
  attr_accessor :path, :importer, :songs

  def initialize(path = './db/mp3s')
    @path = path
    @importer = MusicImporter.new(@path)
    @songs = @importer.files.map {|f| f[0...-4]}
    @importer.import
  end

  def call
    puts "Enter the following: list songs, list artists, list genres, play song, list artist, list genre, exit"
    input = gets.chomp
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
      artist_list
    when "list genre"
      genre_list
    when "exit"
      "Exiting..."
    else
      call
    end
  end

  def artist_list
    puts "Please type in an artist from the following: #{Artist.all.map {|a| a.name}.join(", ")}"
    artist = gets.chomp
    if Artist.all.any? {|a| a.name == artist}
      self.songs.each { |f| puts f if f.split(" - ")[0] == artist }
      call
    else
      puts "Not a valid choice."
      call
    end
  end

  def genre_list
    puts "Please type in a genre from the following: #{Genre.all.map {|g| g.name}.join(", ")}"
    genre = gets.chomp
    if Genre.all.any? {|g| g.name == genre}
      self.songs.each {|f| puts f if f.split(" - ")[2] == genre}
      call
    else
      puts "Not a valid choice."
      call
    end
  end


  def play_song
    puts "Select valid number between 1 to #{self.songs.count}"
    choice = gets.chomp.to_i
    if choice > self.songs.count || choice < 1
      puts "Not a valid choice."
      self.call
    else
      song = self.songs[choice-1]
      puts "Playing #{song}"
      call
    end
  end

  def list_songs
    self.songs.each_with_index {|f, i| puts "#{i+1}. #{f}" }
    call
  end

  def list_artists
    Artist.all.each {|artist| puts artist.name}
    call
  end

  def list_genres
    Genre.all.each {|genre| puts genre.name}
    call
  end


end
