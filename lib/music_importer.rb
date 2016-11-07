class MusicImporter

    attr_accessor :path

    def initialize(path)
      @path = path
    end

    def files
        file = Dir.glob("#{path}/*.mp3")
        no_path_file =  Dir.entries(self.path)
        no_path_file.delete("..")
        no_path_file.delete(".")
        no_path_file
    end


    def import
      files.each do |each_file_name|
        Song.create_from_filename(each_file_name)
      end

    end

end
