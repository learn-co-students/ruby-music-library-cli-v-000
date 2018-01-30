class MusicImporter

  def initialize(path)
    @path = path
  end

  def path
    @path
  end

  def music
    @music
  end

  def files
    songs = []
    music = Dir.entries(path)
    music.each {|song| songs << song if song.end_with?(".mp3")}
    songs
  end

  def import
    self.files.each {|filename| Song.create_from_filename(filename)}
  end


end