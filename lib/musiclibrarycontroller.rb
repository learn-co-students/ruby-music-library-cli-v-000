class MusicLibraryController

  attr_accessor :path, :music_importer, :call

  def initialize(path = './db/mp3s')
    @path = path
    @music_importer = MusicImporter.new(@path)
    @music_importer.import
  end

  def call
    input = nil
    until input == "exit"
      puts "Please enter input:"
      input = gets
      if input == "list songs"
        index = 1
        Song.all.each do |song|
          puts index.to_s + ". " + song.artist.name + " - " + song.name + " - " + song.genre.name
          index += 1
        end
      elsif input == "list artists"
        Song.all.each do |song|
          puts song.artist.name
        end
      elsif input == "list genres"
        Song.all.each do |song|
          puts song.genre.name
        end
      elsif input == "play"
        puts "Playing " + song.artist.name + " - " + song.name + " - " + song.genre.name
      end
    end
  end



end
