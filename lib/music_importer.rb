class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    files = []
    Dir.entries(path).collect do |entry|
      if entry.include?(".mp3")
        files << entry
      end
    end
    files
  end

  def import
    self.files.each {|file_name| Song.new_from_filename(file_name).save}
  end

end