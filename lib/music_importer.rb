class MusicImporter
  
    attr_accessor :path,:files
    
    def initialize(path)
      @path = path
    end
    
    def files
      Dir.glob("#{path}/*.mp3").map do |file|
        file.gsub("./spec/fixtures/mp3s/",'')
      end
    end  
    
    def import
      # binding.pry
      Song.create_from_filename(file)
    end
end