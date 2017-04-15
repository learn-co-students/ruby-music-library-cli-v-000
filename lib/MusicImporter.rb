require 'pry'
class MusicImporter
  attr_accessor :path
  def initialize(path)
    @path = path
  end
  def files
   files = Dir.entries(path)
   files.slice(2,files.size)
  end
end
