seat_ids = []

input = File.read('input.txt').split(/\n/)

def seat_id(row, column)
  row * 8 + column
end

def locate_in_range(range, front_char, back_char, pattern)
  front, back = split_array(range.to_a)

  case pattern[0]
  when front_char
    locate_in_range(front, front_char, back_char, pattern[1..-1])
  when back_char
    locate_in_range(back, front_char, back_char, pattern[1..-1])
  else
    front[0]
  end
end

def split_array(array)
  middle = (array.size.to_f / 2).ceil
  [array[0...middle], array[middle..-1]]
end

input.each do |record|
  row = locate_in_range(0..127, "F", "B", record[0..6])
  column = locate_in_range(0..7, "L", "R", record[7..10])
  seat_ids << seat_id(row, column)
end

puts "There are #{seat_ids.count} seats of which #{seat_ids.max} is the higest id"
