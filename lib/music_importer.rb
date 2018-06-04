require 'pry'
class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    files = Dir["#{self.path}/*.mp3"]
    files.collect do |file|
      file.slice!(0...(self.path.length+1))
    end
    files
  end

  def import
    files.each {|file| Song.create_from_filename(file)}
  end

end
