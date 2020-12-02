class MusicImporter
    attr_reader :path
    def initialize(path)
        @path = path
    end

    def files
        @files ||= Dir.glob("#{path}/*.mp3").map do |filename|
            filename.gsub("#{path}/", "")
        end
    end

    def import            
        self.files.each do |file|
            Song.create_from_filename(file)
        end
    end
end