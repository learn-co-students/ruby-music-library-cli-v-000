class MusicImporter
  attr_reader :files

  def initialize(path)
    @path = path
    @files = Dir["#{path}/*.mp3"].collect{|file| File.basename file}
  end

  def import
    @files.each {|file| Song.create_from_filename(file)}
  end

  def path
    @path
  end

  def files
    @files
  end
end
