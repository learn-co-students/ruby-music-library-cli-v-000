class MusicImporter
  attr_accessor :path

  def initialize(file)
    @path = file
  end
  def files
    Dir.entries(path).select{|file| file.end_with?(".mp3")}
  end

  def import
    files.each {|filename|Song.new_from_filename(filename)}
  end
end