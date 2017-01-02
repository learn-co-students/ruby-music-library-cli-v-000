class MusicImporter
  attr_accessor :path
  def initialize(filename)
    self.path = filename << "/*"
  end
  def files
    filenames = Dir[self.path]
    filenames.collect {|file| file.split("/").pop if file.end_with?(".mp3")}
  end
  def import
    self.files.each do |file|
      Song.create_from_filename(file)
    end
  end
end
