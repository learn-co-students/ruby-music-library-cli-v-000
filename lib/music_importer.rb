class MusicImporter

    attr_accessor :path

    def initialize(path)
      @path = path
    end

    def files
      Dir.entries(path).select do |filename|
      files= filename.split("- ")[1]
      end
    end

    def import
      files.each {|song|Song.create_from_filename(song)}
    end


end
