class MusicImporter

    attr_accessor :path

    def initialize(file_path)
        @path = file_path
    end

    def files
        collection = Dir.entries(self.path)
        collection.delete_if{|filename| !filename.include?(".mp3")}
    end

    def import
        self.files.each do |file|
            Song.create_from_filename(file)
        end
    end
end
