# When done, submit this entire file to the autograder.

# Part 1

def sum arr
  res = 0
  arr.each do |a|
    res += a
  end
  return res
end

def max_2_sum arr
  a = nil
  b = nil
  arr.each do |elem|
    if a==nil
      a=elem
    elsif b==nil or b<elem
      b=elem
    end

    if a!=nil and b!=nil and a<b
      a,b=b,a
    end
  end

  if a==nil
    a=0
  end
  if b==nil
    b=0
  end
  return a+b
end

def sum_to_n? arr, n
  # If there are less than 2 elems then we return false
  if arr.length<2
    return false
  end

  # The algo used runs in O(n log n),
  # we sort the array,
  # then for every element we search for the counter element in log n using binary search
  # If found return true, else continue the search
  # if no element found return false

  # sort in reverse order
  arr.sort! {|a, b| b <=> a}

  # we iterate in reverse order
  # Reason for reverse order iteration is that bsearch will return the first element's index which satisfies the condition
  # in case when n is even and we have two elements with value n/2, n/2
  # in this case because we search from backward, we encounter the later n/2 and bsearch will return the former n/2 and thus because we will get
  # two different indices, we will return true.
  # Had we done forward search, the condtion marked as THIS would have ignored the case that we discussed
  arr.to_enum.with_index.reverse_each do |val, idx|
    # break at this point (Why?)
    if val > n/2
      break
    end

    # search for other index (bsearch returns the first index which "MAY" satisfy the condition we want)
    other_idx = arr.bsearch_index {|a| a <= (n-val)}

    # if we didn't get the index or we get the same element's index which we are searching, this means we didn't got any element so we continue our search
    # THIS
    if other_idx==nil or other_idx==idx
      next
    end

    # if the two values are found we break with returning true
    if (val + arr[other_idx]) == n
      return true
    end
  end

  # else we return false
  return false
end

# Part 2

def hello(name)
  # YOUR CODE HERE
end

def starts_with_consonant? s
  # YOUR CODE HERE
end

def binary_multiple_of_4? s
  # YOUR CODE HERE
end

# Part 3

class BookInStock
# YOUR CODE HERE
end
