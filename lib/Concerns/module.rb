module Concerns::Findable

  def find_by_name(name)
    all.find{|element| element.name == name}
  end

  def find_or_create_by_name(name)
    new_name = nil
    new_name = find_by_name(name)
    new_name == nil ? create(name) : new_name
  end

end
