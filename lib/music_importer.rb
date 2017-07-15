class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir["#{@path}/*.mp3"]
    @files = @files.join("")
    @files = @files.split("#{@path}/")
    @files.shift
    @files
  end

  def import
    files
    @files.each{|file_name| Song.create_from_filename(file_name)}
  end
end