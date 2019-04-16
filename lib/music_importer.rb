class MusicImporter
  attr_accessor :path, :songs

  def initialize(path)
    @path = path
    @songs = []
  end

  def files
    Dir.foreach(@path) do |filename|
      if(filename.match(/.mp3\z/))
        @songs << filename
      end
    end

    return @songs

  end

  def import
    Dir.foreach(@path) do |filename|
      if(filename.match(/.mp3\z/))
        Song.create_from_filename(filename)
      end
    end
  end

end
