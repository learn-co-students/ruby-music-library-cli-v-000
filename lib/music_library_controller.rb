class MusicLibraryController
  attr_accessor :path
  def initialize(path="./db/mp3s")
    self.path = path
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    puts "Hi! Welcome to your computer's Music Library!"
     input = " "

    until input == "exit"
      puts "Type in one of the following commands:"
      puts "List Songs"
      puts "List Artists"
      puts "List Genres"
      puts "Play Song"
      puts "List Artist"
      puts "List Genre"
      input = gets.strip
      case input

      when "list songs"
        Song.all.each.with_index(1){ |song, index|
           puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
      when "list artists"
        Artist.all.each{|artist| puts artist.name}
      when "list genres" 
        Genre.all.each{|genre| puts genre.name}
      when "play song"
        puts "What song?"
        song = gets.strip.to_i
        file_name = Song.all[song-1]
        puts "Playing #{file_name.artist.name} - #{file_name.name} - #{file_name.genre.name}"
      when "list artist"
        puts "What artist?"
        artist = gets.strip
        artist = Artist.find_by_name(artist)
        artist.songs.each{|a| puts "#{artist.name} - #{a.name} - #{a.genre.name}"}
      when "list genre"
        puts "What genre?"
        genre = gets.strip
        genre = Genre.find_by_name(genre)
        genre.songs.each{|g| puts "#{g.artist.name} - #{g.name} - #{g.genre.name}"}
      end
    end
  end

end