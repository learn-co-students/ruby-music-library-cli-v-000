class MusicLibraryController

  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    input = ""
    while input != "exit"      
      input = gets.strip
      
      case input
      when "list songs"
        Song.all.each_with_index do |song, index|
          puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      when "list artists"
        Artist.all.each {|artist| puts artist.name}
      when "list genres"
        Genre.all.each {|genre| puts genre.name}
      when "play song"
        puts "Enter a song number."
        i = gets.strip.to_i
        song = Song.all[i-1]
        puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
      when "list artist"
        puts "Enter an artist."
        artist = gets.strip
        Song.all.each do |song| 
          puts "#{song.artist.name} - #{song.name} - #{song.genre.name}" if song.artist.name == artist
        end
      when "list genre"
        puts "Enter a genre."
        genre = gets.strip
        Song.all.each do |song| 
          puts "#{song.artist.name} - #{song.name} - #{song.genre.name}" if song.genre.name == genre
        end
      end 

    end        
  end

end