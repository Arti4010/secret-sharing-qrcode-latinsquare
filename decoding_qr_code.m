
I = imread('qr-img2.png');
disp(I);
[r , c] = size(I);
disp(r);                          % display row size
disp(c);   
figure, imshow(I)
m1 = I(9, 1);
m2 = I(9, 2);
v1 = I(9, 3);
v2 = I(9, 4);
v3 = I(9, 5);
mask_pt = [v1, v2, v3];
% mod((mod(i*j,3)+mod(i+j,2)),2) == 0
%((i * j) % 3 + (i + j) % 2) % 2 == 0
order_of_mask = 21 
mask=zeros(order_of_mask);
for i=0:order_of_mask
    for j=0:order_of_mask
        if mod((mod(i*j,3)+mod(i+j,2)),2) == 0
            mask(i+1,j+1)=0;
        else
            mask(i+1,j+1)=1;
       end 
   end
end
figure, imshow(mask)
% disp(bitxor(I(21,21),mask(21, 21)));
% disp(bitxor(I(21,20),mask(21, 20)));
% disp(bitxor(I(20,21),mask(20, 21)));
% disp(bitxor(I(20,20),mask(20, 20)));
% 

D1 = [I(21,21),I(21,20),I(20,21),I(20,20),I(19,21),I(19,20),I(18,21),I(18,20)];
D2 = [I(17,21),I(17,20),I(16,21),I(16,20),I(15,21),I(15,20),I(14,21),I(14,20)];
D3 = [I(13,21),I(13,20),I(12,21),I(12,20),I(11,21),I(11,20),I(10,21),I(10,20)];
D4 = [I(10,19),I(10,18),I(11,19),I(11,18),I(12,19),I(12,18),I(13,19),I(13,18)];
D5 = [I(14,19),I(14,18),I(15,19),I(15,18),I(16,19),I(16,18),I(17,19),I(17,18)];
D6 = [I(18,19),I(18,18),I(19,19),I(19,18),I(20,19),I(20,18),I(21,19),I(21,18)];
D7 = [I(21,17),I(21,16),I(20,17),I(20,16),I(19,17),I(19,16),I(18,17),I(18,16)];
D8 = [I(17,17),I(17,16),I(16,17),I(16,16),I(15,17),I(15,16),I(14,17),I(14,16)];
D9 = [I(13,17),I(13,16),I(12,17),I(12,16),I(11,17),I(11,16),I(10,17),I(10,16)];
D10 = [I(10,15),I(10,14),I(11,15),I(11,14),I(12,15),I(12,14),I(13,15),I(13,14)];
D11 = [I(14,15),I(14,14),I(15,15),I(15,14),I(16,15),I(16,14),I(17,15),I(17,14)];
D12 = [I(18,15),I(18,14),I(19,15),I(19,14),I(20,15),I(20,14),I(21,15),I(21,14)];
D13 = [I(21,13),I(21,12),I(20,13),I(20,12),I(19,13),I(19,12),I(18,13),I(18,12)];
D14 = [I(17,13),I(17,12),I(16,13),I(16,12),I(15,13),I(15,12),I(14,13),I(14,12)];
D15 = [I(13,13),I(13,12),I(12,13),I(12,12),I(11,13),I(11,12),I(10,13),I(10,12)];
D16 = [I(9,13),I(9,12),I(8,13),I(8,12),I(6,13),I(6,12),I(5,13),I(5,12)];
D17= [I(4,13),I(4,12),I(3,13),I(3,12),I(2,13),I(2,12),I(1,13),I(1,12)];
D18 = [I(1,11),I(1,10),I(2,11),I(2,10),I(3,11),I(3,10),I(4,11),I(4,10)];
D19= [I(5,11),I(5,10),I(6,11),I(6,10),I(8,11),I(8,10),I(9,11),I(9,10)];

