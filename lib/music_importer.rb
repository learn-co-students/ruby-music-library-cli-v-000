class MusicImporter

  attr_accessor :path


  def initialize(string)
    @path=string
  end


  def files
    array_of_files = Dir.entries(@path)
    array_of_files.select {|f| !File.directory? f}
  end

  def import
    self.files.each do |file|
      Song.create_from_filename(file)
    end

  end
  
end
