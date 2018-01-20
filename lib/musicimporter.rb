require 'pry'
    
class MusicImporter
    attr_reader :path
    @f = []
    
    def initialize(path)
        @path = path
    end

    def files
        @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
    end

    def import
        files.collect {|f| song = Song.create_from_filename(f)}
    end
    
end
