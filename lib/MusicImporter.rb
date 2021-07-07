class MusicImporter
  attr_accessor :path, :files
  def initialize(path)
    @path = path
    @files = []
  end
  def files
    song_array = []
    p = Dir["#{self.path}/*"]
    p.each do |file|
      song_array << file.split(" - ")
    end
    # binding.pry
    song_array.each do |arr|
      @files << [arr[0].split("mp3s/")[-1] + " - " + arr[1] + " - " + arr[2]]
    end
    @files = @files.flatten
    return @files
  end
  def import
    self.files()
    @files.each do |file|
      Song.create_from_filename(file)
    end
  end
end
