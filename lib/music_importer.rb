class MusicImporter

  attr_accessor :list_of_filenames, :path

  def initialize(path)
    @path = path
  end

  def files
    @list_of_filenames = Dir.glob("#{@path}/*.mp3")
    @list_of_filenames.collect { |filename| filename.gsub("#{@path}/", "")}
  end

  def import
    files.each do |filename|
      Song.new_from_filename(filename)
    end
  end

end
