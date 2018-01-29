class MusicImporter
    attr_reader :path

    def initialize(path)
       @path = path
    end

    def files
       @files ||= Dir.glob("#{path}/*.mp3").collect { |file_name| file_name.gsub("#{path}/", '') }
    end

    def import
       files.each { |file_name| Song.create_from_filename(file_name) }
    end
 end
