module  Concerns::Findable
  def find_by_name(name)
    all.detect{|a| a.name}
  end

  def find_or_create_by_name(name)
    if all.detect { |a| a.name }
      all.detect { |a| a.name}
    else
      create(name)
    end
  end
end
