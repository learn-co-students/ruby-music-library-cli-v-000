class MusicImporter
  attr_reader :path
  attr_accessor :files

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir[@path + "/*.mp3"]
    @files.map{|file| file.split("/")[-1]}
  end

  def import
    self.files.each{|file| Song.create_from_filename(file)}
  end

end
