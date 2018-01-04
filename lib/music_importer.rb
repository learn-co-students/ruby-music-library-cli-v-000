class MusicImporter
    
    attr_accessor :path
    
    def initialize(path)
        @path = path
    end
    
    def files 
        @files = Dir.entries(@path).delete_if { |file| !file.include?(".mp3") }
        @files    
    end
    
    def import
        files.each { |file| Song.create_from_filename(file) }  
    end
    
end