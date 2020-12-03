matches = File.readlines('input.txt').select do |line|
  position_true, position_false, letter, password = line.strip.gsub(":", "").split(/[- ]/)
  [password[position_true.to_i - 1], password[position_false.to_i - 1]].count(letter) == 1
end

puts "There are #{matches.count} valid passwords"
