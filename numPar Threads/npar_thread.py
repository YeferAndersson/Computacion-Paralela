from threading import Thread
import time
import math
def numPar1(n):
    time_ini = time.time()
    print("***Inicio numPar1***")
    i = 2
    while(i <= n):
        print(i)
        i = i + 2
    print("Total: ", math.floor(n/2))
    print("***Fin numPar1***")
    time_end = time.time()
    total = time_end - time_ini
    print("Tiempo: ", total)

def numPar2(n):
    time_ini = time.time()
    print("***Inicio numPar2***")
    for i in range(1,n+1):
        if i % 2 == 0:
            print(i)
    print("Total: ", math.floor(n/2))
    print("***Fin numPar2***")
    time_end = time.time()
    total = time_end - time_ini
    print("Tiempo: ", total)

t1 = Thread(target=numPar1, args=(1000,))
t2 = Thread(target=numPar2, args=(1000,))
t1.start()
t2.start()