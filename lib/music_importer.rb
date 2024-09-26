class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
#   Dir.entries("./spec/fixtures/mp3s")
    Dir.glob(@path+"/*mp3").map do |file|
      file.gsub(/\.\/spec\/fixtures\/.*mp3s\//, '')
    end
  end

  def import
    files.map do |file|
      Song.create_from_filename(file)
    end
  end

end
