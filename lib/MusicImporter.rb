
class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    mp3s = []
    files = Dir.entries(path)

    files.each do |file|
      if file.end_with?(".mp3")
        mp3s << file
      end
    end

    mp3s
  end

  def import 
    self.files.each {|filename| Song.create_from_filename(filename)}
  end

end