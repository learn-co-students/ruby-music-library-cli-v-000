class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir["#{@path}/*.mp3"]
    @files.each do |f|
      f.slice! "#{@path}/"
    end
  end

  def import
    files.each {|f| Song.create_from_filename(f)}
  end

end
