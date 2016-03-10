class MusicImporter
  attr_accessor :song, :genre, :artist, :path

  def initialize(filepath)
    @path = filepath
  end

  def files
    Dir.entries(@path).reject {|file| File.directory?(file)}
  end

  def import
    files.each {|file| Song.new_from_filename(file).save}
  end
end
