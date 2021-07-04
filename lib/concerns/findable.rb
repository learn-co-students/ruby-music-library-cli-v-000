module Concerns::Findable
  def find_by_name(name)
    all.find { |inst| inst.name == name }
  end

  def find_or_create_by_name(name)
    result = find_by_name(name)
    result ? result : create(name)
  end
end
