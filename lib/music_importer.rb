class MusicImporter
  attr_accessor :path, :files

  def initialize(filepath)
    @path = filepath
    @files = []
    self.files
  end

  def files
    file = Dir.glob(File.join(@path, "*"))
    @files = []
    songs = []
    file.each do |string|
      @files << string.match(/[a-zA-Z\s]{1,30} - [a-zA-Z\s\']{1,30} - [a-z\-]{1,12}.mp3/).to_a[0]
      @files.flatten
    end
    # binding.pry
    @files
  end

  def import
    @files.each do |name|
      Song.all << Song.new_from_filename(name)
    end
    # binding.pry
  end
end