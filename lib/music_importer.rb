require 'pry'
class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    binding.pry
    Dir.entries(path)
    #   #it "loads all the MP3 files in the path directory" do
  end


end
