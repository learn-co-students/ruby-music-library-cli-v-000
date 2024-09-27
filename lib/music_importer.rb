class MusicImporter

    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files 
        @dbfiles = Dir.entries(@path)
        @dbfiles.delete_if {|file_name| file_name == "." || file_name == ".."}
    end

    def import 
        files.map { |file| Song.create_from_filename(file) }
    end

end