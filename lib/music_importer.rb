class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir["#{path}/*.mp3"].sort
    @files.collect do |file|
      file.gsub("#{path}/", "")
    end
  end

  def import
    files.each do |file|
      Song.create_from_filename(file)
    end
  end
end
