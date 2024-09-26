class MusicImporter
  attr_accessor :path

  def initialize(path)
    self.path = path
  end

  def files
    files = Dir.entries(self.path)
    files.select {|file| file =~ /.mp3/}
  end

  def import
    files.each {|file| Song.create_from_filename("#{file}")}
  end
end
