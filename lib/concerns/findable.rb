module Concerns::Findable
  def find_by_name(check_song)
    self.all.detect{|s|s.name == check_song}
  end

  def find_or_create_by_name(check_song)
    self.find_by_name(check_song) || self.create(check_song)
  end
end
