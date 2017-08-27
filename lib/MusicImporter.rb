class MusicImporter
  attr_accessor :path
  def initialize(path)
    @path = path
  end

  def files
    directory = Dir.glob("#{path}/*.mp3")
    directory_files = directory.collect {|file| File.basename("#{file}")}
  end

  def import
    files.each {|file| Song.create_from_filename(file)}
  end
end
