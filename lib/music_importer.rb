class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    file = Dir.entries(path).select {|file| file[/\mp3$/]}
  end

  def import
    files.each { |file| Song.create_from_filename(file) }
  end

end
