class MusicImporter
  attr_accessor :path, :files


  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.glob("#{path}/*.mp3").collect {|song| song.gsub("#{path}/", "")}
  end
end
