module Concerns::Findable
  def find_by_name(name)
    all.detect{ |s| s.name == name}
  end

  def find_or_create_by_name(name)
    if find_by_name(name)
      find_by_name(name)
    else
      new_entry = create(name)
    end
  end
end
