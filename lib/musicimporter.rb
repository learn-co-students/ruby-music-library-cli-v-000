class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.glob("#{path}/*.mp3").collect {|files| files.gsub("#{path}/", "")} #"*.mp3":matches all files ending with .mp3
  end

  def import
    files.each {|file| Song.create_from_filename(file)}
  end

end
