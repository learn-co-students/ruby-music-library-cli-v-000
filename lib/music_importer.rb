
class MusicImporter

  attr_reader :path, :list_of_files, :file_names

  def initialize(path)
    @path = path
  end

  def files
    @list_of_files = Dir.entries(@path)
    @list_of_files.tap do |x|
      x.delete(".")
      x.delete("..")
    end
  end
# Songs, Artists and Genres get saved to self.all
# For "this import" info make assign an instance variable to this object at #import
  def import
    self.files.collect do |file_name|
      Song.create_from_filename(file_name)
    end
  end

  def make_file_names
    @file_names = self.import.collect {|x| x.file_name}
  end
end
