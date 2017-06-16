

class MusicImporter

    attr_accessor :path

    def initialize(file_path)
        @path = file_path
        @files = []
    end

    def files
        Dir.new(path).each do |item|
            next if item == '.' || item == '..'
            @files << item
        end
        @files.sort
  #      binding.pry
    end

    def import
        self.files.collect {|file| Song.create_from_filename(file)}
    end
end