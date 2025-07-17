1. All the linearized polynomial is stored as a list, for instance, L:=[1,1,1,1] represents L:=x+x^2+x^{2^2}+x^{2^3}
2. The coeffients of linearized polynomial decomposition is stored in hex form
3. We use Magma V2.28-3 and sagemath 9.5 to make all the experiments
4. In 2-round-rain file, "F_2^30_verify.m" is a verify program of 2-round-rain over F_2^30.  "M128.m", "M192.m" ,"M256.m" stored the coeffients of linearized polynomial decomposition. "M" stored the coeffients of the original linearized polynomial of Rain-128/192/256
5. In 3-round-rain file, "F_2^18_verify.m" is a verify program of 3-round-rain over F_2^18
6. In AIM file, "AIM-18_verify.m" is a verify program of AIM over F_2^18, "M128.m", "M192.m" ,"M256.m" stored the coeffients of linearized polynomial decomposition of AIM-I/III/V respectively
