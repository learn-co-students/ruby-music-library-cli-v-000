class MusicImporter
  attr_accessor :path, :files

  def initialize(path)
    @path = path
  end

  def files
    Dir.glob("#{path}/*.mp3").collect{|f| File.basename(f)}
  end

  def import
    files.each {|f| Song.create_from_filename(f)}
  end
end