E1 = [I(10,11),I(10,10),I(11,11),I(11,10),I(12,11),I(12,10),I(13,11),I(13,10)];
E2 = [I(14,11),I(14,10),I(15,11),I(15,10),I(16,11),I(16,10),I(17,11),I(17,10)];
E3 = [I(18,11),I(18,10),I(19,11),I(19,10),I(20,11),I(20,10),I(21,11),I(21,10)];
E4 = [I(13,9),I(13,8),I(12,9),I(12,8),I(11,9),I(11,8),I(10,9),I(10,8)];
E5 = [I(10,6),I(10,5),I(11,6),I(11,5),I(12,6),I(12,5),I(13,6),I(13,5)];
E6 = [I(13,4),I(13,3),I(12,4),I(12,3),I(11,4),I(11,3),I(10,4),I(10,3)];
E7 = [I(10,2),I(10,1),I(11,2),I(11,1),I(12,2),I(12,1),I(13,2),I(13,1)];
% disp(D1);
% disp(D2);
% disp(D3);
% disp(D4);
% disp(D5);
% disp(D6);
% disp(D7);
% disp(D8);
% disp(D9);
% disp(D10);
% disp(D11);
% disp(D12);
% disp(D13);
% disp(D14);
% disp(D15);
% disp(D16);
% disp(D17);
% disp(D18);
% disp(D19);
% 
% disp(E1);
% disp(E2);
% disp(E3);
% disp(E4);
% disp(E5);
% disp(E6);
% disp(E7);

MD1 = [mask(21,21),mask(21,20),mask(20,21),mask(20,20),mask(19,21),mask(19,20),mask(18,21),mask(18,20)]
MD2 = [mask(17,21),mask(17,20),mask(16,21),mask(16,20),mask(15,21),mask(15,20),mask(14,21),mask(14,20)]
MD3 = [mask(13,21),mask(13,20),mask(12,21),mask(12,20),mask(11,21),mask(11,20),mask(10,21),mask(10,20)]
MD4 = [mask(10,19),mask(10,18),mask(11,19),mask(11,18),mask(12,19),mask(12,18),mask(13,19),mask(13,18)]
MD5 = [mask(14,19),mask(14,18),mask(15,19),mask(15,18),mask(16,19),mask(16,18),mask(17,19),mask(17,18)]
MD6 = [mask(18,19),mask(18,18),mask(19,19),mask(19,18),mask(20,19),mask(20,18),mask(21,19),mask(21,18)]
MD7 = [mask(21,17),mask(21,16),mask(20,17),mask(20,16),mask(19,17),mask(19,16),mask(18,17),mask(18,16)]
MD8 = [mask(17,17),mask(17,16),mask(16,17),mask(16,16),mask(15,17),mask(15,16),mask(14,17),mask(14,16)]
MD9 = [mask(13,17),mask(13,16),mask(12,17),mask(12,16),mask(11,17),mask(11,16),mask(10,17),mask(10,16)]
MD10 = [mask(10,15),mask(10,14),mask(11,15),mask(11,14),mask(12,15),mask(12,14),mask(13,15),mask(13,14)]
MD11 = [mask(14,15),mask(14,14),mask(15,15),mask(15,14),mask(16,15),mask(16,14),mask(17,15),mask(17,14)]
MD12 = [mask(18,15),mask(18,14),mask(19,15),mask(19,14),mask(20,15),mask(20,14),mask(21,15),mask(21,14)]
MD13 = [mask(21,13),mask(21,12),mask(20,13),mask(20,12),mask(19,13),mask(19,12),mask(18,13),mask(18,12)]
MD14 = [mask(17,13),mask(17,12),mask(16,13),mask(16,12),mask(15,13),mask(15,12),mask(14,13),mask(14,12)]
MD15 = [mask(13,13),mask(13,12),mask(12,13),mask(12,12),mask(11,13),mask(11,12),mask(10,13),mask(10,12)]
MD16 = [mask(9,13),mask(9,12),mask(8,13),mask(8,12),mask(6,13),mask(6,12),mask(5,13),mask(5,12)]
MD17= [mask(4,13),mask(4,12),mask(3,13),mask(3,12),mask(2,13),mask(2,12),mask(1,13),mask(1,12)]
MD18 = [mask(1,11),mask(1,10),mask(2,11),mask(2,10),mask(3,11),mask(3,10),mask(4,11),mask(4,10)]
MD19= [mask(5,11),mask(5,10),mask(6,11),mask(6,10),mask(8,11),mask(8,10),mask(9,11),mask(9,10)]

