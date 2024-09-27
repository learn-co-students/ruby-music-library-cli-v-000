class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    files = []

    Dir["#{@path}/*"].each do |file_path|
      files << File.basename(file_path)
    end

    files
  end

  def import
    self.files.each do |mp3_file|
      new_song = Song.create_from_filename(mp3_file)
    end
  end
end
