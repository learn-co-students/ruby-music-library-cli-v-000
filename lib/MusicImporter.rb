#require_relative
class MusicImporter

  def initialize(path ='../spec/fixtures/mp3s')
    #accepts file path to directory of MP3 files
    @path = path
  end

  def path
    @path
  end

  def import
    files.each do |filename|
    Song.create_from_filename(filename)
  end

  end

  def files
    filenames = Dir.entries(path).reject{|filename| filename == "." || filename == ".."}
  end

end
