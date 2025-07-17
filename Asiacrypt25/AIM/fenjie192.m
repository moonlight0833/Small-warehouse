F2 := GF(2);
P<z> := PolynomialRing(F2);
f :=z^192 + z^7 + z^2 + z + 1;
n:=192;
F<z> := ext< F2 | f >;
AssertAttribute(F, "PowerPrinting", false);
S<[X]> := PolynomialRing(F, n+2);
names := [ "X" cat "[" cat IntegerToString(i) cat "]" : i in [1..n] ] cat [ "k" ] cat ["v"];
AssignNames(~S, names);
X := [S.i : i in [1..n]];
k := S.(n+1);
v := S.(n+2);
e1:=5;
e2:=29;
e3:=7;
load "M_192.m";


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

function PolyQ(poly,a,n)
    t:=0;
    t:=t;
    for i :=0 to find_nonzero(poly)-1 do
        t:=t+poly[i+1]*a^(2^i);
    end for;
    return t;
end function;


function find_nonzero(lst)
    for i in [#lst..1 by -1] do
        if lst[i] ne 0 then
            last_non_zero_index := i;
            return last_non_zero_index;
        end if;
    end for;
end function;





beta:=Ceiling((2*n+1+e1+e2-e3)/3);
l:=beta+e3-1;
gamma:=beta-e1-1;
lammda:=beta-e2-1;
print l,2*n-lammda-gamma;

L_a:= [X[i] : i in [1..l]];
L_a:=L_a cat [0 : i in [1..n-l]];
L_alpha_1:=LinearizedComposition(L_a,L1,n);
L_alpha_2:=LinearizedComposition(L_a,L2,n);
A := Matrix(F,2*n-lammda-gamma, l, [0 : i in [1..2*n-lammda-gamma], j in [1..l]]);
for i := gamma+1 to n do
    for j := 1 to l do
        A[i-gamma][j]:=MonomialCoefficient(L_alpha_1[i], X[j]);
    end for;
end for;
for i := lammda+1 to n do
    for j := 1 to l do
        A[i-gamma+n-lammda][j]:=MonomialCoefficient(L_alpha_2[i], X[j]);
    end for;
end for;


B:=Transpose(A);
//b:=[Random(F)];
b:=[z^190 + z^188 + z^186 + z^185 + z^181 + z^180 + z^177 + z^175 + z^174 + z^172 + z^171 + z^170 + z^167 + z^166 + z^164 + z^163 + z^161 + z^159 + z^154 + z^153 + z^151 + z^150 + z^149 + z^146 + z^142 + z^140 + z^137 + z^134 + z^132 + z^131 + z^130 + z^123 + z^121 + z^118 + z^117 + z^116 + z^115 + z^112 + z^111 + z^109+ z^108 + z^105 + z^103 + z^101 + z^99 + z^98 + z^97 + z^94 + z^92 + z^89 + z^88 + z^87 + z^86 + z^85 + z^84 + z^82 + z^80 + z^79 + z^78 + z^75 + z^71 + z^70 + z^69 + z^68 + z^66 + z^62 + z^61 + z^60 + z^59 + z^58 + z^57 + z^55 + z^51 + z^50 + z^49 + z^47 + z^46 + z^44 + z^41 + z^39 + z^38 + z^37 + z^34 + z^33 + z^32 + z^30 + z^27 + z^24 + z^23 + z^21 + z^18 + z^17 + z^15 + z^14 + z^11 + z^10 + z^6 + z^5 + z^3 + z];
b cat:= [0 : i in [1..n-gamma-1]];
b cat:=[z^191 + z^190 + z^189 + z^188 + z^185 + z^184 + z^183 + z^182 + z^180 + z^179 + z^177 + z^174 + z^171 + z^167 + z^165 + z^164 + z^163 + z^162 + z^157 + z^154 + z^149 + z^147 + z^145 + z^141 + z^140 + z^138 + z^136 + z^132 + z^131 + z^129 + z^128 + z^127 + z^125 + z^124 + z^121 + z^120 + z^117 + z^113 + z^110 + z^109 + z^108 + z^106 + z^105 + z^104 + z^100 + z^99 + z^96 + z^94 + z^93 + z^92 + z^88 + z^87 + z^86 + z^84 + z^81 + z^80 + z^78 + z^77 + z^75 + z^73 + z^70 + z^69 + z^68 + z^66 + z^65 + z^64 + z^62 + z^60 + z^58 + z^57 + z^56 + z^54 + z^53 + z^52 + z^49 + z^46 + z^45 + z^44 + z^43 + z^38 + z^36 + z^34 + z^27 + z^26 + z^24 + z^23 + z^22 + z^20 + z^19 + z^16 + z^10 + z^9 + z^8 + z^7 + z^5 + z^4 + z^3];
//b cat:=[Random(F)];
b cat:= [0 : i in [1..n-lammda-1]];
b:=Vector(F,b);
particular_solution:= Solution(B, b);
//particular_solution:= NullSpace(B).1;
solution:=[z : i in [1..l]];
for i := 1 to l do
    solution[i]:=particular_solution[i];
end for;

L_a:=solution cat [0 : i in [1..n-l]];
L_alpha_1:=LinearizedComposition(L_a,L1,n);
L_alpha_2:=LinearizedComposition(L_a,L2,n);

matrix_dickson1:=Matrix(F, n, n, [0 : i in [0..n-1], j in [0..n-1]]);
for i := 0 to n-1 do
    for j := 0 to n-1 do
        t:=(j-i) mod n;
        matrix_dickson1[i+1][j+1] :=L_a[t+1]^(2^i);
    end for;
end for;
print "L_a的dickson多项式的秩为",Rank(matrix_dickson1);


print "L_a的最高次项", find_nonzero(L_a)-1;
print "L_alpha_1的最高次项", find_nonzero(L_alpha_1)-1;
print "L_alpha_2的最高次项", find_nonzero(L_alpha_2)-1;


/*
SetOutputFile("M_192_fenjie.m": Overwrite := true);
PrintFile("M_192_fenjie.m","L1:=");
PrintFile("M_192_fenjie.m",L1);
PrintFile("M_192_fenjie.m","L2:=");
PrintFile("M_192_fenjie.m",L2);
PrintFile("M_192_fenjie.m","L_a:=");
PrintFile("M_192_fenjie.m",L_a);
PrintFile("M_192_fenjie.m","L_alpha_1:=");
PrintFile("M_192_fenjie.m",L_alpha_1);
PrintFile("M_192_fenjie.m","L_alpha_2:=");
PrintFile("M_192_fenjie.m",L_alpha_2);
*/
