class MusicLibraryController
  attr_accessor :importer
  def initialize(path="./db/mp3s")
    @importer = MusicImporter.new(path)
    importer.import
  end

  def call
    puts "Yo! Welcome to this cool Music Library!"
    command = " "

    until command == "exit"
      puts "Type in one of the following commands:"
      puts "List Songs"
      puts "List Artists"
      puts "List Genres"
      puts "Play Song"
      puts "List Artist"
      puts "List Genre"
      command = gets.chomp.downcase
      case command

      when "list songs"
         Song.all.each_with_index{|song, index| 
         puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
      when "list artists"
        Artist.all.each{|artist| puts artist.name}
      when "list genres" 
        Genre.all.each{|genre| puts genre.name}
      when "play song"
        puts "Which song?"
        song = gets.chomp.to_i
        file_name = Song.all[song - 1]
        puts "Playing #{file_name.artist.name} - #{file_name.name} - #{file_name.genre.name}"
      when "list artist"
        puts "Which artist?"
        artist = gets.chomp
        artist = Artist.find_by_name(artist)
        artist.songs.each{|a| puts "#{artist.name} - #{a.name} - #{a.genre.name}"}
      when "list genre"
        puts "Which genre?"
        genre = gets.chomp
        genre = Genre.find_by_name(genre)
        genre.songs.each{|x| puts "#{x.artist.name} - #{x.name} - #{x.genre.name}"}
      end
    end
  end

end