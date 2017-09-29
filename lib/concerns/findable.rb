module Concerns::Findable
 def find_by_name(song_name)
    self.all.find do |song|
      song.name == song_name
    end
  end

  def find_or_create_by_name(song_name)
    self.find_by_name(song_name) == nil ? self.create(song_name) : self.find_by_name(song_name)
  end
end