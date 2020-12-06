yes_counts = []
input = File.read('input.txt').split(/^\n/)

input.each do |group|
  group_size = group.split("\n").count
  yeses = group.gsub(/\s+/, "").split("")
  yeses_counts = yeses.each_with_object(Hash.new(0)) { |w, c| c[w] += 1 }
  yes_counts << yeses_counts.values.count(group_size)
end

pp "There were #{yes_counts.size} groups and #{yes_counts.inject(:+)} matching yeses}"
