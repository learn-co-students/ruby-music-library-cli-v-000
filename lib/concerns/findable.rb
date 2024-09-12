module Concerns::Findable
  def find_by_name(name)
    all.detect {|thing| thing.name == name}
  end

  def find_or_create_by_name(name)
    if found = find_by_name(name)
      return found
    else
      create(name)
    end
  end

end
