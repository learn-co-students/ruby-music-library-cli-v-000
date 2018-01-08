#require 'pry'

class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir[self.path + "/*.mp3"]#.collect { |file| binding.pry file.scan(/w+ - \w+ - \w+.mp3/)[0] }
  end
end
