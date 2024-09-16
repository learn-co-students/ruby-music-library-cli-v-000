require 'pry'
class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.entries(path).select {|f| !File.directory?(f)} #if the file IS NOT a directory, then select it
  end

  def import
    self.files.each do |filename|
      Song.create_from_filename(filename)
    end
  end
end
