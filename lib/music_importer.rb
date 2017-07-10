class MusicImporter

  attr_accessor :path, :files

  def initialize(path)
    @path = path
    @files = Dir["#{path}/*.mp3"].each {|file| file.slice!("#{path}/")}
  end

  def import
    @files.each {|file| Song.create_from_filename(file)}
  end

end
