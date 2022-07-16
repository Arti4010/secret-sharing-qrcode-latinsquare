# This is a sample Python script.

# Press Shift+F10 to execute it or replace it with your code.
# Press Double Shift to search everywhere for classes, files, tool windows, actions, and settings.
import registation_phase
import secret_sharing_phase
import reconstruction

def binary_to_octal():

    x = "101011110000100111101011001100110110101011110000110110"
    y = ""
    i = 0
    while i < len(x):
        temp = (x[i:i + 3])
        if temp == '000':
            y = y + '0'
        if temp == '001':
            y = y + '1'
        if temp == '010':
            y = y + '2'
        if temp == '011':
            y = y + '3'
        if temp == '100':
            y = y + '4'
        if temp == '101':
            y = y + '5'
        if temp == '110':
            y = y + '6'
        if temp == '111':
            y = y + '7'
        i = i + 3
    print(y)


def change_form_of_ls(ls):
    #temp = []
    #for value in ls:
     #    temp = temp + [str(value)]
    final_ls =[]
    for value in ls:
        temp_ls = []
        for char in str(value):
            temp_ls.append(str(char))
        final_ls = final_ls + [temp_ls]
    return final_ls



def start(n, k):
    #Use a breakpoint in the code line below to debug your script.
    lshares = registation_phase.create_share_of_latin_square(n, k)
    dealer_have = registation_phase.create_dealer(n, lshares)
    # print(dealer_have)
    # shares = secret_sharing_phase.create_secret(n,k, 1234);
    # p_shares = secret_sharing_phase.convert_shares_to_string(shares)
    # secret_sharing_phase.encode_secret_share(p_shares)
    latin_square = reconstruction.reconstruction_ls(dealer_have, k)
    print(latin_square)
    # secret_sharing_phase.decode_secret_share(lshares)
    new_ls = change_form_of_ls(latin_square)
    print(new_ls,"new")
    auth_paas = reconstruction.check_valid_ls(new_ls)
    print(reconstruction.authentication(auth_paas))



# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    start(3, 2)
    # binary_to_octal()

# See PyCharm help at https://www.jetbrains.com/help/pycharm/
