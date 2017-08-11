class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
  files = []
  Dir.entries(@path).each { |file| files << file if file.end_with?("mp3") }
  files
end

def import
  self.files.each { |file| Song.create_from_filename(file) }
end

end
