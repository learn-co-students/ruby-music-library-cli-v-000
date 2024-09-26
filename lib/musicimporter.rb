require 'pry'

class MusicImporter

  attr_accessor :path

  def initialize(path)
    self.path = path
  end

  def files
    file_names = []
    files = Dir["#{self.path}/**/*.mp3"]
    files.each {|file| file_names << file.split(/mp3s\/(.+.mp3)\z/)[1]}
    file_names
  end

  def import
    self.files.each do |file|
      Song.create_from_filename(file)
    end
  end
end