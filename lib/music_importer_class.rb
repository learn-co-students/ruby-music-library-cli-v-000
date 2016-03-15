class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.glob("#{@path}/*.mp3").collect {|file| file.split('/').last}
  end

  def import
    files.uniq.each do |fname|
      Song.create_from_filename(fname)
    end
  end
end