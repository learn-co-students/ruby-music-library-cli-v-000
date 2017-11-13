class MusicImporter

  def initialize(new_path)
      @path = new_path
  end

  def path
    @path
  end

  def files
    file_list = Dir[path + "/*.mp3"]
    cleaned_file_list = file_list.collect {|filename| filename.gsub(path + "/", "")}
  end

  def import
    @library = self.files.collect {|filename| Song.create_from_filename(filename)}
  end
end
