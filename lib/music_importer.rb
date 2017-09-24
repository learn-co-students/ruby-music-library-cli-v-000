require 'pry'
class MusicImporter
  attr_accessor :path
  def initialize(file_path)
    @path = file_path
#    binding.pry
  end
  def files
    Dir.foreach(@path).select{|file| file.include? "mp3" }
  end
  def import
    self.files.each { |f| Song.create_from_filename(f)}

  end
end
