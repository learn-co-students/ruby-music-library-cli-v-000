
class MusicImporter
  
  attr_reader :path
  
  def initialize(file_path)
    @path = file_path
  end
  
  def files
    Dir.glob("#{path}/*").collect{|file| file.gsub("#{path}/", '')}
    # Dir.glob returns filenames found by expanding pattern
    # * matches any filename
    # .gsub returns string with all occurrences of pattern (here is the path name and then /) and replaces it with the second argument which is just '' here
  end
  
  def import
    files.each do |filename|
      Song.create_from_filename(filename)
    end
  end

  
end