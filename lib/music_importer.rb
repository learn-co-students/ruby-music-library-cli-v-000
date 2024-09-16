class MusicImporter
  attr_accessor :path, :files

  def initialize(path)
    @path = path
  end

  def files
    files = Dir.entries(@path)
    files.delete_if {|file| file == "." || file == ".."}
  end

  def import
    files.each do |file|
      Song.create_from_filename(file)
    end
  end

  def print_files
    counter = 1
    files.each do |file|
      puts "#{counter}. #{file}".gsub("mp3", "")
      counter += 1
    end
  end

end