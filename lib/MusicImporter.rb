class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end


    def files
     @files = Dir.glob("#{path}/*.mp3").collect { |files| files.sub("#{path}/", "") }
    end

    def import
      @files.each { |filename| Song.new_from_filename(filename) }

    end

end
