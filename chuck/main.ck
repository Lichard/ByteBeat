fun int bitop(int t, int sel){
    if(sel==0)
        return t|t%255;
    else if(sel==1)
        return t*(41&t>>11);
}
1::samp-(now%1::samp)=>now;

Impulse s => dac;
 while(true) {
    Counter.t=>int i;
    (i,0)=>bitop=>int t;
    (t%256)=>t;
    if(t>127){
        t-256=>t;
    }
    t/128.0=>float f;
    f=>s.next;
    i++;
    1::samp => now;
 }