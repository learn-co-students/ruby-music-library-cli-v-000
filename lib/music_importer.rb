class MusicImporter
  
    attr_accessor :path,:files
    
    def initialize(path)
      @path = path
    end
    
    def files
      Dir.glob("#{path}/*.mp3").map do |file|
      
        file.gsub("#{path}/", "")
      end
    end  
    
    def import
      self.files.each do |file|
        Song.create_from_filename(file)
      end
    end
end