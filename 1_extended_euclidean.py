import math

def xgcd(a, b, s1 = 1, s2 = 0, t1 = 0, t2 = 1):
   """ Calculates the gcd and Bezout coefficients, 
   using the Extended Euclidean Algorithm (recursive).
   (Source: extendedeuclideanalgorithm.com/code) 
   """
   if(b == 0):
      return abs(a), 1, 0
   
   q = math.floor(a/b)
   r = a - q * b
   s3 = s1 - q * s2
   t3 = t1 - q * t2
   
   #if r==0, then b will be the gcd and s2, t2 the Bezout coefficients
   return (abs(b), s2, t2) if (r == 0) else xgcd(b, r, s2, s3, t2, t3)


if __name__ == '__main__':
    a = 240
    b = 46
    gcd, s, t = xgcd(a, b)
    print(f"The gcd of {a} and {b} is {gcd}.")
    print(f"The Bezout coefficients are {s} and {t}.")