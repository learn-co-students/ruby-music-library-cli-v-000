require "pry"
class MusicImporter
  extend Concerns::Findable
  attr_accessor :path 
  
  def initialize(path)
    @path = path
  end
  
  def files
    file_file = []
    Dir["#{@path}"+"/*"].each do |item|
      File.basename(item)
    end
  end
  
  def self.import
    file_file = []
    self.files.each do |file|
      Song.new(file)
    end
  end
end