class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.glob(@path + "/*.mp3")
    @files.collect! {|file|
      file.split('/')[4]
    }
    @files
  end

  def import
    self.files.each {|file|
      Song.create_from_filename(file)
    }
  end
end