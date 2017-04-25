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
    self.class.all.each do |file|
      Song.create_from_filename(file)
    end
  end
  def self.all
    @@all
  end
end
