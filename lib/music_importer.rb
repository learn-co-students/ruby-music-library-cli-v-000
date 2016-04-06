class MusicImporter
    attr_accessor :path

    def initialize(path = "db/mp3s")
        @path = path
    end

    def files
        Dir.entries(path).select do |file|
            file.end_with?(".mp3")
        end
    end

    def import
        files.collect do |filename|
            Song.create_from_filename(filename)
        end
    end
end
