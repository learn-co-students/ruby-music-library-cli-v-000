class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    Dir[path + "/*.mp3"].map do |filename|
      File.basename(filename)
    end
  end

  def import
    files.each { |filename| Song.create_from_filename(filename) }
  end
end