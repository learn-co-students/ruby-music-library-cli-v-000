class MusicLibraryController
  attr_accessor :importer
  def initialize(path="./db/mp3s")
    @importer = MusicImporter.new(path)
    importer.import
  end

  def call
    puts "Please enter a command!"
    command = " "

    until command == "exit"
      "What would you like to do?"
      command = gets.strip
      case command

      when "list songs"
         Song.all.each_with_index{|song, i| 
         puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
      when "list artists"
        Artist.all.each{|artist| puts artist.name}
      when "list genres" 
        Genre.all.each{|genre| puts genre.name}
      when "play song"
        song = gets
        song = song.to_i
        file_name = Song.all[song - 1]
        puts "Playing #{file_name.artist.name} - #{file_name.name} - #{file_name.genre.name}"


      when "list artist"
        artist = gets
        artist = Artist.find_by_name(artist)
        artist.songs.each{|a| puts "#{artist.name} - #{a.name} - #{a.genre.name}"}
      when "list genre"
        genre = gets
        genre = Genre.find_by_name(genre)
        genre.songs.each{|x| puts "#{x.artist.name} - #{x.name} - #{x.genre.name}"}
      end
    end
  end

end