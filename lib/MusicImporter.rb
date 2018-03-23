class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir["#{path}/*.mp3"].collect{|path| path.split('/').last}
  end

  def import
    files.each{ |filename| Song.create_from_filename(filename) }
  end


end