ME1 = [mask(10,11),mask(10,10),mask(11,11),mask(11,10),mask(12,11),mask(12,10),mask(13,11),mask(13,10)]
ME2 = [mask(14,11),mask(14,10),mask(15,11),mask(15,10),mask(16,11),mask(16,10),mask(17,11),mask(17,10)]
ME3 = [mask(18,11),mask(18,10),mask(19,11),mask(19,10),mask(20,11),mask(20,10),mask(21,11),mask(21,10)]
ME4 = [mask(13,9),mask(13,8),mask(12,9),mask(12,8),mask(11,9),mask(11,8),mask(10,9),mask(10,8)]
ME5 = [mask(10,6),mask(10,5),mask(11,6),mask(11,5),mask(12,6),mask(12,5),mask(13,6),mask(13,5)]
ME6 = [mask(13,4),mask(13,3),mask(12,4),mask(12,3),mask(11,4),mask(11,3),mask(10,4),mask(10,3)]
ME7 = [mask(10,2),mask(10,1),mask(11,2),mask(11,1),mask(12,2),mask(12,1),mask(13,2),mask(13,1)]

% disp(MD1);
% disp(MD2);
% disp(MD3);
% disp(MD4);
% disp(MD5);
% disp(MD6);
% disp(MD7);
% disp(MD8);
% disp(MD9);
% disp(MD10);
% disp(MD11);
% disp(MD12);
% disp(MD13);
% disp(MD14);
% disp(MD15);
% disp(MD16);
% disp(MD17);
% disp(MD18);
% disp(MD19);
% 
% disp(ME1);
% disp(ME2);
% disp(ME3);
% disp(ME4);
% disp(ME5);
% disp(ME6);
% disp(ME7);

disp("xor output");
disp(xor(D1,MD1));
disp(xor(D2,MD2));
disp(xor(D3,MD3));
disp(xor(D4,MD4));
disp(xor(D5,MD5));
disp(xor(D6,MD6));
disp(xor(D7,MD7));
disp(xor(D8,MD8));
disp(xor(D9,MD9));
disp(xor(D10,MD10));
disp(xor(D11,MD11));
disp(xor(D12,MD12));
disp(xor(D13,MD13));
disp(xor(D14,MD14));
disp(xor(D15,MD15));
disp(xor(D16,MD16));
disp(xor(D17,MD17));
disp(xor(D18,MD18));
disp(xor(D19,MD19));
disp(xor(E1,ME1));
disp(xor(E2,ME2));
disp(xor(E3,ME3));
disp(xor(E4,ME4));
disp(xor(E5,ME5));
disp(xor(E6,ME6));
disp(xor(E7,ME7));

D5 = [I(14,19),I(14,18),I(15,19),I(15,18),I(16,19),I(16,18),I(17,19),I(17,18)];
MD5 = [mask(14,19),mask(14,18),mask(15,19),mask(15,18),mask(16,19),mask(16,18),mask(17,19),mask(17,18)]
new_d5= xor(D5, MD5);
I(14,19)=xor(0,mask(14,19))
I(14,18)=xor(0,mask(14,18))
I(15,19)=xor(1,mask(15,19))
I(15,18)=xor(1,mask(15,18))
I(16,19)=xor(0,mask(16,19))
I(16,18)=xor(1,mask(16,18))
I(17,19)=xor(0,mask(17,19))
I(17,18)=xor(1,mask(17,18))

%d6
I(18,19)=xor(0,mask(18,19))
I(18,18)=xor(0,mask(18,18))
I(19,19)=xor(1,mask(19,19))
I(19,18)=xor(1,mask(19,18))
I(20,19)=xor(1,mask(20,19))
I(20,18)=xor(1,mask(20,18))
I(21,19)=xor(0,mask(21,19))
I(21,18)=xor(0,mask(21,18))
%d7
I(21,17)=xor(0,mask(21,17))
I(21,16)=xor(0,mask(21,16))
I(20,17)=xor(1,mask(20,17))
I(20,16)=xor(0,mask(20,16))
I(19,17)=xor(1,mask(19,17))
I(19,16)=xor(1,mask(19,16))
I(18,17)=xor(1,mask(18,17))
I(18,16)=xor(1,mask(18,16))

