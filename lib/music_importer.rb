class MusicImporter
  extend Concerns::Findable
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir[@path+"/*.mp3"].map {|file| file.split("/").last}
  end

  def import
    files.each {|file_name| Song.create_from_filename(file_name)}
  end
end
