class MusicImporter
  attr_accessor :path

  def initialize(filePath)
    @path = filePath
  end

  def files
    files = Dir.glob("#{path}/*.mp3").collect { |e| e.gsub("#{path}/", "") }
  end

  def import
    files.each do |fileName|
      Song.create_from_filename(fileName)
    end
  end
end
