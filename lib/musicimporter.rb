require 'pry'

class MusicImporter
  attr_accessor :path
  def initialize(path)
    @path = path
  end

  def files
    files = Dir.entries(@path).select {|f| !File.directory? f}
  end

  def import
    file_import = self.files.each{ |file| Song.create_from_filename(file)}
  end
end
