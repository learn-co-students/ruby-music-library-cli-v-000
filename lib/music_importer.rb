class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
      file = Dir.glob("#{path}/*.mp3")
      no_path_file =  Dir.entries(self.path)
      no_path_file.delete("..")
      no_path_file.delete(".")
      no_path_file
  end


end
