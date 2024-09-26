class MusicImporter

  attr_reader :path

  def initialize(path)
    @path = path
    full_path = self.path + "/*.mp3"
    filenames_with_path = Dir[full_path]
    @files = filenames_with_path.collect { |e| short_name(e) }
  end
  
  def files
    @files
  end
  
  def import
    self.files.each { |e| Song.create_from_filename(e) }
  end
  
  private
  
  def short_name (name)
    name.sub!(/^.*mp3s\//, "")
    name
  end

end