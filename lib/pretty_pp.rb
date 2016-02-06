require "pretty_pp/version"

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
