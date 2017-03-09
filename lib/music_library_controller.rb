class MusicLibraryController
  attr_accessor :path, :importer
  def initialize(path_name = "./db/mp3s")
    @path = path_name
    @importer = MusicImporter.new(@path).import
  end
  def call
    input = ""
    until input == "exit"
      input = gets
       if input == "list songs"
         Song.all.each.with_index {|s, i| puts "#{i+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"}

       elsif input == "list artists"
         Artist.all.each{|a| puts a.name}
         
       elsif input == "list genres"
         Genre.all.each{|g| puts g.name}

       elsif input == "play song"
         i = gets
         s = Song.all[i.to_i - 1]
         puts "Playing #{s.artist.name} - #{s.name} - #{s.genre.name}"

       elsif input == "list artist"
         i = gets
         artist =  Artist.all.bsearch {|a| a.name == i}
         artist.songs.each{|s| puts "#{s.artist.name} - #{s.name} - #{s.genre.name}" }

       elsif input == "list genre"
         i = gets
         genre =  Genre.all.bsearch {|g| g.name == i}
         genre.songs.each{|s| puts "#{s.artist.name} - #{s.name} - #{s.genre.name}" }
       end

    end

  end
end
