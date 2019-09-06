class MusicImporter
  attr_accessor :files, :path

  def initialize(path)
    @path = path
    @files = []
  end

  def files
    @files << Dir.entries(@path).grep(/.*(.mp3)/)
    @files.flatten!
  end

  def import
    files.each{|file| Song.create_from_filename(file)}
  end

end
