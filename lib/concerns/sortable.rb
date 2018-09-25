module Concerns::Sortable
  def sorted_by_name
    all.sort_by { |e| e.name }.uniq
  end
end
