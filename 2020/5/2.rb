def seat_id(row, column)
  row * 8 + column
end

def locate_in_range(range, front_char, back_char, pattern)
  front, back = split_array(range)

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

rows = (0..127).to_a
columns = (0..7).to_a
seat_ids = []
possible_seat_ids = rows.map { |r| columns.map { |c| seat_id(r, c) } }.flatten
input = File.read('input.txt').split(/\n/)

input.each do |record|
  row = locate_in_range(rows, "F", "B", record[0..6])
  column = locate_in_range(columns, "L", "R", record[7..10])
  seat_ids << seat_id(row, column)
end

puts "There are #{possible_seat_ids.count} possible seat ids of which #{seat_ids.count} are accounted for which the difference is #{possible_seat_ids - seat_ids}"
