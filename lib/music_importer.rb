class MusicImporter
  attr_accessor :path
  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.glob("#{@path}/*.mp3")
    @files.collect! {|filename| filename.gsub(/#{@path}\//, "")}
    @files
  end

  def import
    files
    @files.each {|file| Song.create_from_filename(file)}
  end
end
