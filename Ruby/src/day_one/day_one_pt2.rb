class DayOnePartTwo

  def get_distance(instruction_string)
    directions = to_array(instruction_string)
    return calculate_distance(directions)
  end

  private def calculate_distance(directions)
    current_pos = [0,0,Direction::N]
    directions.each do |d|
      update_pos(current_pos, d)
    end
    return current_pos[0]+current_pos[1]
  end

  private def update_pos(pos,d)
    heading = d[0]
    distance = d[1..-1].to_i
    update_heading(pos,heading)
    case pos[2]
      when Direction::N, Direction::E
        pos[1] += distance
      when Direction::S, Direction::W
        pos[1] -= distance
      else
        puts "oh dear"
    end

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
            return pos,heading
  end

  private def to_array(string)
    trimmed_string = string.delete " "
    return trimmed_string.split(',')
  end

  module Direction
    N = 0
    E = 1
    S = 2
    W = 3
  end
end