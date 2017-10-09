class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.glob("#{path}/*.mp3").collect { |x| x.gsub(path + "/", "")}
  end

  def import
    files.each {|x| Song.create_from_filename(x)}
  end

end
