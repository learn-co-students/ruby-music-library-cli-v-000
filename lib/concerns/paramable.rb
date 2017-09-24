module Concerns::Paramable

  def to_param
    name.downcase.gsub(' ', '-')
  end

end
