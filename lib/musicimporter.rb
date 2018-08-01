require 'pry'
class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(path).reject{|file| file == "." || file == ".."}
  end


end
