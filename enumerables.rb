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
    