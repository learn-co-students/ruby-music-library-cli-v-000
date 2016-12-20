module Concerns::Findable

  def find_by_name(var)
    self.all.find {|i| i.name == var}
  end

  def find_or_create_by_name(var)
    var_check = find_by_name(var)
    if var_check == nil
      var_check = self.create(var)
    end
    var_check
  end

end