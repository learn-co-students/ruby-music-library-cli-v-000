class MusicImporter

 extend Concerns::Findable
 
 attr_accessor :path 

def initialize(path)
    @path = path 
  end 
  
  def files 
    Dir.chdir(@path) do | path |
        Dir.glob("*.mp3")
    end 
  end
  
  def self.import
    files.each {|file| Song.new_by_filename(file)}
  end 
  
end 

