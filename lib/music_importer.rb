class MusicImporter
    attr_accessor :files
    attr_reader :path

    def initialize(file_path)
        @path = file_path
        @files = Dir.entries(file_path).select { |file| file.include?(".mp3") }
    end

    def import
        self.files.each do |filename|
            Song.create_from_filename(filename)
        end
    end

end