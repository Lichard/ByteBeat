1::samp-(now%1::samp)=>now;
0=>Counter.t;
while(true){
    Counter.t++=>int t;
    1::samp=>now;
    if(t%16384==0)
        <<<t%10>>>;
}
