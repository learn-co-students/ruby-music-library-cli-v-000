require 'pry'
class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(path).select do |file_list|
      !File.directory?file_list
    end
  end

  def import
    self.files.each do |filename|
      song = Song.new_from_filename(filename)
    end
  end
end