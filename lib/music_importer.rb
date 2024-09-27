class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir["#{self.path}/*.mp3"]
    @files.collect! {|file| file.gsub(/\..*\//, "")}.sort
  end

  def import
    self.files.each {|filename| Song.create_from_filename(filename)}
  end
end