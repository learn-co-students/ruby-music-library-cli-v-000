require 'pry'

class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def path
    @path
  end

  def files
    files = Dir.entries(path).reject {|f| File.directory?(f)}
  end

  def import
    self.files.each {|f| Song.create_from_filename(f)}
  end
end
