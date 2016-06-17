class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end


  def files
    Dir.entries(path).select {|file|file.gsub(/\a\s|\.\w+/,"")}
  end

end
