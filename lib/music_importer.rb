class MusicImporter
  attr_accessor :path, :files

  def initialize(path)
    @path = path
    @files = Array.new
  end

  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect{|f| f.gsub("#{path}/", "")}
  end
end
