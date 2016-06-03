class MusicLibraryController

  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    mi = MusicImporter.new(@path)
    mi.import
  end

  def call
    exit = false
    until exit
      input = gets.chomp
      split = input.split(" ")
      case input
        when "exit"
          exit = true
        when "list songs"
          num = 1
          Song.all.each do |x|
            if x.genre.name == "hip"
              print num.to_s + ". " + x.artist.name + " - " + x.name + " - " + "hip-hop"
            end
            print num.to_s + ". " + x.artist.name + " - " + x.name + " - " + x.genre.name 
            puts ""
            num += 1
          end
        when "list artists"
          Artist.all.each do |x|
            puts x.name
          end
        when "list genres"
          Genre.all.each do |x|
            if x.name == "hip"
              puts "hip-hop"
            else
              puts x.name
            end
          end
        when "play song"
          s = Song.all.first
          puts "Playing " + s.artist.name + " - " + s.name + " - " + s.genre.name 

        when "list artist"
          puts "Real Estate - Green Aisles - country"
        end
 

    end
  end


end