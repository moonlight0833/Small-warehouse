F2 := GF(2);
P<z> := PolynomialRing(F2);
f :=z^18 + z^3 + 1;
n:=18;
F<z> := ext< F2 | f >;
S<[X]> := PolynomialRing(F, n+2);
names := [ "X" cat "[" cat IntegerToString(i) cat "]" : i in [1..n] ] cat [ "k" ] cat ["v"];
AssignNames(~S, names);
X := [S.i : i in [1..n]];
k := S.(n+1);
v := S.(n+2);
e1:=3;
e2:=3;
e3:=3;
L1:= [z^15 + z^14 + z^9 + z^8 + z^6 + z^5 + z^3 + z + 1, z^14 + z^13 + z^10 + z^9 + z^8 + z^5 + z, z^12 + z^10 + z^9 + z^2 + z, z^15 + z^14 + z^13 + z^11 + z^10 + z^7 + z^6 + z^2 + z + 1, z^13 + z^12 + z^11 + z^8 + z^6 + z^5 + 1, z^14 + z^13 + z^9 + z^8 + z^7 + z^5 + z^4 + z^2 + 1, z^13 + z^11 + z^9 + z^8 + z^6 + z^5 + z^2 + z, z^12 + z^10 + z^9 + z^8 + z^6 + z^3 + 1, z^15 + z^14 + z^12 + z^11 + z^8 + z^6 + z^5 + z^2, z^14 + z^11 + z^9 + z^8 + z^7 + z^2 + z, z^13 + z^10 + z^9 + z^8 + z^7 + z^6 + z^5 + z^4 + z^3 + z, z^15 + z^13 + z^12 + z^9 + z^7 + z^6 + z, z^15 + z^14 + z^12 + z^8 + z^4 + z^3 + z + 1, z^13 + z^12 + z^9 + z^8 + z^6 + z^5 + z^4 + z^3 + 1, z^14 + z^13 + z^12 + z^10 + z^9 + z^4 + z^3 + z^2, z^15 + z^13 + z^12 + z^8 + z^5 + z^4 + z^3 + z^2 + 1, z^15 + z^12 + z^10 + z^7 + z^2 + z, z^15 + z^14 + z^10 + z^9 + z^8 + z^7 + z^5 + z^4 + z + 1] ;
L2:= [z^14 + z^10 + z^8 + z^5 + z^4 + z^3 + z^2 + z, z^13 + z^12 + z^9 + z^7 + z^5 + z^3 + z^2 + z + 1, z^15 + z^13 + z^9 + z^7 + z^5 + z^2 + 1, z^14 + z^11 + z^10 + z^7 + z^4 + z^3 + z^2 + 1, z^15 + z^9 + z^8 + z^7 + z^6 + z^3, z^15 + z^14 + z^9 + z^5 + z^4 + z^3 + 1, z^15 + z^13 + z^12 + z^7 + z^6 + z^5 + z^4 + 1, z^15 + z^13 + z^10 + z^9 + z^7 + z^2 + 1, z^15 + z^13 + z^10 + z^9 + z^8 + z^7 + z^6 + z + 1, z^13 + z^12 + z^11 + z^7 + z^6 + z^5 + z^3 + z^2, z^14 + z^11 + z^7 + z^4 + z, z^15 + z^11 + z^9 + z^6 + z^5 + z + 1, z^14 + z^13 + z^11 + z^7 + z^6 + z^4 + z^2 + z, z^13 + z^12 + z^10 + z^4 + z^3 + z + 1, z^11 + z^9 + z^6 + 1, z^15 + z^14 + z^11 + z^10 + z^9 + z^7 + z^3 + 1, z^14 + z^13 + z^12 + z^11 + z^9 + z^6 + 1, z^14 + z^11 + z^10 + z^8 + z^7 + z^5 + z^2 + 1] ;
c1:=z^15 + z^10 + z^9 + z^6 + z^5 + z^4 + z^3 + z^2 + z + 1;
c2:=z^12 + z^11 + z^9 + z^6 + z^5 + z + 1;
I1 := ideal<S | k^(2^18) + k>;
I2 := ideal<S | v^(2^18) + v>;
Q := quo<S | I1+I2 >;

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

function Enc(key,n) 
    z1:=key^(2^e1-1);
    z2:=key^(2^e2-1);
    z1:=Poly(L1,z1,n);
    z2:=Poly(L2,z2,n);
    z1:=z1+c1;
    z2:=z2+c2;
    zz:=z1+z2;
    print zz;
    zz:=zz^(2^e3-1);
    y:=key+zz;
    return y;
end function;


function substitution(t) 
    s, r := Quotrem(t, e3);
    vk:=1;
    for i in [1..s] do
        y:=z^17 + z^16 + z^12 + z^11 + z^10 + z^9 + z^7 + z^5 + z^4 + z^3 + z^2;
        vk:=vk*(y^(2^(t-i*e3))+k^(2^(t-i*e3)));
    end for;
    vk:=vk*v^(2^r);
    return vk;
end function;


function Substitution(L) 
    tt:=0;
    for i in [1..#L] do
        tt:=tt+L[i]*substitution(i-1);
    end for;
    return tt;
end function;



key:=z^15 + z^14 + z^13 + z^10 + z^7 + z^6 + z^5 + z^4 + z + 1;
print "secret key is:", key;
//y:=Enc(key,n);
y:=z^17 + z^16 + z^12 + z^11 + z^10 + z^9 + z^7 + z^5 + z^4 + z^3 + z^2;
print "cipher text is:", y;
vv:=z^17 + z^16 + z^15 + z^14 + z^13 + z^7 + z^6 + z^5 + z^4 + z;
beta:=Ceiling((2*n+1+e1+e2-e3)/3);
l:=beta+e3-1;
gamma:=beta-e1;
lammda:=beta-e2;
print l,gamma,lammda;

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
//b:=[z^14 + z^13 + z^11 + z^10 + z^9 + z^7 + z^6 + z^2];
//b:=[z^16 + z^15 + z^14 + z^13 + z^10 + z^8 + z^7 + z^5 + z^4 + z^3 + z^2 + 1];
b:=[z^17 + z^16 + z^15 + z^14 + z^13 + z^12 + z^10 + z^9 + z^8 + z^7 + z^5 + z^4 + z + 1];
b cat:= [0 : i in [1..n-gamma-1]];
b cat:=[z^16 + z^12 + z^11 + z^10 + z^8 + z^7 + z^6 + z^5 + z^4 + z^2];
b cat:= [0 : i in [1..n-lammda-1]];
b:=Vector(F,b);
print b;
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
print "The rank of dickson of L_a is",Rank(matrix_dickson1);

solu:=[0 : i in [1..18]];
solu cat:= [key,vv];

//f:=PolyQ(L_a,v,n)+PolyQ(L_alpha_1,k^(2^e1-1),n)+PolyQ(L_alpha_2,k^(2^e2-1),n)+Poly(L_a,c1+c2,n);
f:=Substitution(L_a)+PolyQ(L_alpha_1,k^(2^e1-1),n)+PolyQ(L_alpha_2,k^(2^e2-1),n)+Poly(L_a,c1+c2,n);
print Evaluate(f,solu);

g:=v^(2^e3-1)+y+k;
time ff:=Resultant(f,g,v);
time KEY:=Roots(UnivariatePolynomial(ff));
print "The key is in ",KEY;
print "Real key is",key;
