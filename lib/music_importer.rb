class MusicImporter
  attr_accessor :path, :files

  def initialize(path)
    @path = path
    @files = []
  end

  def files 
    Dir.chdir(path) do 
      @files=Dir.glob('*.mp3')
    end
  end

  def import
    files.each do |i|
      Song.new_from_filename(i)
    end
  end
end
