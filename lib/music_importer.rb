require 'pry'

class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path= path
  end

  def files
   d = Dir.entries(@path)
   d.delete('..') && d.delete('.')
   d
  end

end