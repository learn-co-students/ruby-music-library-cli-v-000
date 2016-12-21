class MusicLibraryController
  
  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    input = nil
    until input == "exit"
      i = 1
      puts "What would you like me to do?"
      input = gets.strip
      case input
      when "list songs"
        Song.all.each do |s|
          puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
          i += 1
        end
      when "list artists"
        Artist.all.each do |a|
          puts "#{a.name}"
        end
      when "list genres"
        Genre.all.each do |g|
          puts "#{g.name}"
        end
      when "play song"
        puts "Enter the number of the song you would like me to play:"
        s = Song.all[gets.strip.to_i-1]
        puts "Playing #{s.artist.name} - #{s.name} - #{s.genre.name}"
      when "list artist"
        puts "Enter the name of the artist whose songs you would like me to list:"
        a = Artist.find_by_name(gets.strip)
        a.songs.each do |s|
          puts "#{s.artist.name} - #{s.name} - #{s.genre.name}"
        end
      when "list genre"
        puts "From which genre would you like me to list songs?"
        g = Genre.find_by_name(gets.strip)
        g.songs.each do |s|
          puts "#{s.artist.name} - #{s.name} - #{s.genre.name}"
        end
      end
    end
  end
end