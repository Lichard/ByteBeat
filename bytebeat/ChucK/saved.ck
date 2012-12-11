fun int bitop(int t, int sel){
	int ret;
    if(sel==0)//silence bleep
		t*(((t>>11|t*t>>13)&t>>12)*(t>>14&t>>13))=>ret;
    else if(sel==1)//bass rumble
        t|t%255=>ret;
	else if(sel==2)//morse code left
		(((t>>1))*3*t>>14*t>>20)%255=>ret;
	else if(sel==3)//morse code right
		((t>>1%128)+20)*3*t>>14*t>>20=>ret;
	else if(sel==4)//lava jumpy
		t*(((t>>12)|(t>>8))&(63&(t>>4)))=>ret;
	else if(sel==5)//dance bleep
		t*(t>>((t>>11)&15))=>ret;
	else if(sel==6)//remix of above
		t*(t>>((t>>11)&15))|t*(t>>9&5)<<1=>ret;
	else if(sel==7)//tejeez
            ((t*(t>>5|t>>8))>>(t>>16)=>ret;
	else if(sel==8)//Sierpinski
		t&t>>8=>ret;
	else if(sel==9)//increasing 
		t*t>>9=>ret;//right
		t%255*(t>>9)=>;//left
	else if(sel==10)//funky
		t+(t&t^t>>6)-t*((t>>9)&(t%16?2:6)&t>>9)=>ret;
	else if(sel==11)//up or down?
		(t/7)|(t>>9)*t/((t>>14&3)+4)=>ret;
	else if(sel==12)//ultrageranium
		(t*t/256)&(t>>((t/1024)%16))^t%64*(0xC0D3DE4D69>>(t>>9&30)&t%32)*t>>18=>ret;
	else if(sel==13)//chirp ambulance
		(t&t>>12)*(t>>4|t>>8)^t>>6=>ret;
	//send message code here;
    return ret;
}