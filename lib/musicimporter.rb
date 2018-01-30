class MusicImporter

  def initialize(filepath)
    @filepath = filepath
  end

  def path
    @filepath
  end

  def files
    Dir["#{path}/*.mp3"].collect {|path| path.split("/").last}
  end

  def import
    files.each do |filename|
      Song.create_from_filename(filename)
    end
  end

end