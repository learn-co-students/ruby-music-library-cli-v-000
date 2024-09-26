class MusicImporter
  attr_accessor :path

  @files = []

  def files
    mp3files = Dir.glob(path+"/*.mp3")
    mp3files.map { |f| f.gsub(path+"/", '')}
  end

  def initialize(path)
    @path = path
  end

  def import
    files.each{ |f| Song.create_from_filename(f) }
  end

end
