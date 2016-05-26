require 'pry'

class MusicImporter

  attr_reader :path

  def initialize(file_path)
    @path = file_path
  end

  def files
    Dir.entries(path).reject {|x| x == "." || x == ".."}
  end

  def import
    files.each {|x| Song.new_from_filename(x)}
  end
  
end