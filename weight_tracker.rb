def get_weight_count
  print "How many weight do you want to input? "
  weight_count = gets.chomp.to_i

  if weight_count <= 0
    p "Error: Invalid weight count"
    return
  end

  weight_count
end

def insert_weights(weights, weight_count)
  weight_count.times do |num|
    print "Enter weight #{num + 1}: "
    weight = gets.chomp.to_f

    if weight <= 0
      p "Weight must be a positive number"
      return
    end

    weights.push(weight)
  end
end

def get_average(weights)
  count = weights.length
  if count == 0
    p "No weights recorded"
    return
  end

  total = weights.reduce { |sum, number| sum + number }

  total / count.to_f
end

def list_weights(weights)
  if weights.empty?
    p "No weights recorded"
    return
  end

  p "Weights: #{weights}"
end

weights = []

p "Welcome to Weight Tracker"
loop do
  p "1. Insert Weight"
  p "2. Calculate Average"
  p "3. List Weight"
  p "4. Exit"
  print "> "
  choice = gets.chomp.to_i

  case choice
    when 1
      weight_count = get_weight_count
      unless weight_count == nil
        insert_weights(weights, weight_count)
      end
    when 2
      average = get_average(weights)
      p "Average: #{average}"
    when 3
      list_weights(weights)
    when 4
      break
    else "Invalid Input"
  end
end

p "Bye :)"
