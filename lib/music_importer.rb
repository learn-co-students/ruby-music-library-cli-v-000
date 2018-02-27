require 'pry'

class MusicImporter

attr_accessor :path


  def initialize(path)
    @path = path
  end

  def files
    Dir.glob("#{path}/*.mp3").collect {|song| song.gsub("./spec/fixtures/mp3s/", "")}
  end




  def import
    new_songs = MusicImporter.new(path)
    new_songs.files.collect {|i| Song.create_from_filename(i)}
    end
end
