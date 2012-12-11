public class Counter{
    static int t;
    "localhost" => string hostname;
    6449=>int port;
    OscSend xmit;
    xmit.setHost(hostname, port);
    
    fun void send(int i){
        xmit.startMsg("/Pulse","i");
        i=>xmit.addInt;
    }
}