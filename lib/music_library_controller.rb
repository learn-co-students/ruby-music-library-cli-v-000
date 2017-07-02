require 'pry'
class MusicLibraryController
  attr_reader :path
  def initialize(path='./db/mp3s')
    @path = path
    @music_importer = MusicImporter.new(path)
    @music_importer.import
  end
  def call
    input = ""
    while input != "exit"
      input = gets.strip
      case input
      when "list songs"
        Song.all.each_with_index{|song, index| puts "#{index + 1}. #{print_song(song)}"}
        # @music_importer.files.each.with_index {|filename, index| puts "#{index + 1}. #{filename.split('.')[0]}"}
      when "list artists"
        Artist.all.each{|artist| puts artist.name}
      when "list genres"
        Genre.all.each{|genre| puts genre.name}
      when "play song"
        play_song()
      when "list artist"
        input = list_artist()
      when "list genre"
        input = list_genre()
      end
    end
  end
  def list_artist
    input = gets.strip
    artist = Artist.all.detect{|artist| artist.name == input}
    if artist
      Song.all.select{|song| song.artist == artist}.each{|song| puts print_song(song)}
    end
    input
  end
  def list_genre
    input = gets.strip
    genre = Genre.all.detect{|gerne| gerne.name == input}
    if genre
      Song.all.select{|song| song.genre == genre}.each{|song| puts print_song(song)}
    end
    input
  end
  def play_song
    index = gets.strip().to_i - 1
    song = Song.all[index]
    puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end
  def print_song(song)
    "#{song.artist.name} - #{song.name} - #{song.genre.name}"
  end
end
