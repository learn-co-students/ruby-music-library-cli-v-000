require "pry"
class MusicImporter
  extend Concerns::Findable
  attr_accessor :path 
  
  def initialize(path)
    @path = path
  end
  
  def files
    file_file = []
    Dir["#{@path}/*"].each do |item|
      file_file << File.basename(item)
    end
    file_file
  end
  
  def self.import
    file_file = []
    self.files.each do |file|
      Song.new(file)
    end
  end
  
  def import
    files.each do |item|
      Song.create_from_filename(item)
    end
  end
end