%D8 =
I(17,17)=xor(0,mask(17,17))
I(17,16)=xor(0,mask(17,16))
I(16,17)=xor(1,mask(16,17))
I(16,16)=xor(1,mask(16,16))
I(15,17)=xor(0,mask(15,17))
I(15,16)=xor(1,mask(15,16))
I(14,17)=xor(0,mask(14,17))
I(14,16)=xor(1,mask(14,16))

%D9
I(13,17)=xor(0,mask(13,17))
I(13,16)=xor(0,mask(13,16))
I(12,17)=xor(0,mask(12,17))
I(12,16)=xor(0,mask(12,16))
I(11,17)=xor(1,mask(11,17))
I(11,16)=xor(1,mask(11,16))
I(10,17)=xor(1,mask(10,17))
I(10,16)=xor(0,mask(10,16))

%D10 
I(10,15)=xor(0,mask(10,15))
I(10,14)=xor(1,mask(10,14))
I(11,15)=xor(0,mask(11,15))
I(11,14)=xor(0,mask(11,14))
I(12,15)=xor(0,mask(12,15))
I(12,14)=xor(0,mask(12,14))
I(13,15)=xor(1,mask(13,15))
I(13,14)=xor(0,mask(13,14))

%D11
I(14,15)=xor(0,mask(14,15))
I(14,14)=xor(0,mask(14,14))
I(15,15)=xor(1,mask(15,15))
I(15,14)=xor(1,mask(15,14))
I(16,15)=xor(0,mask(16,15))
I(16,14)=xor(1,mask(16,14))
I(17,15)=xor(0,mask(17,15))
I(17,14)=xor(1,mask(17,14))

%D12 
I(18,15)=xor(0,mask(18,15))
I(18,14)=xor(0,mask(18,14))
I(19,15)=xor(1,mask(19,15))
I(19,14)=xor(1,mask(19,14))
I(20,15)=xor(1,mask(20,15))
I(20,14)=xor(1,mask(20,14))
I(21,15)=xor(0,mask(21,15))
I(21,14)=xor(0,mask(21,14))

%D13 
I(21,13)=xor(0,mask(21,13))
I(21,12)=xor(1,mask(21,12))
I(20,13)=xor(0,mask(20,13))
I(20,12)=xor(0,mask(20,12))
I(19,13)=xor(0,mask(19,13))
I(19,12)=xor(0,mask(19,12))
I(18,13)=xor(1,mask(18,13))
I(18,12)=xor(0,mask(18,12))

%D14
I(17,13)=xor(0,mask(17,13))
I(17,12)=xor(0,mask(17,12))
I(16,13)=xor(0,mask(16,13))
I(16,12)=xor(1,mask(16,12))
I(15,13)=xor(0,mask(15,13))
I(15,12)=xor(0,mask(15,13))
I(14,13)=xor(0,mask(14,13))
I(14,12)=xor(1,mask(14,12))

%D15
I(13,13)=xor(1,mask(13,13))
I(13,12)=xor(1,mask(13,12))
I(12,13)=xor(1,mask(12,13))
I(12,12)=xor(0,mask(12,12))
I(11,13)=xor(1,mask(11,13))
I(11,12)=xor(1,mask(11,12))
I(10,13)=xor(0,mask(10,13))
I(10,12)=xor(0,mask(10,12))

%D16 
I(9,13)=xor(0,mask(9,13))
I(9,12)=xor(0,mask(9,12))
I(8,13)=xor(0,mask(8,13))
I(8,12)=xor(1,mask(8,12))
I(6,13)=xor(0,mask(6,13))
I(6,12)=xor(0,mask(6,12))
I(5,13)=xor(0,mask(5,13))
I(5,12)=xor(1,mask(5,12))

%D17
I(4,13)=xor(1,mask(4,13))
I(4,12)=xor(1,mask(4,12))
I(3,13)=xor(1,mask(3,13))
I(3,12)=xor(0,mask(3,12))
I(2,13)=xor(1,mask(2,13))
I(2,12)=xor(1,mask(2,12))
I(1,13)=xor(0,mask(1,13))
I(1,12)=xor(0,mask(1,12))

