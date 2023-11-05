from math import cos, pi
from random import random, seed

seed(10)

pi_random = lambda: (2 * random() - 1) * pi  # random returns float from [0; 1) => pi_random returns float from [-pi, pi)

def solve(x: float):
    cos_x = 1
    prev = 1
    cur = 0
    k = 1

    eps = 0.001

    while True:
        m = - x * x / ((2*k - 1)*(2*k))
        cur = prev * m

        if abs(cur / cos_x) < eps:
            cos_x += cur
            break

        cos_x += cur
        prev = cur
        k += 1


    return cos_x

def generate():
    n = 10
    dmn = [pi_random() for _ in range(n)]
    rng = [solve(x) for x in dmn]

    true = [cos(x) for x in dmn]
    
    for x, our, py in zip(dmn, rng, true):
        print(f"x = {x}, therefore our cos(x) = {our}.\tPython cos(x) = {py}")

if __name__ == "__main__":
    generate()
