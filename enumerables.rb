module Enumerable
    def my_each 
        return to_enum unless block_given?

        arr = to_a
        i = 0
        while i < arr.length
            yield(arr[i])
            i+=1
        end
    end

    def my_each_with_index
        return to_enum unless block_given?

        arr = to_a
        i = 0
        while i < arr.length
            yield(arr[i], i)
            i+=1
        end
    end

    def my_select
        return to_enum unless block_given?

        an_arr = []
        my_each do|i|
            an_arr.push(i) if yield(i)
        end
        an_arr
    end

    def my_all?(*arg)
        if arg.empty?
            my_each {|i| return false unless yield(i)} if block_given?

            return true if block_given?

            my_each{|i| return false unless i}
        else
            my_each { |i| return false unless i.match(arg[0]) } if arg[0].class == Regexp

            return true if arg[0].class == Regexp

            my_each { |i| return false unless i.class == arg[0] } if arg[0].is_a?(Class)
      return true if arg[0].is_a?(Class)

      my_each { |i| return false unless i == arg[0] }
    end
    true
  end

    def my_any(*arg)
        if arg.empty?
            my_each { |i| return true if yield(i) } if block_given?
      
            return false if block_given?
      
            my_each { |i| return true if i }
          else
            my_each { |i| return true if i.match(arg[0]) } if arg[0].class == Regexp
      
            return false if arg[0].class == Regexp
      
            my_each { |i| return true if i.class == arg[0] } if arg[0].is_a?(Class)
            return false if arg[0].is_a?(Class)
      
            my_each { |i| return true if i == arg[0] }
          end
          false
        end
      


