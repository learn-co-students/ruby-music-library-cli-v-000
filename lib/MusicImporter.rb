class MusicImporter

    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
        @files = []
        Dir["#{path}/*.mp3"].collect do |file|
            @files << file.split('/')[4]
        end 
        @files
    end

    def import
        files.each do |file|
            Song.create_from_filename(file)
        end
    end
end
