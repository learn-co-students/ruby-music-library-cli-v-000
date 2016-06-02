
class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s") #MusicLibraryController
    @path = path
    #binding.pry
    MusicImporter.new(path).import
  end

  def call
    puts "Welcome to the music library"
    puts "Enter your desire next..."
    
    
      input = gets.chomp
      self.does_stuff(input) if input != "exit"
    
  end

  def does_stuff(input)
    while input != "exit" do
      
      if input == "list songs"
        i = 1
        Song.all.each do |song|
          puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
          i += 1
        end
      
      elsif input == "list artists"
      
        Song.all.each do |song| 
          puts "#{song.artist.name}"
        end

      elsif input == "list genres"
      
        Song.all.each do |song| 
          puts "#{song.genre.name}"
        end

      elsif input.include?("play song")
        Song.all.each do |song|
          puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end

      elsif input.include?("list artist")
        Song.all.each do |song|
          puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end

      elsif input.include?("list genre")
        Song.all.each do |song|
          puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end  

      end # of IF

      input = gets.chomp
    end #of DO loop
  end # of method

end #of CLASS