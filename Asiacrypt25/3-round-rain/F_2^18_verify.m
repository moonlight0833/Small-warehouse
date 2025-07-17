F2 := GF(2);
P<z> := PolynomialRing(F2);
f :=z^18 + z^3 + 1;
n:=18;
F<z> := ext< F2 | f >;
AssertAttribute(F, "PowerPrinting", false);
S<[X]> := PolynomialRing(F, n+1);
names := [ "X" cat "[" cat IntegerToString(i) cat "]" : i in [1..n] ] cat [ "x" ];
AssignNames(~S, names);
X := [S.i : i in [1..n]];
k := S.(n+1);
L1:= [z^15 + z^14 + z^9 + z^8 + z^6 + z^5 + z^3 + z + 1, z^14 + z^13 + z^10 + z^9 + z^8 + z^5 + z, z^12 + z^10 + z^9 + z^2 + z, z^15 + z^14 + z^13 + z^11 + z^10 + z^7 + z^6 + z^2 + z + 1, z^13 + z^12 + z^11 + z^8 + z^6 + z^5 + 1, z^14 + z^13 + z^9 + z^8 + z^7 + z^5 + z^4 + z^2 + 1, z^13 + z^11 + z^9 + z^8 + z^6 + z^5 + z^2 + z, z^12 + z^10 + z^9 + z^8 + z^6 + z^3 + 1, z^15 + z^14 + z^12 + z^11 + z^8 + z^6 + z^5 + z^2, z^14 + z^11 + z^9 + z^8 + z^7 + z^2 + z, z^13 + z^10 + z^9 + z^8 + z^7 + z^6 + z^5 + z^4 + z^3 + z, z^15 + z^13 + z^12 + z^9 + z^7 + z^6 + z, z^15 + z^14 + z^12 + z^8 + z^4 + z^3 + z + 1, z^13 + z^12 + z^9 + z^8 + z^6 + z^5 + z^4 + z^3 + 1, z^14 + z^13 + z^12 + z^10 + z^9 + z^4 + z^3 + z^2, z^15 + z^13 + z^12 + z^8 + z^5 + z^4 + z^3 + z^2 + 1, z^15 + z^12 + z^10 + z^7 + z^2 + z, z^15 + z^14 + z^10 + z^9 + z^8 + z^7 + z^5 + z^4 + z + 1] ;
L1_inverse:= [z^16 + z^15 + z^12 + z^11 + z^8 + z^7 + z^4 + z^2 + 1, z^16 + z^15 + z^14 + z^13 + z^11 + z^8 + z^6 + z^3 + z^2, z^17 + z^16 + z^15 + z^14 + z^11 + z^10 + z^7 + z^6 + z^5 + z^3 + z + 1, z^17 + z^14 + z^12 + z^11 + z^9 + z^8 + z^7 + z^6 + z^4 + z^3, z^17 + z^16 + z^15 + z^14 + z^13 + z^6 + z^5 + z^4 + z^3 + z^2, z^17 + z^12 + z^7 + z + 1, z^17 + z^16 + z^15 + z^8 + z^5 + z^3 + z^2 + 1, z^17 + z^16 + z^15 + z^14 + z^12 + z^11 + z^9 + z^8 + z^5 + z^4 + z^3 + z + 1, z^17 + z^16 + z^14 + z^13 + z^12 + z^7 + z^5 + z^2, z^17 + z^16 + z^15 + z^14 + z^11 + z^6 + z^4 + z^2 + z + 1, z^15 + z^13 + z^11 + z^10 + z^9 + z^6, z^17 + z^14 + z^13 + z^12 + z^7 + z^5 + z^4 + 1, z^17 + z^15 + z^14 + z^13 + z^9 + z^6 + z^5 + z^3 + z^2 + z + 1, z^16 + z^12 + z^11 + z^10 + z^9 + z^8 + z^7 + z^6 + z^4 + z^3 + z^2, z^16 + z^15 + z^11 + z^7 + z^5, z^17 + z^15 + z^14 + z^12 + z^11 + z^10 + z^7 + z^6 + z^3 + z, z^17 + z^16 + z^15 + z^13 + z^12 + z^11 + z^5 + z^3 + z + 1, z^16 + z^15 + z^14 + z^10 + z^9 + z^4 + z] ;
L2:= [z^14 + z^10 + z^8 + z^5 + z^4 + z^3 + z^2 + z, z^13 + z^12 + z^9 + z^7 + z^5 + z^3 + z^2 + z + 1, z^15 + z^13 + z^9 + z^7 + z^5 + z^2 + 1, z^14 + z^11 + z^10 + z^7 + z^4 + z^3 + z^2 + 1, z^15 + z^9 + z^8 + z^7 + z^6 + z^3, z^15 + z^14 + z^9 + z^5 + z^4 + z^3 + 1, z^15 + z^13 + z^12 + z^7 + z^6 + z^5 + z^4 + 1, z^15 + z^13 + z^10 + z^9 + z^7 + z^2 + 1, z^15 + z^13 + z^10 + z^9 + z^8 + z^7 + z^6 + z + 1, z^13 + z^12 + z^11 + z^7 + z^6 + z^5 + z^3 + z^2, z^14 + z^11 + z^7 + z^4 + z, z^15 + z^11 + z^9 + z^6 + z^5 + z + 1, z^14 + z^13 + z^11 + z^7 + z^6 + z^4 + z^2 + z, z^13 + z^12 + z^10 + z^4 + z^3 + z + 1, z^11 + z^9 + z^6 + 1, z^15 + z^14 + z^11 + z^10 + z^9 + z^7 + z^3 + 1, z^14 + z^13 + z^12 + z^11 + z^9 + z^6 + 1, z^14 + z^11 + z^10 + z^8 + z^7 + z^5 + z^2 + 1] ;
L2_inverse:= [z^17 + z^15 + z^13 + z^11 + z^10 + z^9 + z^7 + z^6 + z^5 + z^3 + z + 1, z^17 + z^16 + z^15 + z^14 + z^11 + z^8 + z^6 + z^5 + z^3 + 1, z^17 + z^13 + z^10 + z^9 + z^8 + z^7 + z^4 + z + 1, z^16 + z^14 + z^12 + z^11 + z^10 + z^9 + z^7 + z^2 + z + 1, z^14 + z^13 + z^12 + z^11 + z^10 + z^6 + z^5 + z^3 + z^2 + z, z^17 + z^16 + z^15 + z^14 + z^12 + z^11 + z^9 + z^5 + z^4 + z^3 + z^2 + z + 1, z^14 + z^13 + z^12 + z^8 + z^7 + z^6 + z^3 + 1, z^17 + z^15 + z^13 + z^12 + z^11 + z^10 + z^9 + z^8 + z^7 + z^6 + z^5 + z^4 + z^3 + 1, z^17 + z^14 + z^11 + z^9 + z^7 + z^6 + z^5 + z^3 + z^2 + z + 1, z^17 + z^15 + z^14 + z^13 + z^11 + z^9 + z^8 + z^2 + z + 1, z^14 + z^13 + z^9 + z^7 + z^4 + z^3 + z + 1, z^17 + z^16 + z^10 + z^8 + z^7 + z^6 + z^5 + z + 1, z^17 + z^14 + z^13 + z^9, z^13 + z^10 + z^8 + z^7 + z^6 + z^4 + z^3 + z^2 + 1, z^17 + z^13 + z^12 + z^11 + z^10 + z^7 + z^6 + z^3 + 1, z^17 + z^12 + z^10 + z^7 + z^5 + z, z^17 + z^16 + z^15 + z^14 + z^12 + z^10 + z^9 + z^7 + z^6 + z^3 + z^2 + z, z^17 + z^16 + z^15 + z^12 + z^10 + z^9 + z^8 + z^7 + z^6 + z^5 + z^3 + z^2 + z] ;
c1:=z^15 + z^10 + z^9 + z^6 + z^5 + z^4 + z^3 + z^2 + z + 1;
c2:=z^12 + z^11 + z^9 + z^6 + z^5 + z + 1;
c3:=z^15 + z^10 + z^6 + z^3 + z;
I := ideal<S | k^(2^18) + k>;
Q := quo<S | I >;
//K: 0xe4f3
//P: 0xdf0f
//C: 0x276d3


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
    t:=Q!t;
    for i :=0 to n-1 do
        t:=t+Q!poly[i+1]*Q!a^(2^i);
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

