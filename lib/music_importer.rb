class MusicImporter

  attr_accessor :path

    def initialize(path)
      @path = path
    end

    def files
      arr = Dir.entries(@path)
      arr.delete_if{|x| x == "." || x == ".."}
    end

    def import
      files.each do |file_name|
         Song.create_from_filename(file_name)
      end
    end




end
