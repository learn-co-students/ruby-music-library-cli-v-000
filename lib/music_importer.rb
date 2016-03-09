class MusicImporter
  attr_accessor :song, :genre, :artist, :path
  #@@files = []

  def initialize(filepath)
    @path = filepath
  end

  def files
    Dir.entries(@path).reject {|file| File.directory?(file)}
  end

  def self.import
    self.files.each {|file| Song.new_by_filename(file)}
  end
end
