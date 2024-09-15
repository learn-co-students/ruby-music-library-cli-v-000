require 'pry'
class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    files = Dir["#{@path}/**/*.mp3"]
    files.collect {|file| file.gsub("#{@path}/","")}
  end

  def import
    self.files.collect {|file| Song.create_from_filename(file)}
  end
end
