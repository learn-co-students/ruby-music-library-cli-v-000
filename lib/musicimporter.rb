class MusicImporter
  attr_accessor :song, :genre, :artist, :path
  def initialize(filepath)
    @path = filepath
  end
  
  def files
    @files = Dir.glob("#{@path}"+"/*.mp3").select { |e| File.file?(e) }
    @files.map {|file| File.basename(file)}
  end
  
  def import
    self.files.each {|filename| Song.create_from_filename(filename)}
  end
end