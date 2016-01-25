class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir[File.dirname(@path) + '/mp3s/*.mp3'].map do |dir|
      dir.gsub("#{@path}/", "")
    end
  end

  def import
    files.each do |file|
      Song.create_from_filename(file)
    end
  end

end