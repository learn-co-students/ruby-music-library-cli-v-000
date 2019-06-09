require 'pry'
class MusicImporter
  extend Concerns::Findable 
  
#Dir.glob("./spec/fixtures/mp3s")
 
  attr_accessor :path
  
  def initialize(path)
    @path = path
    @files = []
  end 

  def files
#@files = Dir.glob(@path+"/*.mp3").collect do |file|
     # file.gsub!("./spec/fixtures/mp3s/", "")
   # end 
   # @files 
  @files = Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }

  end 

  def import
    files1 = self.files 
files1.each do |file|
       Song.create_from_filename(file)
  end 
   end  
end 