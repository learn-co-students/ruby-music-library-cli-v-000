require 'pry'
class MusicImporter
  attr_accessor :path, :files

  def initialize(path)
    @path = path
    @files = get_file_names
  end

  def get_file_names
    Dir.entries(@path).map{|entry| entry.scan(/.*\.mp3$/)}.flatten
  end

end
