class MusicImporter

  attr_accessor :path, :files
  
  def initialize(path)
    @path = path
    @files = []
  end

  def files
    @files = Dir["#{path}/*.mp3"].collect { |file| file.gsub!("#{path}/", "") }
  end

  def import
    self.files.each {|file| Song.create_from_filename(file)}
  end

end
