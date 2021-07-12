def compare(a,b)
    (a.upcase.chars) == (b.upcase.chars)

end

compare('nice', 'nice')
compare('how', 'who')
compare('GoOd DaY', 'gOOd dAy')
compare('foo', 'food')


