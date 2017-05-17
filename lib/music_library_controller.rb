class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    input = ""

     while input != "exit"
      puts "Welcome To Your Music Library"
      puts "What Would You Like To Do"
    
      input = gets.strip
    
      case input
      when "list songs"
        Song.all.each{|song| puts "#{song.name}"}

      when "list artists"
        Artist.all.each{|artist| puts "#{artist.name}"}
      when "list genres"
        Genre.all.each{|genre| puts "#{genre.name}"}

      when "list artist"
        Artist.all.each do |a| 
          a.songs.each{|s| puts "#{s.artist.name} - #{s.name} - #{s.genre.name}" }
        end  

      when "list genre"
        Genre.all.each do |a| 
          a.songs.each{|s| puts "#{s.artist.name} - #{s.name} - #{s.genre.name}" }
        end

      end

    end
  end

end