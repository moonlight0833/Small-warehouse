F2 := GF(2);
P<z> := PolynomialRing(F2);
f :=z^256 + z^10 + z^5 + z^2 + 1;
n:=256;
F<z> := ext< F2 | f >;
AssertAttribute(F, "PowerPrinting", false);
S<[X]> := PolynomialRing(F, n+2);
names := [ "X" cat "[" cat IntegerToString(i) cat "]" : i in [1..n] ] cat [ "k" ] cat ["v"];
AssignNames(~S, names);
X := [S.i : i in [1..n]];
k := S.(n+1);
v := S.(n+2);
e1:=3;
e2:=53;
e3:=7;
e4:=5;
load "M_256.m";


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





beta:=Ceiling((3*n+1+e1+e2+e3-e4)/4);
l:=beta+e4-1;
gamma:=beta-e1;
lammda:=beta-e2;
tau:=beta-e3;
print l,3*n-lammda-gamma-tau;

L_a:= [X[i] : i in [1..l]];
L_a:=L_a cat [0 : i in [1..n-l]];
L_alpha_1:=LinearizedComposition(L_a,L1,n);
L_alpha_2:=LinearizedComposition(L_a,L2,n);
L_alpha_3:=LinearizedComposition(L_a,L3,n);
A := Matrix(F,3*n-lammda-gamma-tau, l, [0 : i in [1..3*n-lammda-gamma-tau], j in [1..l]]);
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
for i := tau+1 to n do
    for j := 1 to l do
        A[i-gamma+2*n-lammda-tau][j]:=MonomialCoefficient(L_alpha_3[i], X[j]);
    end for;
end for;

