class MusicImporter

  attr_accessor :path

  def initialize(filepath)
    @path = filepath
  end

  def files
    files_array = Dir.entries("#{self.path}")
    only_mp3s = []
    files_array.each do |file|
      if file.include?(".mp3")
        only_mp3s << file
      end
    end
    only_mp3s = only_mp3s.sort
    only_mp3s
  end

  def import
    self.files.each do |file|
      song = Song.create_from_filename(file)
    end
  end

end