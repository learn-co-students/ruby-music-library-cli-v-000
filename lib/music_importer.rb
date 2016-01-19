require 'pry'
class MusicImporter
  attr_reader :path


  def initialize(path)
    @path = path
  end

  def files
    Dir["#{path}/*.mp3"].map do |song| #needs to be quotes! cannot be ''
      File.basename(song)
    end
  end

  def import
    files.each do |file| 
      Song.new_from_filename(file)
    end
  end
  
end