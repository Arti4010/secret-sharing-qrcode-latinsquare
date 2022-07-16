import shamir_secret


def reconstruction_ls(list_of_parties_share, k):
    recollect_sec_share = []
    recollect_ls = []
    print(list_of_parties_share)
    if len(list_of_parties_share) >= k:
        for i in range(len(list_of_parties_share[0]['ls_share'])):
            recollect_ls_share = []
            for j in range(len(list_of_parties_share)):
                recollect_ls_share = recollect_ls_share + [list_of_parties_share[j]['ls_share'][i]]
            num = shamir_secret.recover_secret(recollect_ls_share)
            recollect_ls = recollect_ls + [num]
        print("ls is now ", recollect_ls)
        return recollect_ls


def row_check(matrix, i):
    n = len(matrix)+1
    check_list = matrix[i]
    for value in check_list:
        print(value)
    print(check_list)
    for y in range(1,n):
        count = 0
        for value in check_list:
            if y == value:
                count = count + 1
            if count >= 2:
                return False
    return True


def col_check(matrix, j):
    n = len(matrix)+1
    for y in range(1,n):
        count = 0
        for x in range(n-1):
            if y == matrix[x][j]:
                count = count + 1
            if count >= 2:
                return False
        return True


def check_valid_ls(matrix):
        ans = True
        n = len(matrix)
        for i in range(n):
            ans = ans & row_check(matrix, i)
        for j in range(n):
            ans = ans & col_check(matrix, j)
        return ans


def authentication(auth_pass):
    if auth_pass:
        print("Authentication passed")
        return True
    else:
        print("Authentication failed")
        return False

