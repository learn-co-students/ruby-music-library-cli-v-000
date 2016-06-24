class MusicLibraryController

  attr_accessor :path, :files

  @@all = []

  def initialize(path = "./db/mp3s")
    files = MusicImporter.new(path).import
    @@all << files 
    @files = files 
  end

  def MusicLibraryController.all 
    @@all
  end


  def call      
    input = ""

    while input != "exit"
      puts "Welcome to Your Music Library!"
      puts "What would you like to do? - type 'list songs, list artists, list genres, play song, or list artist'"

      input = gets.chomp

      case input 
        when "list songs"
          puts songs
        when "list artists"
          puts artists
        when "list genres"
          puts genres
        when "play song"
          puts play_song
        when "list artist"
          puts artists
        when "list genre"
          puts genres
        end # case 

    end # while 


  end  # def call 
    

    def songs
      i = 0 
      index = 1 

      while i < files.length
        files[i] = "#{index}. " + "#{files[i]}"
        index += 1
        i += 1  
      end
        files 
    end
    
    def artists
      MusicLibraryController.all.each do |artist|
        puts "#{artist}"
      end
    end

    def genres
      MusicLibraryController.all.each do |genres|
        puts "#{genres}"
      end
    end

    def play_song
      i = 0
      while i < files.length
        files[i] = "Playing " + "#{files[i]}"
        i += 1  
      end
      files
    end


end
