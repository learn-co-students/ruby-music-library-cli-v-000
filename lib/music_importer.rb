class MusicImporter
  attr_accessor :path
  def initialize(path)
    @path = path
  end

  def files
    song_names = Dir.glob("#{@path}/*.mp3")
    song_names.collect {|song_name| song_name.gsub("#{@path}/", "")}
  end

  def import
    self.files.collect {|filename| Song.create_from_filename(filename)}
  end
end