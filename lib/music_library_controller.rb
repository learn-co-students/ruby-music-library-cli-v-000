class MusicLibraryController
  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
  end

  def call
    puts "What would you like to do?"
    input = gets.chomp

    case input
    when "list songs"
      Song.all.each_with_index{|s, index| puts "#{index+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"}
    when "list artists"
      Artist.all.each{|a| puts a.name}
    when "list genres"
      Genre.all.each{|g| puts g.name}
    when "play song"
      puts "What track number?"
      number = gets.chomp.to_i-1
      puts "Playing #{Song.all[number].artist.name} - #{Song.all[number].name} - #{Song.all[number].genre.name}"
    when "list artist"
      puts "Which artist?"
      artist = gets.chomp
      Song.all.each{|s| puts "#{s.artist.name} - #{s.name} - #{s.genre.name}" if s.artist.name == artist}
    when "list genre"
      puts "Which genre?"
      genre = gets.chomp
      Song.all.each{|s| puts "#{s.artist.name} - #{s.name} - #{s.genre.name}" if s.genre.name == genre}
    end

    self.call if input != "exit"
  end

end
