require 'pry'
module Concerns::Findable

  def find_by_name(name)
    all.find { |instance| instance.name == name }
  end

  def find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

  def create(name)
    new(name).tap { |obj| obj.save }
  end

end