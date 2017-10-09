class MusicImporter
    attr_reader :path
    
    def initialize(filepath)
        @path = filepath
    end
    
    def files
        Dir.entries(path).select {|fname| fname.length > 2}
    end
    
    def import
        self.files.each {|file| Song.create_from_filename(file)}
    end
end
