F2 := GF(2);
P<z> := PolynomialRing(F2);
f :=z^30+z^6+z^4+z+1;
n:=30;
F<z> := ext< F2 | f >;
S<[X]> := PolynomialRing(F, n+1);
names := [ "X" cat "[" cat IntegerToString(i) cat "]" : i in [1..n] ] cat [ "x" ];
AssignNames(~S, names);
X := [S.i : i in [1..n]];
k := S.(n+1);
AssertAttribute(F, "PowerPrinting", false);
p0:=z^27 + z^24 + z^21 + z^20 + z^19 + z^18 + z^14 + z^11 + z^6 + z^5 + z^3 + 1; 
k0:=z^28 + z^23 + z^22 + z^21 + z^19 + z^17 + z^16 + z^14 + z^13 + z^10 + z^9 + z^6 + z^4 + z^3 + z^2 + z;
print "secret key is:",k0;
c1:=z^29 + z^28 + z^27 + z^25 + z^24 + z^22 + z^20 + z^17 + z^16 + z^13 + z^12 + z^10 + z^9 + z^7 + z^6 + z^5 + z^3 + z;
c2:=z^29 + z^27 + z^26 + z^24 + z^23 + z^16 + z^15 + z^14 + z^12 + z^10 + z^8 + z^7+ z^3 + z;

L1:=[z^18 + z^16 + z^14 + z^10 + z^6 + z^5 + z^2, z^19 + z^18 + z^16 + z^13 + z^11 + z^9 + z^7 + z^6 + z^2 + z + 1, z^23 + z^22 + z^21 + z^17 + z^16 + z^15 + z^12 + z^11 + z^8 + z^5 + z^4 + z^2 + z + 1, z^23 + z^21 + z^19 + z^18 + z^17 + z^14 + z^5 + z^3, z^22 + z^21 + z^19 + z^18 + z^17 + z^15 + z^13 + z^10 + z^9 + z^8 + z^5 + z + 1, z^23 + z^20 + z^19 + z^16 + z^15 + z^13 + z^8 + z^7 + z^4 + z^3 + z^2 + z + 1, z^23 + z^19 + z^14 + z^13 + z^12 + z^9 + z^6 + z^5 + z^4 + z^3 + z, z^23 + z^20 + z^19 + z^17 + z^14 + z^12 + z^11 + z^10 + z^9 + z^8 + z^6 + z^5 + z^4 + z^3 + z, z^21 + z^17 + z^16 + z^15 + z^13 + z^12 + z^10 + z^8 + z^7 + z^6 + z, z^22 + z^21 + z^20 + z^18 + z^17 + z^16 + z^13 + z^10 + z^7 + z^6 + z^5, z^22 + z^20 + z^17 + z^16 + z^14 + z^11 + z^10 + z^8 + z^7 + z^6 + z^5 + z^4 + z^3 + z^2, z^21 + z^18 + z^15 + z^14 + z^12 + z^9 + z^8 + z^7 + z^2 + z + 1, z^23 + z^21 + z^20 + z^18 + z^13 + z^9 + z^7 + z^2, z^21 + z^20 + z^19 + z^18 + z^16 + z^14 + z^10 + z^9 + z^7 + z^6 + z^5 + z^2 + z, z^22 + z^21 + z^14 + z^13 + z^12 + z^8 + z^7 + z^5 + z^2 + z + 1, z^23 + z^19 + z^12 + z^11 + z^9 + z^8 + z^6 + z^5 + 1, z^20 + z^18 + z^17 + z^16 + z^11 + z^10 + z^9 + z^8 + z^7 + z^4 + z^3 + 1, z^20 + z^19 + z^15 + z^14 + z^11 + z^10 + z^8 + z^6 + z^5 + z^3, z^23 + z^22 + z^16 + z^15 + z^13 + z^11 + z^7 + z^6 + z^2 + z, z^23 + z^21 + z^19 + z^14 + z^13 + z^9 + z^8 + z^7 + z^5 + z^3 + z + 1, z^20 + z^19 + z^18 + z^17 + z^15 + z^12 + z^10 + z^8 + z^7 + z^6 + z^4 + z^3 + z^2 + z + 1, z^20 + z^19 + z^18 + z^17 + z^16 + z^14 + z^12 + z^7 + z^3 + z, z^18 + z^17 + z^16 + z^13 + z^11 + z^10 + z^8 + z^7 + z^6 + z, z^23 + z^21 + z^20 + z^19 + z^18 + z^17 + z^12 + z^11 + z^9 + z^8 + z^6 + z^5 + z^2 + 1, z^21 + z^19 + z^18 + z^17 + z^16 + z^15 + z^13 + z^12 + z^11 + z^10 + z^9 + z^7 + z^4 + z^2 + z + 1, z^20 + z^18 + z^17 + z^15 + z^14 + z^13 + z^12 + z^11 + z^10 + z^9 + z^7 + z^4 + z^2, z^23 + z^22 + z^15 + z^13 + z^12 + z^10 + z^8 + z^6 + z^5 + z^4 + z^3 + z^2 + 1, z^23 + z^22 + z^20 + z^17 + z^16 + z^13 + z^10 + z^6 + z^5 + z^3 + z^2 + z, z^23 + z^22 + z^19 + z^15 + z^14 + z^13 + z^11 + z^10 + z^9 + z^8 + z^7 + z^6 + z^5 + z^2 + 1, z^23 + z^22 + z^21 + z^20 + z^19 + z^15 + z^14 + z^10 + z^7 + z^5];

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
    d:=find_nonzero(poly);
    for i :=0 to d-1 do
        t:=t+poly[i+1]*a^(2^i);
    end for;
    return t;
