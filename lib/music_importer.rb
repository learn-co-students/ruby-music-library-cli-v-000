class MusicImporter
  attr_reader :path, :files

  def initialize(path)
    @path = path
  end

  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect {|file| file.gsub(/.*\//, "")}
  end

  def import
    self.files.each {|file| Song.create_from_filename(file)}
  end

end
