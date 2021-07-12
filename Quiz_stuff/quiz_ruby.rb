def product(array)
    num = 1
    algo = array.map { |i| num  = num * i }
    if algo == nil 
        algo = 0
    end

    algo.last
end





puts product([1, 4, 21])
puts product([-4, 2.3e12, 77.23, 982, 0b101])
puts product([-3, 11, 2])
puts product([8, 300])
puts product([234, 121, 23, 945, 0])
puts product(1..5)


a.inject(:*)