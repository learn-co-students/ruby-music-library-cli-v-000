require 'pry'
class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.glob("#{path}/*.mp3").collect {|file| file.gsub("#{path}/", "")}
    binding.pry
  end

end
