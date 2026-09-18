class Weight
  def get_average(weights)
    count = weights.length
    if count == 0
      p "No weights recorded"
      return
    end

    total = weights.reduce { |sum, number| sum + number }

    total / count.to_f
  end

  def convert_weight_to_lbs(weights)
    if weights.empty?
      p "No weights recorded"
      return
    end

    weights_lbs = weights.map { |weight| weight * 2.205 }

    weights_lbs
  end
end
