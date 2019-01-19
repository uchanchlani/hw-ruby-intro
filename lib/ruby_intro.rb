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
  # a stores the highest elem received so far
  a = nil
  # b stores the second highest elem received so far
  b = nil
  arr.each do |elem|
    # if a is not yet set, set it, used to store first elem
    if a==nil
      a=elem

    # if b is not yet set, set it, used to store second elem
    # or if the curr elem found is greater than b then it is either highest or second highest
    elsif b==nil or b<elem
      b=elem
      # if the curr elem found is even greater than a then swap the two to maintain definition of a and b
      if a<b
        a,b=b,a
      end
    end

  end

  # mostly because there were no elems in the array
  if a==nil
    a=0
    b=0
  # only 1 elem present in the array
  elsif b==nil
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
  return "Hello, " + name
end

def starts_with_consonant? s
  # empty string returns false by default
  if s.length < 1
    return false
  end
  # capitalize so that we deal with only capitals
  letter = s[0].capitalize

  # if out of bound i.e. not a valid english alphabet, return false
  if letter < "A" or letter > "Z"
    return false
  end

  # if vowel return false else true
  return !%w(A E I O U).include?(letter)
end

def binary_multiple_of_4? s
  # check for invalid string by regex match
  unless /^[01]+$/.match(s)
    return false
  end

  # special case when the string is of length 1 and it is 0
  if s == "0"
    return true
  end

  # check last 2 char if 0 then multiple of 4
  return s[s.length-2, 2] == "00"
end

# Part 3

class BookInStock
  # getter and setter
  attr_accessor :isbn, :price
  @isbn
  @price

  def initialize(isbn, price)
    # check arg error for isbn
    if isbn.length==0
      raise ArgumentError, "empty isbn"
    end

    # check arg error for price
    if price <= 0.0
      raise ArgumentError, "price incorrect"
    end

    #using setter of isbn rather then directly setting it
    self.isbn = isbn
    self.price = price
  end

  # using string formatter
  def price_as_string
    return "$%.2f" % @price
  end
end
