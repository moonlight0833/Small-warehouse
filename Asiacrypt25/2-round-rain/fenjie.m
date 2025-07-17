F2 := GF(2);
P<z> := PolynomialRing(F2);
f :=z^192 + z^7 + z^2 + z + 1;
n:=192;
F<z> := ext< F2 | f >;
S<[X]> := PolynomialRing(F, n+1);
names := [ "X" cat "[" cat IntegerToString(i) cat "]" : i in [1..n] ] cat [ "x" ];
AssignNames(~S, names);
X := [S.i : i in [1..n]];
k := S.(n+1);



function find_nonzero(lst)
    for i in [#lst..1 by -1] do
        if lst[i] ne 0 then
            last_non_zero_index := i;
            return last_non_zero_index;
        end if;
    end for;
end function;


function LinearizedComposition(p2, p1,n)
    p3 := [X[i] : i in [1..1]];
    p3:=p3 cat [0 : i in [1..n-1]];
    for j := 1 to n do
        for i := 1 to n do
            index:=((i+j-2) mod n) +1;
            p3[index]:=p3[index]+p2[j]*p1[i]^(2^(j-1));
        end for;
    end for;
    p3[1]:=p3[1]-X[1];
    return p3;
end function;

function Poly(poly,a,n)
    t:=0;
    t:=t;
    for i :=0 to n-1 do
        t:=t+poly[i+1]*a^(2^i);
    end for;
    return t;
end function;



function cipro(lis,k)
    d:=find_nonzero(lis);
    poly_0:=0;
    for i:=0 to d-1 do
        poly_0:=poly_0+k^(2^d-2^i)*lis[i+1];
    end for;
    return poly_0;
end function;



load "M.m";

l:=96;
gamma:=96;
L_a:= [X[i] : i in [1..l]];
L_a:=L_a cat [0 : i in [1..n-l]];
L_alpha:=LinearizedComposition(L_a,L_192,n);
A := Matrix(F,n-gamma, l, [0 : i in [1..n-gamma], j in [1..l]]);
for i := gamma+1 to n do
    for j := 1 to l do
        A[i-gamma][j]:=MonomialCoefficient(L_alpha[i], X[j]);
    end for;
end for;

B:=Transpose(A);
//b:=[Random(F),Random(F)];

//b:=[z^127 + z^123 + z^122 + z^121 + z^120 + z^118 + z^115 + z^114 + z^113 + z^111 + z^109 + z^106 + z^105 + z^104 + z^103 + z^101 + z^99 + z^98 + z^96 + z^93 + z^89 + z^87 + z^85 + z^83 + z^80 + z^78 + z^77 + z^76 + z^75 + z^74 + z^73 + z^71 + z^68 + z^67 + z^65 + z^61 + z^59 + z^58 + z^56 + z^55 + z^53 + z^52 + z^50 + z^49 + z^48 + z^46 + z^45 + z^44 + z^41 + z^35 + z^31 + z^28 + z^24 + z^21 + z^19 + z^17 + z^16 + z^15 + z^13 + z^12 + z^10 + z^9 + z^8 + z^7 + z^4 + z^3 + z];
b:=[z^191 + z^189 + z^186 + z^182 + z^178 + z^175 + z^168 + z^165 + z^164 + z^161 + z^157 + z^155 + z^154 + z^153 + z^149 + z^148 + z^146 + z^145 + z^141 + z^140 + z^139 + z^138 + z^137 + z^136 + z^135 + z^131 + z^130 + z^127 + z^122 + z^121 + z^119 + z^118 + z^115 + z^114 + z^112 + z^111 + z^108 + z^107 + z^104 + z^103 + z^101 + z^100 + z^98 + z^93 + z^91 + z^90 + z^88 + z^85 + z^80 + z^79 + z^77 + z^76 + z^72 + z^69 + z^67 + z^66 + z^65 + z^63 + z^62 + z^59 + z^58 + z^56 + z^55 + z^54 + z^53 + z^50 + z^49 + z^48 + z^46 + z^43 + z^42 + z^40 + z^39 + z^38 + z^34 + z^33 + z^30 + z^29 + z^26 + z^23 + z^22 + z^21 + z^17 + z^16 + z^14 + z^13 + z^12 + z^7 + z^4 + z^2 + z,z^189 + z^188 + z^186 + z^180 + z^176 + z^174 + z^171 + z^169 + z^168 + z^166 + z^163 + z^162 + z^160 + z^158 + z^155 + z^153 + z^150 + z^148 + z^147 + z^146 + z^144 + z^143 + z^142 + z^138 + z^135 + z^133 + z^131 + z^129 + z^128 + z^126 + z^125 + z^124 + z^123 + z^120 + z^118 + z^116 + z^115 + z^113 + z^108 + z^103 + z^102 + z^101 + z^97 + z^96 + z^93 + z^92 + z^90 + z^88 + z^87 + z^86 + z^84 + z^82 + z^81 + z^80 + z^78 + z^76 + z^74 + z^71 + z^69 + z^67 + z^64 + z^62 + z^60 + z^59 + z^57 + z^56 + z^53 + z^51 + z^49 + z^48 + z^47 + z^46 + z^41 + z^38 + z^35 + z^34 + z^33 + z^27 + z^26 + z^25 + z^24 + z^22 + z^20 + z^18 + z^17 + z^16 + z^15 + z^12+ z^9 + z^7 + z^6 + z^2 + z + 1];
//b:=[z^252 + z^250 + z^249 + z^248 + z^246 + z^245 + z^242 + z^241 + z^240 + z^237 + z^234 + z^231 + z^230 + z^227 + z^226 + z^223 + z^222 + z^221 + z^220 + z^219 + z^213 + z^212 + z^210 + z^209 + z^206 + z^205 + z^203 + z^202 + z^198 + z^194 + z^192 + z^190 + z^188 + z^187 + z^186 + z^185 + z^183 + z^182 + z^180 + z^179 + z^177 + z^176 + z^175 + z^172 + z^170 + z^169 + z^168 + z^167 + z^166 + z^163 + z^162 + z^157 + z^156 + z^155 + z^154 + z^151 + z^150 + z^149 + z^148 + z^147 + z^145 + z^142 + z^139 + z^136 + z^135 + z^134 + z^132 + z^131 + z^130 + z^129 + z^127 + z^123 + z^121 + z^119 + z^116 + z^115 + z^114 + z^113 + z^112 + z^111 + z^110 + z^109 +z^108 + z^106 + z^105 + z^104 + z^103 + z^101 + z^99 + z^97 + z^96 + z^93 + z^92 + z^91 + z^89 + z^86 + z^84 + z^82 + z^81 + z^79 + z^78 + z^77 + z^76 + z^75 + z^74 + z^72 + z^71 + z^69 + z^63 + z^61 + z^60 + z^57 + z^56 + z^54 + z^50 + z^49 + z^48 + z^47 + z^46 + z^45 + z^43 + z^40 + z^38 + z^37 + z^36 + z^33 + z^32 + z^31 +z^30 + z^28 + z^27 + z^25 + z^23 + z^22 + z^21 + z^20 + z^17 + z^16 + z^14 + z^12 + z^8 + z^7 + z^5 + z^3 + z^2];
b cat:= [0 : i in [1..n-gamma-2]];
b:=Vector(F,b);
particular_solution:= Solution(B, b);
//particular_solution:= NullSpace(B).1;
solution:=[z : i in [1..l]];
for i := 1 to l do
    solution[i]:=particular_solution[i];
end for;

L_a:=solution cat [0 : i in [1..n-l]];

L_alpha:=LinearizedComposition(L_a,L_192,n);

matrix_dickson1:=Matrix(F, n, n, [0 : i in [0..n-1], j in [0..n-1]]);
for i := 0 to n-1 do
    for j := 0 to n-1 do
        t:=(j-i) mod n;
        matrix_dickson1[i+1][j+1] :=L_a[t+1]^(2^i);
    end for;
end for;
r1:=Rank(matrix_dickson1);
print "L_a的dickson多项式的秩为",r1;
/*
SetOutputFile("M_128.m": Overwrite := true);
PrintFile("M_128.m","L_128:=");
PrintFile("M_128.m",L_128);
PrintFile("M_128.m","L_a:=");
PrintFile("M_128.m",L_a);
PrintFile("M_128.m","L_alpha:=");
PrintFile("M_128.m",L_alpha);
*/

F:="M_192.m";
SetOutputFile(F: Overwrite := true);
PrintFile(F,"L_192:=");
PrintFile(F,L_192);
PrintFile(F,"L_a:=");
PrintFile(F,L_a);
PrintFile(F,"L_alpha:=");
PrintFile(F,L_alpha);


/*
F:="M_256.m";
SetOutputFile(F: Overwrite := true);
PrintFile(F,"L_256:=");
PrintFile(F,L_256);
PrintFile(F,"L_a:=");
PrintFile(F,L_a);
PrintFile(F,"L_alpha:=");
PrintFile(F,L_alpha);
*/