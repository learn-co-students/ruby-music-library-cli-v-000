module Concerns::Findable
  def find_by_name(song_name)
    all.detect { |s| s.name == song_name }
  end

  def find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create(song_name)
  end
end