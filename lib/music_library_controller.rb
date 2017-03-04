class MusicLibraryController
  attr_accessor :filenames

  def initialize(path = './db/mp3s')
    importer = MusicImporter.new(path)
    importer.import
    @filenames = importer.filenames.sort
  end

  def call
    input = ""
    until input == "exit"
      puts "Gimme some input:"
      input = gets.chomp
      case input
      when "list songs"
        self.filenames.each {|filename| puts "#{self.filenames.index(filename) + 1}. #{filename}"}
      when "list artists"
        Artist.all.each {|artist| puts "#{artist.name}"}
      when "list genres"
        Genre.all.each {|genre| puts "#{genre.name}"}
      when "play song"
        puts "Which song number?"
        song = gets.chomp.to_i
        puts "Playing #{filenames[song - 1]}"
      when "list artist"
        puts "Which artist?"
        name = gets.chomp
        artist = Artist.find_by_name(name)
        artist.songs.each do |song|
          puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      when "list genre"
        puts "Which genre?"
        name = gets.chomp
        genre = Genre.find_by_name(name)
        genre.songs.each do |song|
          puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      end
    end
  end
end
