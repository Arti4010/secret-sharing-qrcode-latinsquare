def change_form_of_ls(ls):
    final_ls =[]
    for value in ls:
        temp_ls = []
        for char in str(value):
            temp_ls.append(str(char))
        final_ls = final_ls + [temp_ls]
    print(final_ls)
    return final_ls


def row_check(matrix, i):
    n = len(matrix)+1
    check_list = matrix[i]
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

if __name__ == '__main__':
    ls = [1234, 2341, 3412, 4123]
    new_ls = change_form_of_ls(ls)
    print(new_ls)
    print(check_valid_ls(new_ls))