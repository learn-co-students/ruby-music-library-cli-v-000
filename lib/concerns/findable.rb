module Concerns::Findable

  def find_by_name(name)
    binding.pry
    all.detect {|song| song.name == name}
  end

  def find_or_create_by_name(name)
    binding.pry
    find_by_name(name) || create(name)
  end




end
