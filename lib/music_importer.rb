class MusicImporter

  attr_accessor :path

  def initialize(file_path)
    self.path = file_path
  end

  def files
    @files = Dir.glob("#{path}/*.mp3")
    @files.map {|file| file.gsub("#{path}/", "")}
  end

  def import
    files.each {|file| Song.create_from_filename(file)}
  end




end
