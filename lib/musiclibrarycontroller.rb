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
        list_artists_songs
      elsif input == "list genres"
        Song.all.each do |song|
          puts song.genre.name
        end
      elsif input == "play song"
        puts "Playing " + Song.all[0].artist.name + " - " + Song.all[0].name + " - " + Song.all[0].genre.name
      elsif input == "list artist's songs"
        puts "Which artist do you want a song list for?"
        artist_input = gets.strip
        
      end
  end

def list_artist
  Song.all.each do |song|
    puts song.artist.name
  end
end

def list_artists_songs

end


end
