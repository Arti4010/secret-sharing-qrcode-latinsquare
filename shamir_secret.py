from __future__ import division
from __future__ import print_function

import random
import functools

# 12th Mersenne Prime
# (for this application we want a known prime number as close as
# possible to our security level; e.g.  desired security level of 128
# bits -- too large and all the ciphertext is large; too small and
# security is compromised)
# _PRIME = 2 ** 127 - 1
#_PRIME = 131611
_PRIME = 370248451
# 13th Mersenne Prime is 2**521 - 1

_RINT = functools.partial(random.SystemRandom().randint, 0)


def _eval_at(poly, x, prime):
    """Evaluates polynomial (coefficient tuple) at x, used to generate a
    shamir pool in make_random_shares below.
    """
    accum = 0
    for coeff in reversed(poly):
        accum *= x
        accum += coeff
        accum %= prime
    #print(accum)
    return accum

def make_random_shares(secret, minimum, shares, prime=_PRIME):
    """
    Generates a random shamir pool for a given secret, returns share points.
    """
    if minimum > shares:
        raise ValueError("Pool secret would be irrecoverable.")
    poly = [secret] + [_RINT(prime - 1) for i in range(minimum - 1)]
    points = [(i, _eval_at(poly, i, prime))
              for i in range(1, shares + 1)]
    return points

def _extended_gcd(a, b):
    """
    Division in integers modulus p means finding the inverse of the
    denominator modulo p and then multiplying the numerator by this
    inverse (Note: inverse of A is B such that A*B % p == 1) this can
    be computed via extended Euclidean algorithm
    http://en.wikipedia.org/wiki/Modular_multiplicative_inverse#Computation
    """
    x = 0
    last_x = 1
    y = 1
    last_y = 0
    while b != 0:
        quot = a // b
        a, b = b, a % b
        x, last_x = last_x - quot * x, x
        y, last_y = last_y - quot * y, y
    return last_x, last_y

def _divmod(num, den, p):
    """Compute num / den modulo prime p

    To explain what this means, the return value will be such that
    the following is true: den * _divmod(num, den, p) % p == num
    """
    inv, _ = _extended_gcd(den, p)
    return num * inv

def _lagrange_interpolate(x, x_s, y_s, p):
    """
    Find the y-value for the given x, given n (x, y) points;
    k points will define a polynomial of up to kth order.
    """
    k = len(x_s)
    assert k == len(set(x_s)), "points must be distinct"
    def PI(vals):  # upper-case PI -- product of inputs
        accum = 1
        for v in vals:
            accum *= v
        return accum
    nums = []  # avoid inexact division
    dens = []
    for i in range(k):
        others = list(x_s)
        cur = others.pop(i)
        nums.append(PI(x - o for o in others))
        dens.append(PI(cur - o for o in others))
    den = PI(dens)
    num = sum([_divmod(nums[i] * den * y_s[i] % p, dens[i], p)
               for i in range(k)])
    return (_divmod(num, den, p) + p) % p

def recover_secret(shares, prime=_PRIME):
    """
    Recover the secret from share points
    (x, y points on the polynomial).
    """
    if len(shares) < 3:
        raise ValueError("need at least three shares")
    x_s, y_s = zip(*shares)
    return _lagrange_interpolate(0, x_s, y_s, prime)

def main(secret):
    """Main function"""
    #secret = 123456
    shares = make_random_shares(secret, minimum=3, shares=6)
    #shares = [(1010, 64085), (2304, 8087), (11280,  22009)]
    #print('Secret:                                                     ',
    #      secret)
    #print('Shares:')
    '''if shares:
        for share in shares:
            print('  ', share)'''

    print('Secret recovered from minimum subset of shares:             ',
          recover_secret(shares[:5]))

    #print('Secret recovered from a different minimum subset of shares: ',
    #      recover_secret(shares[-3:]))
    return shares


def create_secret_for_one_row(row):
    length = len(row)
    number = 0
    for value in row:
        if length > 0:
            number = number + value*pow(10, length-1)
            length = length - 1
    return number


def reconstruction(list_of_parties_share, k):
    recollect_sec_share = []

    recollect_ls = []

    if len(list_of_parties_share) >= k:
        for parties_shares in list_of_parties_share:
            recollect_sec_share = recollect_sec_share + [parties_shares['secret_share']]
        print("recoving secert is now this",recover_secret(recollect_sec_share))
        for i in range(len(list_of_parties_share[0]['ls_share'])):
            recollect_ls_share = []
            for j in range(len(list_of_parties_share)):
                recollect_ls_share = recollect_ls_share + [list_of_parties_share[j]['ls_share'][i]]
            num = recover_secret(recollect_ls_share)
            recollect_ls = recollect_ls + [num]
        print("ls is now ", recollect_ls)


