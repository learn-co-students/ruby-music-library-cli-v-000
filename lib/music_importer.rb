class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    Dir[File.join(self.path, '/*.mp3')].map { |e| e.gsub(/.*\/mp3s\//, "") }
  end

  def import
    self.files.each do |filename|
      Song.create_from_filename(filename)
    end
  end
end
