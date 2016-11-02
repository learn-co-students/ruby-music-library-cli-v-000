
class MusicLibraryController

  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import #where are the created objects stored?
  end

  def call
    input = ""

    while input != "exit"
      puts "Welcome to the Music Library"
      puts "What would you like to do?"
      input = gets.chomp

      if input == "list songs"
        Song.all.each_with_index {|song,index| puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
      elsif input == "list artists"
        Artist.all.each_with_index {|artist,index| puts "#{index + 1}. #{artist.name}"}
      elsif input == "list genres"
        Genre.all.each_with_index {|genre,index| puts "#{index + 1}. #{genre.name}"}
      elsif input == "list artist"
        puts "Enter Artist Name: "
        name = gets.chomp
        artist = Artist.all.detect {|artist| artist.name == name}
        artist.songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
        #it should only list songs for one artist -- needs artist name
      elsif input == "list genre"
        puts "Enter Genre Name: "
        name = gets.chomp
        genre = Genre.all.detect {|genre| genre.name == name}
        genre.songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
      elsif input == "play song"
        puts "Enter Song Number:"
        input = gets.chomp
        index = input.to_i - 1
        song = Song.all[index]
        puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end
end
