require 'pry'

class MusicImporter

  attr_reader :path, :directory

  def initialize(path)
    @path = path
    @directory = []
  end

  def files
    @directory << path
  end


end
