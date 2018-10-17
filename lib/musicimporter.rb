class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.glob("#{@path}/*.mp3").collect do |file|
      file.gsub("#{@path}/", "")
    end
  end

# <<<<<<< HEAD
  def import
    files.each do |file|
      Song.create_from_filename(file)
    end
  end
# =======
  def self.import
    files.each do |song|
      Song.new_by_filename(song)
    end
  end

# >>>>>>> b95c934c51cc6b7f64f374b896b04e649fc44df3
end
