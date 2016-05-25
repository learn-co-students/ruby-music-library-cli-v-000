class MusicLibraryController

  attr_accessor :path, :music_importer

  def initialize(path = "./db/mp3s")
    @path = path
    @music_importer = MusicImporter.new(path)
    @music_importer.import
    @music_importer
  end



  def call
    MusicLibraryController.new
    input = nil
    while input != "exit"
    "What would you like to do? songs, artists, genres, or exit?"
    input = gets.strip
     if input == "list songs"
       Song.all.sort_by {|song| song.artist.name}.each_with_index {|song, index| puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
#       Song.all.each {|song| puts song.name}
     elsif input == "list artists"
       Artist.all.each {|artist| puts artist.name}
     elsif input == "list genres"
       Genre.all.each {|genre| puts genre.name}
     else
      "What would you like to do? songs, artists, genres, or exit?"
     end
   end
  end

end
