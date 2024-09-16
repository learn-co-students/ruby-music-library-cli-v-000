class MusicImporter
  attr_accessor :path 
  @@all = []
  
    def initialize(path)
      @path = path
      @@all << self 
    end 
    
    # literally NO idea what's going on here... regex, it looks like? 
    # tried for like 30 mins, gave up, googled
    def files 
       @files ||= Dir.glob("#{@path}/*.mp3").collect{ |file| file.gsub("#{@path}/", "") }
    end
  
    def import
      files.each do |song|
         Song.create_from_filename(song)
       end 
    end 
    
    
end 