%D18 
I(1,11)=xor(0,mask(1,11))
I(1,10)=xor(0,mask(1,10))
I(2,11)=xor(0,mask(2,11))
I(2,10)=xor(1,mask(2,10))
I(3,11)=xor(0,mask(3,11))
I(3,10)=xor(0,mask(3,10))
I(4,11)=xor(0,mask(4,11))
I(4,10)=xor(1,mask(4,10))

%D19
I(5,11)=xor(1,mask(5,11))
I(5,10)=xor(1,mask(5,10))
I(6,11)=xor(1,mask(6,11))
I(6,10)=xor(0,mask(6,10))
I(8,11)=xor(1,mask(8,11))
I(8,10)=xor(1,mask(8,10))
I(9,11)=xor(0,mask(9,11))
I(9,10)=xor(0,mask(9,10))

%E1 
 I(10,11)=xor(1,mask(10,11))
 I(10,10)=xor(1,mask(10,10))
 I(11,11)=xor(0,mask(11,11))
 I(11,10)=xor(0,mask(11,10))
 I(12,11)=xor(0,mask(12,11))
 I(12,10)=xor(0,mask(12,10))
 I(13,11)=xor(0,mask(13,11))
 I(13,10)=xor(0,mask(13,10))
% E2
 I(14,11)=xor(1,mask(14,11))
 I(14,10)=xor(0,mask(14,10))
 I(15,11)=xor(0,mask(15,11))
 I(15,10)=xor(1,mask(15,10))
 I(16,11)=xor(1,mask(16,11))
 I(16,10)=xor(1,mask(16,10))
 I(17,11)=xor(0,mask(17,11))
 I(17,10)=xor(1,mask(17,10))
% E3 
I(18,11)=xor(0,mask(18,11))
I(18,10)=xor(0,mask(18,10))
I(19,11)=xor(1,mask(19,11))
I(19,10)=xor(1,mask(19,10))
I(20,11)=xor(1,mask(20,11))
I(20,10)=xor(1,mask(20,10))
I(21,11)=xor(1,mask(21,11))
I(21,10)=xor(0,mask(21,10))
% E4 
I(13,9)=xor(1,mask(13,9))
I(13,8)=xor(1,mask(13,8))
I(12,9)=xor(1,mask(12,9))
I(12,8)=xor(1,mask(12,8))
I(11,9)=xor(1,mask(11,9))
I(11,8)=xor(0,mask(11,8))
I(10,9)=xor(1,mask(10,9))
I(10,8)=xor(0,mask(10,8))
% E5,
I(10,6)=xor(1,mask(10,6))
I(10,5)=xor(1,mask(10,5))
I(11,6)=xor(1,mask(11,6))
I(11,5)=xor(1,mask(11,5))
I(12,6)=xor(0,mask(12,6))
I(12,5)=xor(1,mask(12,5))
I(13,6)=xor(1,mask(13,6))
I(13,5)=xor(1,mask(13,5))
% E6 
I(13,4)=xor(0,mask(13,4))
I(13,3)=xor(0,mask(13,3))
I(12,4)=xor(1,mask(12,4))
I(12,3)=xor(1,mask(12,3))
I(11,4)=xor(0,mask(11,4))
I(11,3)=xor(0,mask(11,3))
I(10,4)=xor(1,mask(10,4))
I(10,3)=xor(0,mask(10,3))
% E7 
I(10,2)=xor(1,mask(10,2))
I(10,1)=xor(0,mask(10,1))
I(11,2)=xor(0,mask(11,2))
I(11,1)=xor(1,mask(11,1))
I(12,2)=xor(0,mask(12,2))
I(12,1)=xor(1,mask(12,1))
I(13,2)=xor(0,mask(13,2))
I(13,1)=xor(1,mask(13,2))