function Enc(p,key,n) //3-round rain encryption
    p:=p+key+c1;
    p:=1/p;
    p:=Poly(L1,p,n);
    p:=p+key+c2;
    p:=1/p;
    p:=Poly(L2,p,n);
    p:=p+key+c3;
    p:=1/p;
    c:=p+key;
    return c;
end function;


key:=z^15 + z^14 + z^13 + z^10 + z^7 + z^6 + z^5 + z^4 + z + 1;
p:=z^15 + z^14 + z^12 + z^11 + z^10 + z^9 + z^8 + z^3 + z^2 + z + 1;
//C:=z^17 + z^14 + z^13 + z^12 + z^10 + z^9 + z^7 + z^6 + z^4 + z + 1;

g:=z^14 + z^13 + z^12 + z^9 + z^8 + z^6 + z^5 + z^4 + z^3 + z;//Primitive element
//p:=Random(F); 
print "plain text is:", p;
//key:=Random(F); 
print "secret key is:", key;
c:=Enc(p,key,n);
print "cipher text is:", c;


g1:=g^(2^9+1);


function guess(beta,p,c) //3-round rain encryption
    beta_inverse:=1/beta;
    l:=12;
    gamma:=12;
    lammda:=12;
    L_a:= [X[i] : i in [1..l]];
    L_a:=L_a cat [0 : i in [1..n-l]];
    L_b:= [L_a[((i+9) mod n)+1]*beta_inverse^(2^i) : i in [0..n-1]];
    //L_b:= L_a[10..l] cat [0 : i in [1..n-l]] cat L_a[1..9];
    L_alpha:=LinearizedComposition(L_a,L1,n);
    L_beta:=LinearizedComposition(L_b,L2_inverse,n);

    A := Matrix(F,2*n-lammda-gamma, l, [0 : i in [1..2*n-lammda-gamma], j in [1..l]]);
    for i := gamma+1 to n do
        for j := 1 to l do
            A[i-gamma][j]:=MonomialCoefficient(L_alpha[i], X[j]);
        end for;
    end for;
    for i := lammda+1 to n do
        for j := 1 to l do
            A[i-gamma+n-lammda][j]:=MonomialCoefficient(L_beta[i], X[j]);
        end for;
    end for;
    r1:=0;
    r2:=0;
    while r1 ne 18 or r2 ne 18 do
        B:=Transpose(A);
        //b:=[z^14 + z^13 + z^11 + z^10 + z^9 + z^7 + z^6 + z^2];
        b:=[Random(F)];
        b cat:= [0 : i in [1..n-gamma-1]];
        b cat:=[Random(F)];
        b cat:= [0 : i in [1..n-lammda-1]];
        b:=Vector(F,b);
        particular_solution:= Solution(B, b);
        //particular_solution:= NullSpace(B).1;
        solution:=[z : i in [1..l]];
        for i := 1 to l do
            solution[i]:=particular_solution[i];
        end for;

        L_a:=solution cat [0 : i in [1..n-l]];
        L_b:= [L_a[((i+9) mod n)+1]*beta_inverse^(2^i) : i in [0..n-1]];
        L_alpha:=LinearizedComposition(L_a,L1,n);
        L_beta:=LinearizedComposition(L_b,L2_inverse,n);
        matrix_dickson1:=Matrix(F, n, n, [0 : i in [0..n-1], j in [0..n-1]]);
        for i := 0 to n-1 do
            for j := 0 to n-1 do
                t:=(j-i) mod n;
                matrix_dickson1[i+1][j+1] :=L_a[t+1]^(2^i);
            end for;
        end for;
        r1:=Rank(matrix_dickson1);
        //print "The rank of dickson of L_a is",Rank(matrix_dickson1);

        matrix_dickson2:=Matrix(F, n, n, [0 : i in [0..n-1], j in [0..n-1]]);
        for i := 0 to n-1 do
            for j := 0 to n-1 do
                t:=(j-i) mod n;
                matrix_dickson2[i+1][j+1] :=L_b[t+1]^(2^i);
            end for;
        end for;
        r2:=Rank(matrix_dickson2);
        //print "The rank of dickson of L_b is",Rank(matrix_dickson2);
    end while;
    

    gamma:=find_nonzero(L_alpha);
    lammda:=find_nonzero(L_beta);
    solu:=[0: i in [1..n]] cat [key];

    L_alpha_1:=cipro(L_alpha,p+k+c1);
    L_beta_1:=cipro(L_beta,c+k);
    L_a_beta:=Poly(L_a,k+c2,n)+Poly(L_beta,k+c3,n);
    G:=(c^(2^lammda)+k^(2^lammda))*L_alpha_1+(p^(2^gamma)+k^(2^gamma)+c1^(2^gamma))*L_beta_1+(c^(2^lammda)+k^(2^lammda))*(p^(2^gamma)+k^(2^gamma)+c1^(2^gamma))*L_a_beta;
    KEY:=Roots(UnivariatePolynomial(G));
    for i := 1 to #KEY do
        //if KEY[i][1] ne z^14 + z^12 + z^11 + z^8 + z^6 + z^5 + z^4 and KEY[i][1] ne z^17 + z^14 + z^13 + z^12+ z^10 + z^9 + z^7 + z^6 + z^4 + z + 1 then 
        if KEY[i][1] ne c and KEY[i][1] ne p+c1 then 
            key_1:=KEY[i][1];
            if Enc(p,key_1,n) eq c then 
                print "----------------------------------------------";
                print "right guess:",beta;
                print "secret key is:",key_1;
                print "cipher text is:",c;
                return 1; 
            end if;
        end if;
    end for;

    return 0;
end function;





function Guess(g1) 
    for i := 0 to 2^9-2 do
        print "the guessing power is", i;
        beta:=g1^i;
        if guess(beta,p,c) eq 1 then
            print i;
        end if;
    end for;
    return 0;
end function;

time Guess(g1);

//beta:=z^14 + z^11 + z^10 + z^4 + z + 1;

