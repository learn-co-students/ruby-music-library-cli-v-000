class MusicImporter
  attr_accessor :path
  def initialize(path)
    @path=path
  end
  def files
    #glob mathces a regex expression
    @files= Dir.glob("#{path}/*.mp3").map { |file| file.gsub("#{path}/","")}
  end
  def import
    files.each do |file|
      Song.create_from_filename(file)
    end
  end
end
