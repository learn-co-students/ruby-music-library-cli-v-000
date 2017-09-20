module Concerns::Findable

  def find_by_name(search_name)
    self.all.detect {|s| s.name == search_name}
  end

  def find_or_create_by_name(search_name)
      song = find_by_name(search_name)
    if !song
      create(search_name)
    elsif song.name == search_name
      song
    end
  end


end
