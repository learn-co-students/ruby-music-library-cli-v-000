class MusicImporter
  
    attr_accessor :path
    
    def initialize(path)
        @path = path
    end
    
    def files
        Dir[path + "/*.mp3"].map do |filename|
          File.basename(filename)
        end
    end
    
    def import
      files.each do |file|
        Song.create_from_filename(file)
      end
    end
end