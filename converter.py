def encoder(msg):
    str1 = ""
    str3 = ""
    # convert msg to ascii table in base octa

    for char in msg:
        str1 = str1 + oct(ord(char))[2:].zfill(3)
    # print(str1)
    # reset value of every elements based on latin square position
    str2 = ""
    for char in str1:
        if char == '0':
            x = char.replace('0', '53')
            str2 = str2 + x
        if char == '1':
            x = char.replace('1', '01')
            str2 = str2 + x
        if char == '2':
            x = char.replace('2', '20')
            str2 = str2 + x
        if char == '3':
            x = char.replace('3', '47')
            str2 = str2 + x
        if char == '4':
            x = char.replace('4', '66')
            str2 = str2 + x
        if char == '5':
            x = char.replace('5', '14')
            str2 = str2 + x
        if char == '6':
            x = char.replace('6', '60')
            str2 = str2 + x
        if char == '7':
            x = char.replace('7', '34')
            str2 = str2 + x
    # print(str2)
    # after that change that msg to binary
    str3 = ""
    for char in str2:
        str3 = str3 + bin(int(char, 8))[2:].zfill(3)
    # print(str3)
    return str3


def decoder(encoded_msg):
    print(oct(int(encoded_msg, 2))[2:])
    i = 0
    str4 = ""
    while i < len(encoded_msg):
        str4 = str4 + oct(int(encoded_msg[i:i+3], 2))[2:]
        i = i + 3
    # print(str4)
    # return str4
    str5 = ""
    j = 0
    while j < len(str4):
        check = str4[j:j+2]
        if check == '01':
            y = str4[j:j+2].replace('01', '1')
            str5 = str5 + y
        if check == '53':
            y = str4[j:j+2].replace('53', '0')
            str5 = str5 + y
        if check == '20':
            y = str4[j:j+2].replace('20', '2')
            str5 = str5 + y
        if check == '47':
            y = str4[j:j+2].replace('47', '3')
            str5 = str5 + y
        if check == '66':
            y = str4[j:j+2].replace('66', '4')
            str5 = str5 + y
        if check == '14':
            y = str4[j:j+2].replace('14', '5')
            str5 = str5 + y
        if check == '60':
            y = str4[j:j+2].replace('60', '6')
            str5 = str5 + y
        if check == '34':
            y = str4[j:j+2].replace('34', '7')
            str5 = str5 + y
        j = j + 2
    #print(str5)
    str_converted = ""
    j = 0
    while j < len(str5):
        temp = str5[j:j+3]
        str_converted += chr(int(temp, 8))
        j = j + 3
    return str_converted




if __name__ == '__main__':
    '''string = "x=34&y=67";
    list_ = []
    for char in string:
        list_ = list_ + [oct(ord(char))[2:].zfill(3)]
    print(list_)
    str = ""
    for value in list_:
        str = str + value
    print(str)
    str2 = ""
    # change all parameter with position of latin square
    for char in str:
        if char == '0':
            x = char.replace('0', '53')
            str2 = str2 + x
        if char == '1':
            x = char.replace('1', '01')
            str2 = str2 + x
        if char == '2':
            x = char.replace('2', '20')
            str2 = str2 + x
        if char == '3':
            x = char.replace('3', '47')
            str2 = str2 + x
        if char == '4':
            x = char.replace('4', '66')
            str2 = str2 + x
        if char == '5':
            x = char.replace('5', '14')
            str2 = str2 + x
        if char == '6':
            x = char.replace('6', '60')
            str2 = str2 + x
        if char == '7':
            x = char.replace('7', '34')
            str2 = str2 + x
    print(str2)
    str3 = ""
    for char in str2:
        str3 = str3 + bin(int(char, 8))[2:]
    print(str3)'''
    x = encoder("x=34")
    print(decoder(x))





