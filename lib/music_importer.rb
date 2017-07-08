
class MusicImporter
  attr_accessor :path
  @@all=[]
  def initialize(test_music_path)
    @path=test_music_path
  end
  def files
    @@all = Dir.entries(path).grep(/[\w\s\d-]*.mp3\z/)
  end
  def import
    self.files.each do |file|
      Song.create_from_filename(file)
    end
  end
end
