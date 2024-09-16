class MusicImporter
  attr_accessor :song, :path

  def initialize(path)
  	@path = path
  	@files = []
  end

  def files
    Dir.entries(path).select {|file| file.end_with?("mp3")}
  end

  def import
  	files.each {|file| Song.create_from_filename(file)}.uniq
  end
end
