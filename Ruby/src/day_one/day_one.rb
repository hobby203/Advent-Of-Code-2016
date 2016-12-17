class DayOnePartOne

  def get_distance(instruction_string)
    directions = to_array(instruction_string)
    calculate_distance(directions)
  end

  private def calculate_distance(directions)
    current_pos = [0,0,Direction::NORTH]
    directions.each do |d|
      current_pos = update_pos(current_pos, d)
    end
    current_pos[0]+current_pos[1]
  end

  private def update_pos(pos,d)
    heading = d[0]
    distance = d[1..-1].to_i
    pos = update_heading(pos,heading)
    case pos[2]
      when Direction::NORTH, Direction::EAST
        pos[1] += distance
      when Direction::SOUTH, Direction::WEST
        pos[1] -= distance
      else
        puts 'oh dear'
    end
    pos
  end

  private def update_heading(pos, heading)
    case heading
      when 'R'
        pos[2] = (pos[2]+1)%4
      when 'L'
        pos[2] = (pos[2]-1)%4
      else
        raise ArgumentError, 'Invalid heading supplied', caller
    end
    pos
  end

  private def to_array(string)
    trimmed_string = string.delete ' '
    trimmed_string.split(',')
  end

  module Direction
    NORTH = 0
    EAST = 1
    SOUTH = 2
    WEST = 3
  end
end