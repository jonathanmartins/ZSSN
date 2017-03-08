module Percentage
  def percentage(part, whole)
    return ((part.to_f / whole.to_f) * 100).round(3).to_s + "%"
  end
end
