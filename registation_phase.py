import shamir_secret
ls_order = 4
latin_square = [[1, 2, 3, 4], [2, 3, 4, 1], [3, 4, 1, 2], [4, 1, 2, 3]]


def main(secret):
    """Main function"""
    #secret = 123456
    shares = shamir_secret.make_random_shares(secret, minimum=3, shares=6)
    #shares = [(1010, 64085), (2304, 8087), (11280,  22009)]
    '''if shares:
        for share in shares:
            print('  ', share)'''
    #print('Secret recovered from minimum subset of shares:             ',
          #shamir_secret.recover_secret(shares[:5]))
    #print('Secret recovered from a different minimum subset of shares: ',
    #      recover_secret(shares[-3:]))
    return shares


def create_secret_for_one_row(row):
    length = len(row)
    number = 0
    for value in row:
        if length > 0:
            number = number + value * pow(10, length - 1)
            length = length - 1
    return number


def create_share_of_latin_square(n, k):

    ls_all_shares = []
    for i in range(ls_order):
        number = create_secret_for_one_row(latin_square[i])
        ls_all_shares = ls_all_shares + [main(number)]
    return ls_all_shares


def create_dealer(n, ls_all_shares):
    dealer = []
    for value in range(n):
        participants = {}
        temp = []
        for val in ls_all_shares:
            temp = temp + [val[value]]
        participants['ls_share'] = temp
        dealer = dealer + [participants]
    return dealer

