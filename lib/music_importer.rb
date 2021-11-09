class MusicImporter
    attr_accessor :path

    def initialize(path)
      @path = path
    end

    def files
      files_array = Dir[@path + "/*.mp3"]
      files_array.collect do |file|
      file.split("/")[-1]
      end
    end

    def import
      self.files.each{|filename| Song.create_from_filename(filename)}
    end
  end
