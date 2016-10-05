class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
    @files = Dir.glob("#{@path}/*.mp3").map{ |f| f.gsub("#{path}/", "")}
  end

  def files
    @files
  end

  def import
    files.each do |song|
      s = Song.new_from_filename(song)
    end
  end

end
