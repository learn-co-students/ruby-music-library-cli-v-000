class MusicImporter

  attr_reader :path

  def initialize (path)
    @path = path
  end

  def files
    Dir.glob("#{path}/*.mp3").map do |files|
    files.gsub("#{path}/", "")
    end
  end

  def import
    files.each do |file| Song.create_from_filename(file)
    end
  end

end
