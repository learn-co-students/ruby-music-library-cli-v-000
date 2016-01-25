class MusicLibraryController


  def initialize(path = "./db/mp3s")
    hold = MusicImporter.new(path)
    hold.import
  end

  def call
    input = gets.chomp
    while input != "exit"
      if input.downcase == "list songs"
        Song.all.each_with_index {|song, i|  puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
      end
      input = gets.chomp
    end
 end


end