if __name__ == '__main__':
    n = 6
    k = 3
    ls_order = 8
    dealer = []
    sec_secret = 7890
    # latin_square = [[1, 2, 3, 4], [2, 3, 4, 1], [3, 4, 1, 2], [4, 1, 2, 3]]
    latin_square = [[0, 1, 2, 3, 4, 5, 6, 7],[1, 2, 3, 4, 5, 6, 7, 0],[2, 3, 4, 5, 6, 7, 0, 1],[3, 4, 5, 6, 7, 0, 1, 2],[4, 5, 6, 7, 0, 1, 2, 3],[5, 6, 7, 0, 1, 2, 3, 4],[5, 6, 7, 0, 1, 2, 3, 4],[7, 0, 1, 2, 3, 4, 5, 6]]
    ls_all_shares = []
    for i in range(ls_order):
        number = create_secret_for_one_row(latin_square[i])
        ls_all_shares = ls_all_shares + [main(number)]
    print(ls_all_shares)
    sec_secret_share = main(sec_secret)
    for value in range(n):
        participants = {}
        print(value, sec_secret_share[value])
        participants['secret_share'] = sec_secret_share[value]
        temp = []
        for val in ls_all_shares:
            temp = temp + [val[value]]
        participants['ls_share'] = temp
        dealer = dealer + [participants]
    print(dealer)
    #new = [{'secret_share': (1, 239776162), 'ls_share': [(1, 296571480), (1, 285270504), (1, 6463796), (1, 240951924)]}, {'secret_share': (2, 269278275), 'ls_share': [(2, 299458468), (2, 250122380), (2, 168779323), (2, 116500369)]}, {'secret_share': (3, 88514229), 'ls_share': [(3, 9895531), (3, 277149749), (3, 140154831), (3, 31460798)]}, {'secret_share': (4, 67732475), 'ls_share': [(4, 168379571), (4, 366352611), (4, 290838771), (4, 356081662)]}, {'secret_share': (5, 206933013), 'ls_share': [(5, 34413686), (5, 147482515), (5, 250582692), (5, 349866059)]}, {'secret_share': (6, 135867392), 'ls_share': [(6, 348494778), (6, 361036363), (6, 19386594), (6, 12813989)]}]
    new = [{'secret_share': (1, 344863352), 'ls_share': [(1, 130250592), (1, 309694086), (1, 57267227), (1, 95682157), (1, 360184406), (1, 300959311), (1, 274164728), (1, 135099523)]}, {'secret_share': (2, 61210107), 'ls_share': [(2, 161202676), (2, 54567970), (2, 335285086), (2, 96753768), (2, 225141937), (2, 159747396), (2, 266070218), (2, 334900214)]}, {'secret_share': (3, 259793508), 'ls_share': [(3, 94090819), (3, 357712675), (3, 117013376), (3, 37781845), (3, 10791167), (3, 3313940), (3, 32417704), (3, 299277078)]}, {'secret_share': (4, 200116653), 'ls_share': [(4, 299163472), (4, 108382848), (4, 142948999), (4, 289014839), (4, 87380547), (4, 201907394), (4, 313704088), (4, 28230115)]}, {'secret_share': (5, 252427993), 'ls_share': [(5, 35923733), (5, 47075391), (5, 42843504), (5, 109955848), (5, 84661626), (5, 15030856), (5, 369432468), (5, 262256227)]}, {'secret_share': (6, 46479077), 'ls_share': [(6, 44868504), (6, 173790304), (6, 186945342), (6, 241101774), (6, 2634404), (6, 183181228), (6, 199602844), (6, 260858512)]}]
    #new = [{'secret_share': (1, 43046), 'ls_share': [(1, 44234), (1, 72492), (1, 54585), (1, 115969)]}, {'secret_share': (2, 91431), 'ls_share': [(2, 37568), (2, 119392), (2, 17062), (2, 21923)]}, {'secret_share': (3, 21434), 'ls_share': [(3, 112847), (3, 11430), (3, 22454), (3, 116818)]}]
    reconstruction(new,k)

