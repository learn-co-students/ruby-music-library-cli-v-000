require 'pry'
class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir["#{path}/*.mp3"].collect{|filepath| filepath.gsub("#{path}/", "")}
  end

  def import
    self.files.collect{|filename| Song.create_from_filename(filename)}
  end
end