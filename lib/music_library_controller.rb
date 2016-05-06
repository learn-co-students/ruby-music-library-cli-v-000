class MusicLibraryController
  attr_reader :path

  def initialize(path="./db/mp3s")
    @path = MusicImporter.new(path).import
  end

  def call
    input = gets

    while input != "exit"

      counter = 1
      playlist = Song.all.collect do |s|
        puts "#{counter}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
        counter += 1
      end

      if input == "list songs"
        playlist.each do |s|
          puts s
        end
      elsif input == "list artists"
        Artist.all.each do |a|
          puts a.name
        end
      elsif input == "list genres"
        Genre.all.each do |g|
          puts g.name
        end
      else 
        s = Song.all[0]
        puts "Playing #{s.artist.name} - #{s.name} - #{s.genre.name}"
      end
      input = gets
    end
  end
end