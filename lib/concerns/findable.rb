module Concerns::Findable

  def find_by_name(name)
    all.find { |object| object.name == name }
  end

  def find_or_create_by_name(name)
    result = find_by_name(name)
    result ? result : create(name)
  end


end
