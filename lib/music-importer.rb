require 'pry'

class MusicImporter
  attr_accessor :path
  def initialize(path = "./db/mp3s")
    @path = path
  end

  def files
    files = Dir.glob("#{path}/*.mp3")
    files.collect do |file|
      file.gsub("#{path}/", "")
    end
  end

  def import
    self.files.each do |file_name|
      Song.create_from_filename(file_name)
    end
  end

end