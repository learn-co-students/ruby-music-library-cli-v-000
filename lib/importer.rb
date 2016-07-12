class MusicImporter
  attr_accessor :path, :files


  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.glob("#{path}/*.mp3").collect {|song| song.gsub("#{path}/", "")}
  end

  def import
    files.each do |x|
      Song.create_from_filename(x)
    end

  end
end
