class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.glob("#{path}/*.mp3").map {|file| file.gsub("#{path}/", "")}
  end

  def import
    self.files.each {|mp3_filename| Song.create_from_filename(mp3_filename)}
  end
end
