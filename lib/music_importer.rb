class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    @files = []
    Dir.glob("#{path}/*.mp3").each do |file|
      @files << file.gsub("#{path}/", "")
    end
    @files.sort
  end

  def import
    files.each {|file| Song.create_from_filename(file)}
  end

end
