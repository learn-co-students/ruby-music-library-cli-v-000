require 'pry'

class MusicImporter
  attr_accessor :path, :files

  def initialize(path)
    @path = path
  end

  def files
    # binding.pry
    Dir.glob("#{path}/*").map {|filename| filename.gsub("#{path}/", '')}
  end

  def import
    files.each {|filename| Song.create_from_filename(filename)}
  end
end
