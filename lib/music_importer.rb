
class MusicImporter
  attr_accessor :path, :files

  def initialize(path = "./db/mp3s")
    @path = path
    @files = get_file_names
  end

  def get_file_names
    Dir.entries(@path).map{|entry| entry.scan(/.*\.mp3$/)}.flatten
  end

  def import
    @files.each { |file| Song.create_from_filename(file)}
  end

end
