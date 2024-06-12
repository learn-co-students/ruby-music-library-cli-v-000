module Concerns::Findable

  def find_by_name(name)
    all.detect {|all| all.name == name}
  end

  def find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

  def create(name)
    new(name).tap {|x| x.save}
  end

  def destroy_all
    all.clear
  end

end
