class MusicImporter
  attr_accessor :path, :files

  def initialize(path)
    @path = path
  end

  def files
    result = []
    ary = Dir.entries(@path)
    ary.each do |i|
      if i.include?("mp3")
        result << i
      end
    end
    result
  end

  def import
    self.files.each do |song|
      Song.create_from_filename(song)
    end
  end
end
