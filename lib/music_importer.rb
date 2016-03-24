class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    file_list = Dir.entries(self.path)
    file_list.select {|f| f[-4..-1] == '.mp3'}
  end

  def import
    mp3s = files
    mp3s.each {|mp3| Song.create_from_filename(mp3)}
  end





end
