require 'pry'

class MusicImporter
extend Concerns::Findable
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    files = []
    Dir.foreach(@path).collect {|file| files << file}
    files.keep_if {|file| file.length >3}
    files.sort
  end

  def import
    self.files.each do |file|
      Song.new_from_filename(file)
    end
  end
#binding.pry
end