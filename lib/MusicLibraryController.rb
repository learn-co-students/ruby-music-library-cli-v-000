class MusicLibraryController

  def initialize(path='./db/mp3s')
    importer= MusicImporter.new(path)
    importer.import
  end

  def call
    input = ""
    puts "What do you want to do?"
    while input !="exit"
    input = gets.strip
    case input
    when "list songs"
      songs
    end
  end
end

  def songs
    Song.all.each_with_index do |son, ind| puts "#{ind}. #{son.artist.name} - #{son.name} - #{son.genre.name}"
    end
end

end
