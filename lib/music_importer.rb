class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    files = []
    Dir.glob("#{path}/*.mp3").map do |file|
      files << file.gsub("#{path}/", "")
    end
      files
  end

  def import
    files.each {|file_name| Song.create_from_filename(file_name)}
  end

end
