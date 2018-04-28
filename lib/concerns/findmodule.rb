module Concerns::Findable
  #find_by_name
  #find_or_create_by_name
  def find_by_name(name)
    self.all.detect{|s| s.name == name}
  end

  def find_or_create_by_name(name)
    detected_song = find_by_name(name)
    if detected_song
      detected_song
    else
      self.create(name)
    end
  end

end
