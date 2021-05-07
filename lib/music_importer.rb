class MusicImporter
  attr_accessor :path,:files

  def initialize(path)
    @path = path
  end

  def files
    files = Dir.entries(self.path)
    files.select{|file| file.match(/.+[mp3]/)}
  end

  def import
    entries = self.files
    entries.each{|entry| Song.create_from_filename(entry)}
  end

end
