class MusicImporter
  attr_accessor :path, :files

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir[@path+"/*"].map{|file| file.split("./spec/fixtures/mp3s/")[1]}
  end

  def import
    files.map{|filename| Song.create_from_filename(filename)}
  end
end
