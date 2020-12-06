yes_counts = []
input = File.read('input.txt').split(/^\n/)

input.each do |group|
  yes_counts << group.gsub(/\s+/, "").split("").uniq.count
end

pp "There were #{yes_counts.size} groups and #{yes_counts.inject(:+)} total yeses"
