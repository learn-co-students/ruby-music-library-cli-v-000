require_relative '../concerns/findable.rb'

class MusicImporter
  extend Concerns::Findable

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(path).select { |file| file.end_with?(".mp3") }
  end

  def import
    self.files.each { |filename| Song.new_from_filename(filename) }
  end
end
