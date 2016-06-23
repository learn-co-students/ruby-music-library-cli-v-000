class MusicLibraryController

  attr_accessor :path, :files

  def initialize(path = "./db/mp3s")
    files = MusicImporter.new(path).import
    @files = files 
  end

  def number_files(files)
    i = 0 
    index = 1 

    while i < files.length
      files[i] = "#{index}. " + "#{files[i]}"
      index += 1
      i += 1  
    end
    files 
  end

  def play_files(files)
    items = number_files(files).each do |file|
      file.gsub!(/[1.]/, "Playing")
    end
    items
  end

  def call      
    puts number_files(files)
    puts play_files(files)
    
    while true 
      input = gets.chomp

      case input 
        when "exit"
          break
        end
     end

  end



end