slope_counts = []
slopes = [
  { right: 1, down: 1 },
  { right: 3, down: 1 },
  { right: 5, down: 1 },
  { right: 7, down: 1 },
  { right: 1, down: 2 }
]

input = File.readlines('input.txt').map do |line|
  line.strip.split("")
end

slopes.each do |slope|
  right, down, count = slope[:right], slope[:down], 0

  (0...input.size).step(down) do |number|
    count += 1 if input[number][number * right % input[number].size] == "#"
  end

  slope_counts << count
end

puts "You would encounter #{slope_counts.inject(:+)} trees when multiplied is #{slope_counts.inject(:*)}"