end function;

function Poly1(poly,a,n)
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

function Enc(p,key,n) //2-round rain encryption
    p:=p+key;
    p:=p+c1;
    p:=1/p;
    p:=Poly(L1,p,n);
    p:=p+key+c2;
    p:=1/p;
    c:=p+key;
    return c;
end function;

c:=Enc(p0,k0,n);
l:=15;
gamma:=15;
L_a:= [X[i] : i in [1..l]];
L_a:=L_a cat [0 : i in [1..n-l]];
L_alpha:=LinearizedComposition(L_a,L1,n);
A := Matrix(F,n-gamma, l, [0 : i in [1..n-gamma], j in [1..l]]);
for i := gamma+1 to n do
    for j := 1 to l do
        A[i-gamma][j]:=MonomialCoefficient(L_alpha[i], X[j]);
    end for;
end for;

B:=Transpose(A);
b:=[z^29 + z^28 + z^23 + z^22 + z^21 + z^20 + z^19 + z^18 + z^17 + z^14 + z^12 + z^8 + z^5 + z^4 + z^2 + z + 1];
b cat:= [0 : i in [1..n-gamma-1]];
b:=Vector(F,b);
particular_solution:= Solution(B, b);
//particular_solution:= NullSpace(B).1;
solution:=[z : i in [1..l]];
for i := 1 to l do
    solution[i]:=particular_solution[i];
end for;

L_a:=solution cat [0 : i in [1..n-l]];

L_alpha:=LinearizedComposition(L_a,L1,n);
matrix_dickson1:=Matrix(F, n, n, [0 : i in [0..n-1], j in [0..n-1]]);
for i := 0 to n-1 do
    for j := 0 to n-1 do
        t:=(j-i) mod n;
        matrix_dickson1[i+1][j+1] :=L_a[t+1]^(2^i);
    end for;
end for;
r1:=Rank(matrix_dickson1);
print "The rank of dickson of L_a is:",r1;

l:=find_nonzero(L_a);
gamma:=find_nonzero(L_alpha);
time G1:=(p0^(2^gamma)+k^(2^gamma)+c1^(2^gamma))*cipro(L_a,c+k);
time G2:=(c^(2^l)+k^(2^l))*cipro(L_alpha,p0+k+c1);
time G3:=(p0^(2^gamma)+k^(2^gamma)+c1^(2^gamma))*(c^(2^l)+k^(2^l))*Poly(L_a,k+c2,n);
G:=G1+G2+G3;
print Degree(G);
solu:=[0 : i in [1..30]];
solu cat:= [k0];
print Evaluate(G,solu);
time KEY:=Roots(UnivariatePolynomial(G));
print "The key is in ",KEY;
print "Real key is",k0;

