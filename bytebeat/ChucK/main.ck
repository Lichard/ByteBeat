fun int bitop(int t, int sel){
	int ret;
    if(sel==0)//bass rumble
         t|t%255=>ret;//-(t*3&t>>13&t>>6)=>ret;//&
	else if(sel==1)
        t*(((t>>11|t*t>>13)&t>>12)*(t>>14&t>>13))=>ret;
	else if(sel==2)//morse code left
              (((t>>1))*3*t>>14*t>>20)%255=>ret;
	else if(sel==3)//morse code right
		((t>>1%128)+20)*3*t>>14*t>>20=>ret;
	else if(sel==4)//0+ high melody 1
		(t>>13|t%24)&(t>>7|t%19)=>ret;
	else if(sel==5)//0+high melody 2
		t*(t>>9&t>>13)&32=>ret;
	else if(sel==6)//weird+REMIX
		t*(t>>((t>>11)&15))=>ret;//|t*(t>>9&5)<<1=>ret;
	else if(sel==7)//lost in space REMIX
        (t&t>>12)*(t>>4|t>>8)=>ret;//^t>>6=>ret;
	else if(sel==8)//Up or Down
		(t/7)|(t>>9)*t/((t>>14&3)+4)=>ret;
	else if(sel==9)//up down beats
		(t/10000000*t*t+t)%127|t>>4|t>>5|t%127+(t>>16)|t=>ret; 
	else if(sel==10)//funkish sound
		t+(t&t^t>>6)-t*((t>>9)&(t%16?2:6)&t>>9)=>ret;
    else if(sel==11)
        t|t%255|t%127=>ret;
	return ret;
}
if(Std.atoi(me.arg(3))==1)
    0=>Counter.t;
1::samp-(now%1::samp)=>now;
Impulse l;
Impulse r;
if(Std.atoi(me.arg(2))==1){
    l => dac.left;
    r => dac.right;
}
else{
    l => dac;
}
Counter c;
int i;
int g;
int t;
int x;
float f;
int y;
float h;

while(true) {
   c.t=> i;
   (i,Std.atoi(me.arg(0)))=>bitop=>t;
   (t%256)=>x;
   if(x>127)
       x-256=>t;
   x/128.0=>f;
   f=>l.next;
   
   if(Std.atoi(me.arg(2))==1){
      (i,Std.atoi(me.arg(1)))=>bitop=>g;
      (g%256)=> y;
      if(y>127)
        y-256=>t;
      y/128.0=> h;
      h=>r.next;
      c.send((x+y)/2);
    }
    else
        c.send(x);//SEND OSC    
    i++;
    1::samp => now;
 }