hash = { abc: 'hello', another_key: 123, 4567 => 'third' }

keys = hash.each_key.to_a  # -> [abc, another_key, 4567]

sorted_keys = keys.map do |n|
    n.to_s.length 
end # -> [3,11,4]

unsorted_keys_lenghts = keys.zip(sorted_keys).to_h # -> {:abc=>3, :another_key=>11, 4567=>4}

sorted_keys = (unsorted_keys_lenghts.sort_by(&:last)).map! do |f|
    f[0]
end