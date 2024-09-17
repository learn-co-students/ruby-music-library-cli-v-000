class MusicImporter

  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
    @files[2], @files[3] = @files[3], @files[2]
    @files
  end

  def import
    files.each{|f| Song.create_from_filename(f) }
  end
end
