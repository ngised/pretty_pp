require "pretty_pp/version"

=begin
"\e[30m#{s}\e[0m" # Black
"\e[31m#{s}\e[0m" # Red
"\e[32m#{s}\e[0m" # Green
"\e[33m#{s}\e[0m" # Yellow
"\e[34m#{s}\e[0m" # Blue
"\e[35m#{s}\e[0m" # Magenta
"\e[36m#{s}\e[0m" # Cyan
"\e[37m#{s}\e[0m" # White
=end

module PrettyPp
  @@enable = true
  @@stack = []

  def ppp_on
    @@enable = true
  end

  def ppp_off
    @@enable = false
  end
  
  def ppp s, t
    if @@enable
      print "  " * @@stack.size
      print "\e[36m#{s}\e[0m: \e[33m#{t}\e[0m\n"
    end
  end

  def ppp_indent
    if @@enable
      print "  " * @@stack.size
    end
  end

  def ppp_begin s, t
    if @@enable
      print "  " * @@stack.size
      print "\e[32mbegin\e[0m \e[36m#{s}\e[0m: \e[33m#{t}\e[0m\n"
      @@stack.push([s, Time.now])
    end
  end

  def ppp_end
    if @@enable
      pop = @@stack.pop()
      print "  " * @@stack.size
      print "\e[32mend\e[0m \e[36m#{s}\e[0m: in \e[33m#{(Time.now - pop[1]).second}\e[0m sec\n"
    end
  end
end
