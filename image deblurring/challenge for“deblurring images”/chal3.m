m=256;n=256;noise=0.000001;
[B, Ac, Ar, X] = challenge1(m, n, noise);
%EµÄF·¶Êý£º
Fe=0.05/(cond(Ac)*cond(Ar))*norm(B,'fro');
%3.3358e-08