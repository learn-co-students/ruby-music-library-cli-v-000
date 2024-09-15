class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    list_of_filenames = []
    Dir.foreach(path) do |filename|
      if filename == '.' or filename == '..'
        next
      else
        list_of_filenames << filename
      end
    end
    list_of_filenames.sort!{|x, y| x <=> y} # test
  end

  def import
    list_of_filenames = files
    list_of_filenames.each{|filename| Song.create_from_filename(filename)}
  end

end



