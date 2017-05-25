require 'pry'

class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    @song_array = Dir["#{path}/*.mp3"].to_a.sort
    @song_list = @song_array.collect {|file| File.basename file}
  end

  def import
    files.each {|record|
      Song.create_from_filename(record)}
  end

  def list_songs
    idx = 0
    @song_list.each {|song|
      idx = idx + 1
      puts "#{idx}. #{song.chomp('.mp3')}"}
  end

  def get_song(number)
    @song_list[number]
  end

  def list_artist_songs(artist)
    @song_list.each {|song|
      if song.split(" - ")[0] == artist
        puts "#{song.chomp('.mp3')}"
      end}
  end

  def list_genre_songs(genre)
    @song_list.each {|song|
      if song.chomp('.mp3').split(" - ")[2] == genre
        puts "#{song.chomp('.mp3')}"
      end}
  end
end