figure, imshow(I)
D1 = [I(21,21),I(21,20),I(20,21),I(20,20),I(19,21),I(19,20),I(18,21),I(18,20)];
D2 = [I(17,21),I(17,20),I(16,21),I(16,20),I(15,21),I(15,20),I(14,21),I(14,20)];
D3 = [I(13,21),I(13,20),I(12,21),I(12,20),I(11,21),I(11,20),I(10,21),I(10,20)];
D4 = [I(10,19),I(10,18),I(11,19),I(11,18),I(12,19),I(12,18),I(13,19),I(13,18)];
D5 = [I(14,19),I(14,18),I(15,19),I(15,18),I(16,19),I(16,18),I(17,19),I(17,18)];
D6 = [I(18,19),I(18,18),I(19,19),I(19,18),I(20,19),I(20,18),I(21,19),I(21,18)];
D7 = [I(21,17),I(21,16),I(20,17),I(20,16),I(19,17),I(19,16),I(18,17),I(18,16)];
D8 = [I(17,17),I(17,16),I(16,17),I(16,16),I(15,17),I(15,16),I(14,17),I(14,16)];
D9 = [I(13,17),I(13,16),I(12,17),I(12,16),I(11,17),I(11,16),I(10,17),I(10,16)];
D10 = [I(10,15),I(10,14),I(11,15),I(11,14),I(12,15),I(12,14),I(13,15),I(13,14)];
D11 = [I(14,15),I(14,14),I(15,15),I(15,14),I(16,15),I(16,14),I(17,15),I(17,14)];
D12 = [I(18,15),I(18,14),I(19,15),I(19,14),I(20,15),I(20,14),I(21,15),I(21,14)];
D13 = [I(21,13),I(21,12),I(20,13),I(20,12),I(19,13),I(19,12),I(18,13),I(18,12)];
D14 = [I(17,13),I(17,12),I(16,13),I(16,12),I(15,13),I(15,12),I(14,13),I(14,12)];
D15 = [I(13,13),I(13,12),I(12,13),I(12,12),I(11,13),I(11,12),I(10,13),I(10,12)];
D16 = [I(9,13),I(9,12),I(8,13),I(8,12),I(6,13),I(6,12),I(5,13),I(5,12)];
D17= [I(4,13),I(4,12),I(3,13),I(3,12),I(2,13),I(2,12),I(1,13),I(1,12)];
D18 = [I(1,11),I(1,10),I(2,11),I(2,10),I(3,11),I(3,10),I(4,11),I(4,10)];
D19= [I(5,11),I(5,10),I(6,11),I(6,10),I(8,11),I(8,10),I(9,11),I(9,10)];

E1 = [I(10,11),I(10,10),I(11,11),I(11,10),I(12,11),I(12,10),I(13,11),I(13,10)];
E2 = [I(14,11),I(14,10),I(15,11),I(15,10),I(16,11),I(16,10),I(17,11),I(17,10)];
E3 = [I(18,11),I(18,10),I(19,11),I(19,10),I(20,11),I(20,10),I(21,11),I(21,10)];
E4 = [I(13,9),I(13,8),I(12,9),I(12,8),I(11,9),I(11,8),I(10,9),I(10,8)];
E5 = [I(10,6),I(10,5),I(11,6),I(11,5),I(12,6),I(12,5),I(13,6),I(13,5)];
E6 = [I(13,4),I(13,3),I(12,4),I(12,3),I(11,4),I(11,3),I(10,4),I(10,3)];
E7 = [I(10,2),I(10,1),I(11,2),I(11,1),I(12,2),I(12,1),I(13,2),I(13,1)];

disp(D1);
disp(D2);
disp(D3);
disp(D4);
disp(D5);
disp(D6);
disp(D7);
disp(D8);
disp(D9);
disp(D10);
disp(D11);
disp(D12);
disp(D13);
disp(D14);
disp(D15);
disp(D16);
disp(D17);
disp(D18);
disp(D19);

disp(E1);
disp(E2);
disp(E3);
disp(E4);
disp(E5);
disp(E6);
disp(E7);

%disp(D1,D2,D3,D4,D5,D6,D7,D8,D9,D10,D11,D12,D13,D14,D15,D16,D17,D18,D19);
%disp(E1,E2,E3,E4,E5,E6,E7);


