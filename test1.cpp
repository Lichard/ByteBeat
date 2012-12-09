#include <stdio.h>
int main(){
    for(long i=0;;i++){
        putchar(i*(i>>12|i>>8)&63&i>>4);
    }
}
