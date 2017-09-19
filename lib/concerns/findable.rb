module Concerns::Findable

  def find_by_name(name)
    all.detect { |x| x.name == name }
  end

  def find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end
end
