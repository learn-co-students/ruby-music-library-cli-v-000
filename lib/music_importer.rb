require_relative '../config/environment'

class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    `ls #{self.path}`.split("\n")
  end

  def import
    self.files.each do |file|
      Song.create_from_filename(file)
    end
  end
end
