module Concerns::Findable
  def find_by_name(name)
    all.each { |s| return s if s.name == name }
    nil
  end

  def find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end
end
