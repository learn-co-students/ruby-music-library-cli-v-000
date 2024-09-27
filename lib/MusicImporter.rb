class MusicImporter
  attr_accessor :path

    def initialize(path)
      @path = path
    end

    def files
      d = Dir.new(@path)
      result = []
      d.each do |name|
        if name.end_with?(".mp3")
          result << name
        end
      end
      result
    end

    def import
      list =  self.files

      result = []
      list.each do |song|
        result << Song.create_from_filename(song)
      end
        result
    end


end # => End MusicImporter class
