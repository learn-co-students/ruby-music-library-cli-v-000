# require_relative "../config/environment.rb"
class MusicImporter
  attr_accessor :path, :files

  def initialize(path)
    self.path = path
    self.files = Dir.glob("#{self.path}/*.mp3").collect { |f| f.sub("#{self.path}/","") }
  end

  def import
    files.each { |file| Song.create_from_filename(file) }
  end

end
# test_music_path = "./spec/fixtures/mp3s"
# music_importer = MusicImporter.new(test_music_path)
# music_importer.import
# binding.pry
