
  class MusicImporter
    attr_accessor :path

    def initialize(path)#path points to a string
      @path = path
    end

    def files #getter for files attribute
        @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
    end

    def import
      files.each { |file| Song.create_from_filename(file) }
    end
end
