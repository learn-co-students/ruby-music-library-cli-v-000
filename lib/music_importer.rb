class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    list = Dir[path + "/*.mp3"].map {|full_path| full_path.split("/").last}
  end

  def import
    self.files.each do |filename|
      Song.create_from_filename(filename)
    end
  end

end