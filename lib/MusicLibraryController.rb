class MusicLibraryController

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    input= nil
    until input == "exit" do
      input = gets.strip
      if input == "list songs"
        Song.all.each.with_index(1) {|names, index| puts "#{index}. #{names.artist.name} - #{names.name} - #{names.genre.name}"}
      elsif input =="list artists"
        Artist.all.each {|wah| puts"#{wah.name}"}
      elsif input == "list genres"
        Genre.all.each{|guy| puts"#{guy.name}"}
      elsif input == "play song"
        Song.all.each {|wow| puts "Playing #{wow.artist.name} - #{wow.name} - #{wow.genre.name}"}
      elsif input == "list artist"
        artist = gets.chomp
        arr = Artist.find_by_name(artist)
        arr.songs.each {|why| puts "#{why.artist.name} - #{why.name} - #{why.genre.name}"}

      elsif input == "list genre"
          gen = gets.chomp
          arry = Genre.find_by_name(gen)
          arry.songs.each {|yo| puts "#{yo.artist.name} - #{yo.name} - #{yo.genre.name}"}
                
      end
      break if input == "exit"
      
    end
  end
end


