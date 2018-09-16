class MusicImporter
    attr_accessor :path, :files

    def initialize(file_path)
      @path = file_path
    end

    def files
      @files ||= Dir.glob("#{path}/*.mp3").collect{|f| f.gsub("#{path}/", "")}
    end

    def import
      # binding.pry
      files.each{|f| Song.create_from_filename(f) unless f == nil}
    end

end
