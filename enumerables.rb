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