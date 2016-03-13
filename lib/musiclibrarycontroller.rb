require 'pry'

class MusicLibraryController
  attr_accessor :path, :import

  @@new = []

  def initialize(path="./db/mp3s")
    @path = path
    import = MusicImporter.new(path)
    import.import
  end

  def call
    input = gets.chomp
  end
end