class MusicImporter
  def initialize(path)
    @path = path
  end

  attr_accessor :path

  def files
    arr = Dir["#{self.path}/*.mp3"]
    newarr = arr.collect{|filename| filename.sub("#{self.path}/", "")}
  end

  def import
    self.files.each {|file| Song.create_from_filename(file)}
  end
end
