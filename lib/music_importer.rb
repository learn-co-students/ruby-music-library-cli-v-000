class MusicImporter
  attr_accessor :files, :path

  def initialize(path)
    @path = path
  end

  def files
    @files=Dir.glob(@path+'/*.mp3').map { |f| f[@path.length+1..-1] }
  end

  def import
    files.each do |filename|
      song = Song.create_from_filename(filename)
    end
    @files
  end

  def path
    @path
  end

end
