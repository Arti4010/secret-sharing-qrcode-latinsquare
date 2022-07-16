import shamir_secret
import converter


def create_secret(n, k, secret):
    shares = shamir_secret.make_random_shares(secret, minimum=k, shares=n)
    return shares


def convert_shares_to_string(shares):
    participants_share = {}
    i = 0
    for share in shares:
        string = str(share[0]) + "," + str(share[1])
        participants_share[i] = string
        i = i + 1
    return participants_share


def encode_secret_share(participants_share):
    x = "3,4"
    encoded_str = converter.encoder(x)
    #print(encoded_str)
    #print(len(encoded_str))
    return encoded_str


def decode_secret_share(participants_share):
    x = "101011110000100111101011001100110110101011110000110110"
    y = "53, 60, 47, 53, 14, 66, 53, 60, 66"
    y = "001101010011110000101111001101010000111001000010001101010011110001000010"
    #print(len(x))
    decoded_str = converter.decoder(x)
    print(decoded_str)
    return decoded_str


def embedding_in_qr_code():
    pass
