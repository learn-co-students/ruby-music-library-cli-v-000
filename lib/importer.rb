class MusicImporter
  attr_accessor :path, :songs

  def initialize(path)
    @path = path
  end

  def files
    files = Dir.glob("#{path}/**/*.mp3")
    files.map { |file| file.gsub("#{path}/", "") }
  end

  def import
    files.each{|filename| Song.new_by_filename(filename)}
  end



end
