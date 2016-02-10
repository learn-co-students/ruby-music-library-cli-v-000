class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.open(self.path).collect do |file| 
      if file.include?(".mp3")
        file
      end
    end.compact
  end

  def import
    self.files.each {|file| Song.create_from_filename(file)}
  end
end