class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(path).find_all {|file| file.include?(".mp3")}
  end

  def import
    files.each do |filename|
      Song.new_from_filename(filename)
    end
  end
end