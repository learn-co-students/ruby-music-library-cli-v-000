class MusicImporter
  attr_reader :path, :files

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.glob(@path + "/*.mp3") 
    @files.collect!{ |i| File.basename(i) } 
    @files.sort! 
  end

  def import
    files.each { |i| Song.create_from_filename(i) } 
  end

end