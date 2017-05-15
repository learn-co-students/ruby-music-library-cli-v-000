class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir["#{@path}/**/*.mp3"].collect{|filename| filename.gsub("#{path}/", "")}.sort
  end

  def import
    files.each{|filename| Song.create_from_filename(filename)}
  end

end
