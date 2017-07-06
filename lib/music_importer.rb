require 'pry'
class MusicImporter
  attr_reader :path, :file_list

  def initialize(path)
    @path = path
  end

  def files
    file_list = Dir.entries(self.path).select {|f| f.match(/(.mp3)/)}
  end

end
