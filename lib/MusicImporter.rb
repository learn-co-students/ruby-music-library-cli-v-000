class MusicImporter
    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
        @files = Dir["#{path}/*.mp3"]
        @files.map! do |f|
            f.gsub!("#{path}/", "")
        end
    end

    def import
        files.each do |f|
            Song.create_from_filename(f)
        end
    end

end