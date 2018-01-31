require 'pry'

class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.glob("#{path}/*").map{ |file| file.gsub("#{path}/", '')}
    # files = Dir.entries(@path)
    # files.delete_if { |file| file == "." || file == ".." }
  end

  def import
    self.files.each { |file| Song.create_from_filename(file) }
  end
  
end
