class MusicImporter

  attr_accessor :path, :filename

  def initialize(path)
    @path = path
  end

  def files
    @files ||= Dir.glob("#{path}/*.mp3").map { |f|
      f.gsub("#{path}/", "")
    }
  end

  def import
    files.map { |f|
      Song.create_from_filename(f)
    }
  end
end
