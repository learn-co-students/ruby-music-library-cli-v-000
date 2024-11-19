class MusicImporter
    
    attr_accessor :path
    
    def initialize(path)
        @path = path
    end
    
    def files
        Dir.chdir("#{@path}") {| path | Dir.glob("*.mp3")}  
    end
    
    def import
        x = self.files
        x.each do |y|
            Song.create_from_filename(y)
        end
    end
    
end