B:=Transpose(A);
//b:=[Random(F)];
b:=[z^253 + z^250 + z^249 + z^248 + z^246 + z^245 + z^243 + z^240 + z^238 + z^236 + z^235 + z^233 + z^230 + z^228 + z^227 + z^224 + z^222 + z^217 + z^212 + z^209 + z^208 + z^207 + z^205 + z^201 + z^199 + z^197 + z^196 + z^195 + z^193 + z^192 + z^191 + z^190 + z^189 + z^188 + z^187 + z^186 + z^184 + z^183 + z^181 + z^179 + z^178 + z^172 + z^170 + z^167 + z^166 + z^163 + z^162 + z^160 + z^159 + z^158 + z^157 + z^155 + z^154 + z^153 + z^151 + z^150 + z^147 + z^146 + z^144 + z^143 + z^140 + z^139 + z^138 + z^134 + z^133 + z^131 + z^129 + z^126 + z^125 + z^120 + z^119 + z^118 + z^116 + z^115 + z^112 + z^109 + z^107 + z^105 + z^104 + z^103 + z^98 + z^97 + z^92 + z^89+ z^86 + z^85 + z^82 + z^81 + z^79 + z^77 + z^76 + z^75 + z^73 + z^72 + z^71 + z^70 + z^68 + z^66 + z^65 + z^64 + z^62 + z^61 + z^58 + z^55 + z^52 + z^50 + z^48 + z^47 + z^45 + z^44 + z^42 + z^41 + z^40 + z^39 + z^38 + z^37 + z^36 + z^35 + z^34 + z^33 + z^32 + z^29 + z^28 + z^27 + z^26 + z^23 + z^21 + z^18 + z^11 + z^10 + z^8 + z^4 + z^2 + z + 1];
b cat:= [0 : i in [1..n-gamma-1]];
b cat:=[z^255 + z^254 + z^251 + z^250 + z^247 + z^246 + z^243 + z^237 + z^231 + z^227 + z^226 + z^225 + z^224 + z^223 + z^221 + z^219 + z^214 + z^213 + z^211 + z^209 + z^208 + z^205 + z^204 + z^202 + z^198 + z^194 + z^192 + z^191 + z^189 + z^186 + z^185 + z^184 + z^181 + z^180 + z^179 + z^178 + z^177 + z^176 + z^175 + z^174 + z^173 + z^172 + z^169 + z^166 + z^165 + z^162 + z^160 + z^156 + z^155 + z^153 + z^148 + z^147 + z^144 + z^143 + z^141 + z^139 + z^138 + z^128 + z^127 + z^126 + z^124 + z^123 + z^121 + z^120 + z^118 + z^117 + z^113 + z^112 + z^111 + z^110 + z^109 + z^106 + z^104 + z^102 + z^101 + z^99 + z^96 + z^95 + z^94 + z^93 + z^92 + z^90 + z^89 + z^88 + z^87 + z^86 + z^84 + z^81 + z^80 + z^79 + z^74 + z^70 + z^68 + z^67 + z^64 + z^63 + z^60 + z^58 + z^57 + z^55 + z^53 + z^52 + z^49 + z^48 + z^47 + z^45 + z^39 + z^38 + z^36 + z^35 + z^31 + z^30 + z^25 + z^22 + z^20 + z^14 + z^12 + z + 1];
//b cat:=[Random(F)];
b cat:= [0 : i in [1..n-lammda-1]];
b cat:=[z^254 + z^253 + z^251 + z^250 + z^247 + z^246 + z^242 + z^240 + z^239 + z^236 + z^233 + z^231 +z^230 + z^228 + z^224 + z^221 + z^220 + z^218 + z^214 + z^209 + z^208 + z^207 + z^205 + z^203 + z^199 + z^197 + z^196 + z^193 + z^191 + z^190 + z^188 + z^186 + z^182 + z^181 + z^178 + z^176 + z^174 + z^173 + z^171 + z^168 + z^166 + z^164 + z^163 + z^160 + z^159 + z^158 + z^154 + z^153 + z^151 + z^142 + z^141 + z^137 + z^136 + z^135 + z^133 + z^132 + z^131 + z^125 + z^124 + z^122 + z^120 + z^119 + z^116 + z^115 + z^113 + z^109 + z^108 + z^106 + z^105 + z^104 + z^103 + z^101 + z^95 + z^94 + z^92 + z^89 + z^88 + z^86 + z^85 + z^83 + z^82 + z^81 + z^80 + z^79 + z^78 + z^77 + z^74 + z^69 + z^68 + z^67 + z^65 + z^64 + z^61 + z^54 + z^53 + z^52 + z^49 + z^48+ z^47 + z^45 + z^42 + z^35 + z^34 + z^33 + z^31 + z^30 + z^23 + z^19 + z^18 + z^14 + z^13 + z^12 + z^10 + z^9 + z^8 + z^7 + z^6 + z^5 + z^4 + z^3 + z^2 + z];
//b cat:=[Random(F)];
b cat:= [0 : i in [1..n-tau-1]];
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
L_alpha_3:=LinearizedComposition(L_a,L3,n);


matrix_dickson1:=Matrix(F, n, n, [0 : i in [0..n-1], j in [0..n-1]]);
for i := 0 to n-1 do
    for j := 0 to n-1 do
        t:=(j-i) mod n;
        matrix_dickson1[i+1][j+1] :=L_a[t+1]^(2^i);
    end for;
end for;
print "L_a的dickson多项式的秩为",Rank(matrix_dickson1);


print "L_a", find_nonzero(L_a)-1;
print "L_alpha_1", find_nonzero(L_alpha_1)-1;
print "L_alpha_2", find_nonzero(L_alpha_2)-1;
print "L_alpha_3", find_nonzero(L_alpha_3)-1;


/*
SetOutputFile("M_256_fenjie.m": Overwrite := true);
PrintFile("M_256_fenjie.m","L1:=");
PrintFile("M_256_fenjie.m",L1);
PrintFile("M_256_fenjie.m","L2:=");
PrintFile("M_256_fenjie.m",L2);
PrintFile("M_256_fenjie.m","L_a:=");
PrintFile("M_256_fenjie.m",L_a);
PrintFile("M_256_fenjie.m","L_alpha_1:=");
PrintFile("M_256_fenjie.m",L_alpha_1);
PrintFile("M_256_fenjie.m","L_alpha_2:=");
PrintFile("M_256_fenjie.m",L_alpha_2);
PrintFile("M_256_fenjie.m","L_alpha_3:=");
PrintFile("M_256_fenjie.m",L_alpha_3);
*/

