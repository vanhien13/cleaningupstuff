# Python code to split into even and odd lists
# Funtion to split
def Split(mix):
    ev_li = []
    od_li = []
    for i in mix:
        if (i % 2 == 0):
            ev_li.append(i)
        else:
            od_li.append(i)
    print("Even lists:", ev_li)
    print("Odd lists:", od_li)
 
# Split odd and even indexes
mix = [2, 5, 13, 17, 51, 62, 73, 84, 95]
Split(mix)

def even_odd_split(seq):
    """
    >>> even_odd_split([4, 8, 12, 16])
    [4, 12, 8, 16]
    >>> even_odd_split([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
    [1, 3, 5, 7, 9, 2, 4, 6, 8, 10]
    """
    assert(len(seq) % 2 == 0)
    assert(len(seq) > 1)

    def _split(seq):
        if len(seq) == 0: return [], []

        a, b = _split(seq[2:])
        return [seq[0]] + a, [seq[1]] + b
    a, b = _split(seq)
    return a + b

if __name__ == '__main__':
    import doctest
    doctest.testmod()
    
    
    #Another way
    def f(l):
    if len(l) == 1:
        # only one element left
        return l
    if len(l) % 2 == 0:
        # length is even
        return l[:1] + f(l[1:])
    else:
        # length is odd
        return f(l[1:]) + l[:1]

    def split_list(l):
    def sub(index, l, odd, even):
        try:
            if index % 2 == 0:
                even.append(l[index])
            else:
                odd.append(l[index])
        except IndexError: # we've reached the end of the list
            return odd, even
        return sub(index+1, l, odd, even) # recursive call by advancing the index
    return sub(0, l, [], []) # initial call to function
