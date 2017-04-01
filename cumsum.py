a = range(20)
runningTotal = []
for n in range(len(a)):
    new = runningTotal[n-1] + a[n] if n > 0 else a[n]
    runningTotal.append(new)
