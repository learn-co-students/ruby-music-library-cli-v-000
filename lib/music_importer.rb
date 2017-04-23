class MusicImporter
  attr_accessor :path

  def initialize(filepath)
    @path = filepath
  end

  def files
    Dir.entries(@path).select {|entry| entry.include?('mp3')}
  end

  def import
    self.files.each {|file| Song.new_from_filename(file)}
  end
end
