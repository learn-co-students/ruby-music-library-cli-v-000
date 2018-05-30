class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files # convert to array in order to apply collect
    Dir.glob("#{path}/*mp3").collect { |f| f.gsub("#{path}/", "") }
  end

  public
  def import
    files.each{ |f| Song.create_from_filename(f) }
  end
end
