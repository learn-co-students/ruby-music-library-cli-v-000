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
end

#def files
    #file_file = []
    #Dir["#{@path}"+"/*"].each do |item|
      #File.basename(item)
    #end
    #Dir["#{@path}/*"]
#>>>>>>> 036fab9ffdc1c428d5cf02697973c32c5cfe638e
  #end