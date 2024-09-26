class MusicLibraryController
  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
  end

  def call
    puts "What would you like to do?"
    input = gets.chomp

    case input
    when "list songs"
      songs
    when "list artists"
      artists
    when "list genres"
      genres
    when "play song"
      puts "What track number?"
      @number = gets.chomp.to_i-1
      song
    when "list artist"
      puts "Which artist?"
      @artist = gets.chomp
      artist_songs
    when "list genre"
      puts "Which genre?"
      @genre = gets.chomp
      genre_songs
    end

    self.call if input != "exit"
  end

  def songs
    Song.all.each_with_index{|s, index| puts "#{index+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"}
  end

  def artists
    Artist.all.each{|a| puts a.name}
  end

  def genres
    Genre.all.each{|g| puts g.name}
  end

  def song
    puts "Playing #{Song.all[@number].artist.name} - #{Song.all[@number].name} - #{Song.all[@number].genre.name}"
  end

  def artist_songs
    Song.all.each{|s| puts "#{s.artist.name} - #{s.name} - #{s.genre.name}" if s.artist.name == @artist}
  end

  def genre_songs
    Song.all.each{|s| puts "#{s.artist.name} - #{s.name} - #{s.genre.name}" if s.genre.name == @genre}
  end
end
