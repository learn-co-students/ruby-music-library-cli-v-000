class MusicLibraryController

  def initialize(path="./db/mp3s")
    music_importer = MusicImporter.new(path)
    @music_importer =  music_importer.import
  end

  def call
    input = nil
  while input != "exit"
      puts "Welcome! Choose an option to play or type 'exit' to cancel."
      puts "1. #{@music_importer[0].gsub(/\.[^.]*$/,"")}" #regex to remove the extention
      puts "2. #{@music_importer[1].gsub(/\.[^.]*$/,"")}"
      puts "3. #{@music_importer[2].gsub(/\.[^.]*$/,"")}"
      puts "4. #{@music_importer[3].gsub(/\.[^.]*$/,"")}"
      input = gets.chomp.downcase
      case input
      when  "exit"
          break
        when  "1"
          puts  "Playing #{@music_importer[0].gsub(/\.[^.]*$/,"")}"
        when  "2"
          puts   "Playing #{@music_importer[1].gsub(/\.[^.]*$/,"")}"
        when  "3"
          puts  "Playing #{@music_importer[2].gsub(/\.[^.]*$/,"")}"
        when  "4"
          puts  "Playing #{@music_importer[3].gsub(/\.[^.]*$/,"")}"
      end
    end

  end

end
