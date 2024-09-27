class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir[path + "/*"].collect{|name| name.split('/')[-1]}
  end

  def import
    files.collect{|file| Song.create_from_filename(file)}
  end
end
