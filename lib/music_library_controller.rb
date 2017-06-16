class MusicLibraryController
  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    puts "Please enter your input"
    input = gets.chomp
    if input == "list songs"
      Song.all.each_with_index{|song, index| puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
    end
    if input == "list artists"
      Artist.all.each{|artist| puts "#{artist.name}"}
    end
    if input == "list genres"
      Genre.all.each{|genre| puts genre.name}
    end
    if input.to_i.class == Fixnum && input.to_i != 0
      song = Song.all[input.to_i-1]
      puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
    if Artist.all.detect{|artist| artist.name == input }
      songs = Song.all.select{|song| song.artist.name == input}
      songs.each{|song| puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"}
    end
    self.call if input != "exit"
  end
end
