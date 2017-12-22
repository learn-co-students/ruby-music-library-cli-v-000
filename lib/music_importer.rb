class MusicImporter
    
    attr_accessor :path, :files
    
    def initialize(path)
        @path = path
        normalize
    end
    
    def normalize
        f= Pathname(@path).children.map {|i| i.split}
        @files = f.map {|x, y| y.to_s}
    end
    
    def import
        @files.each {|filename| Song.create_from_filename(filename)}
    end
end