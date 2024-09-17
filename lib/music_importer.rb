
class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(path).select {|f| !File.directory? f}
  end

  def import
    files.each{ |filename| Song.create_from_filename(filename) }
  end

end

# rspec spec/009_music_importer_spec.rb
