class MusicLibraryController
  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    puts "Initializing Music Library"
    puts "Select an Option"
    reply = nil
    until reply == "exit"
      reply= gets.strip
      case reply
      when "list songs"
        Song.list_songs.each_with_index do |info, index|
          puts "#{index + 1}. #{info} "
        end
      when "list artists"
        Artist.all.each {|artist| puts artist.name}
      when "list genres"
        Genre.all.each {|genre| puts genre.name}
      when "play song"
        puts "Select song by track number"
        track = gets.strip.to_i - 1
        info = Song.list_songs[track]
        puts "Playing #{info}"
      when "list artist"
        puts "Select Artist's song"
        name = gets.strip
        artist = Artist.find_by_name(name)
        artist.songs.each_with_index do |song, index|
          puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      when "list genre"
        puts "Select Genre's song"
        name = gets.strip
        genre = Genre.find_by_name(name)
        genre.songs.each_with_index do |song, index|
          puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      end
    end
  end
end
