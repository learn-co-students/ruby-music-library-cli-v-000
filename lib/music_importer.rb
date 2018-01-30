require 'pry'

class MusicImporter

  attr_accessor :path, :filenames, :playlist

  def initialize(path)
    @path = path
  end
  
  def files
    Dir.entries(@path).delete_if do |file|
      (file.include? ".mp3") != true 
    end
  end
  
  def import
    @filenames = self.files
    @filenames.each do |i|
      Song.create_from_filename(i)
    end
  end
end