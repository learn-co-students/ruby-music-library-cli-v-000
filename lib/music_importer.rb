class MusicImporter
  attr_reader :path

  def initialize(files_path)
    @path = files_path
  end

  def files
    Dir["#{@path}/*.mp3"].collect do |file|
      file[/#{Regexp.escape(@path)}\/(.*)/, 1]
    end
  end

  def import
    files.each do |file|
      Song.create_from_filename(file)
    end
  end
end