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

# ** this is DRY'd up a bit. the reqs said only to have one `wrap` method so i had to repeat above **
# class Wrapper
#   def self.wrap(string, width)
#     return string if string.length <= width

#     incoming_strings = string.split

#     rows = []

#     first_str = incoming_strings.first

#     if first_str.length > width
#       split_longer_words(first_str, width, rows)
#     else
#       rows << incoming_strings.shift
#     end

#     incoming_strings.each do |s|
#       if (rows.last.length + s.length) < width
#         x = rows[-1]
#         rows[-1] = "#{x} " + "#{s}"
#       elsif s.length > width
#         split_longer_words(s, width, rows)
#         rows << s
#       else
#         rows << s
#       end
#     end
#     puts rows
#   end

#   def self.split_longer_words(string, width, rows_array)
#     string_length_counter = string.length
#       while string_length_counter >= width
#         rows_array << string[0...width]
#         string.delete_prefix!(string[0...width])
#         string_length_counter -= width
#       end
#   end
# end
