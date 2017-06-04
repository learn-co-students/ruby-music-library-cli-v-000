class MusicImporter
    attr_reader :path
    attr_accessor :files

    def initialize(path)
        @path = path
        @files = []
    end

    def files
        @files = Dir[self.path + "/*.mp3"]
#binding.pry
        @files.each{ |file|
            file.slice!(@path + "/")
        }
    end

    def import
        self.files
        @files.each{ |file|
            Song.create_from_filename(file)
        }
    end
end