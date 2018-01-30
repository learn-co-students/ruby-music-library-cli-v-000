class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.entries(path).reject!{|file| !file.end_with?(".mp3")}
  end

  def import
    self.files
    @files.each do |file|
      Song.create_from_filename(file)
    end
  end
end