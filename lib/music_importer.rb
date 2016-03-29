require 'pry'
class MusicImporter
attr_accessor :path
  def initialize(path = "db/mp3s")
    @path = path
  end

  def files
  @files ||= Dir.entries(@path)[2..-1]

end

def import
files.each do |filename|
Song.create_from_filename(filename)


end
end


end
