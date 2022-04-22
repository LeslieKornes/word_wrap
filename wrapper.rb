class Wrapper
  def self.wrap(string, width)
    return string if string.length <= width

    incoming_strings = string.split

    rows = []

    first_str = incoming_strings.first

    if first_str.length > width
      string_length_counter = first_str.length
      while string_length_counter >= width
        rows << first_str[0...width]
        first_str.delete_prefix!(first_str[0...width])
        string_length_counter -= width
      end
    else
      rows << incoming_strings.shift
    end

    incoming_strings.each do |s|
      if (rows.last.length + s.length) < width
        x = rows[-1]
        rows[-1] = "#{x} " + "#{s}"
      # _really_ hate having to repeat the above code here XO
      elsif s.length > width
        string_length_counter = s.length
        while string_length_counter > width
          rows << s[0...width]
          s.delete_prefix!(s[0...width])
          string_length_counter -= width
        end
        rows << s
      else
        rows << s
      end
    end
    puts rows
  end
end


