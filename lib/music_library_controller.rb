class MusicLibraryController   

  
  def initialize(path = './db/mp3s')
     MusicImporter.new(path).import
  end
  
  def call
    input = ""
    while input != "exit"
      input = gets.strip
      case input
        when "list songs"
          songs
      end
    end
  end
  
  def songs
     #should look like 1. Action Bronson - Larry Csonka - indie
     # I need to iterate thru all of the songs and output per above with a numbered list
  end
 
end

