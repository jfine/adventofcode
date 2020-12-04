count = 0
right = 3
down = 1

input = File.readlines('input.txt').map do |line|
  line.strip.split("")
end

(0...input.size).step(down) do |number|
  count += 1 if input[number][number * right % input[number].size] == "#"
end

puts "You would encounter #{count} trees" # 294
