require 'pry'

class MusicImporter

  attr_accessor :path

  def initialize(test_music_path)
    @path = test_music_path
  end

  def files
    temp = []
    collection = []
    temp = Dir.glob("#{path}/*.mp3")
    temp.each do |file|
      collection << file.split('mp3s/')[1]
    end
    return collection
  end

  def import
    temp = []
    collection = []
    temp = Dir.glob("#{path}/*.mp3")
    temp.each do |file|
      collection << file.split('mp3s/')[1]
    end
     collection.each do |song|
        Song.create_from_filename(song)
     end
  end

end
