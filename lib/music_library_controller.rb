class MusicLibraryController
  def initialize(path='./db/mp3s')
    MusicImporter.new(path).import
  end  
  def call
    input = nil
    while input != "exit"
    puts "Please enter one of the nubmers below or type 'exit' to quit"
    puts "1. List Songs"
    puts "2. List Artists"
    puts "3. List Genres"
    puts "4. Play Song"
    puts "5. List All of Artist's Songs"
    puts "6. List All Songs in a Genre"
    input = gets.chomp
    
      case input
      when "1"
        list_songs
      when "2" 
        list_artists
      when "3"
        list_genres
      when "4"
        play_song
      when "5"
        artist_songs
      when "6"
        genre_songs
      else
        puts "invalid input"
      end

    end
  end

  def list_songs
    Song.all.each.with_index(1) {|s, i|
    puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"}
  end
  def list_artists
    Artist.all.each { |artist| puts "#{artist.name}" }
  end
  def list_genres
    Genre.all.each { |genre| puts "#{genre.name}" }
  end
  def play_song
    puts "Pick a song"
    input = gets.chomp.to_i
    Song.all.each.with_index(1) do |s, i|
    puts"Playing #{s.artist.name} - #{s.name} - #{s.genre.name}" if i == input
    end
  end
  def artist_songs
    puts "Select an Artist"
    input = gets.chomp
    Song.all.each do |s|
      puts "#{s.artist.name} - #{s.name} - #{s.genre.name}" if s.artist.name == input
  end
end
  def genre_songs
    puts "Select a Genre"
    input = gets.chomp.downcase
    Song.all.each do |s|
      puts "#{s.artist.name} - #{s.name} - #{s.genre.name}" if s.genre.name == input
  end
  end
end


















