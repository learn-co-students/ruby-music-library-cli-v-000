module Concerns::Findable

  def find_by_name(name)
    all.detect {|s| s.name == name}
  end

  def find_or_create_by_name(name)
    song = find_by_name(name)
    if song
      song
    else
      create(name)
    end
  end

end
