class MusicImporter

  attr_reader :path

  def initialize(path)
     @path = path
  end

  def files
    @files = Dir["#{path}/*.mp3"]
    @files.map { |file| file.gsub(/\.\/spec\/fixtures\/[a-z0-9_]+\//, "") }
  end

  def import
    files.each { |file| song = Song.create_from_filename(file) }
  end

end
