module Concerns::Findable
  def find_by_name(name)
    all.detect {|e| e.name == name}
  end

  def find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end
end
