package networks;

import ned.DatarateChannel;
import modules.*;
import channels.*;

//
// TODO auto-generated type
//
network Simple_constant_quantum_cost
{
    parameters:
        **.Speed_of_light_in_fiber = 205336.986301 km;
        **.buffers = default(30);
        **.distance = 20 km;
        @display("bgb=746,327");
    types:
        channel C extends DatarateChannel
        {
            double cost = default(0);
            double distance @unit(km) = default(20km);
            //delay = uniform(0.01ms, 1s);
            double distance_of_light_in_fiber_per_sec @unit(km) = default(205336.986301km);
            delay = this.distance / distance_of_light_in_fiber_per_sec * 1s;
            datarate = uniform(1kbps, 100kbps);
            int test = default(0);
        }
        
    submodules:
        endnode[3]: QNode {
            address = 10000000+index;
            nodeType = "EndNode";
            @display("i=device/pc;");
        }
        repeater[3]: QNode {
            address = sizeof(endnode) + index;
            nodeType = "Repeater";
            @display("i=device/smallrouter");
        }
        HoM[6]: HoM {
            address = sizeof(endnode) +sizeof(repeater) + index;
            @display("i=device/bsm;");
        }
        router[1]: QNode {
            address = sizeof(endnode) +sizeof(repeater) +sizeof(HoM) + index;
            nodeType = "Router";
            @display("i=device/router;");
        }
    connections:
        endnode[0].port++ <--> C {  cost = 20; } <--> HoM[0].port++;
        HoM[0].port++ <--> C <--> repeater[0].port++;
        repeater[0].port++ <--> C <--> HoM[1].port++;
        HoM[1].port++ <--> C <--> router[0].port++;

        endnode[1].port++ <--> C <--> HoM[2].port++;
        HoM[2].port++ <--> C <--> repeater[1].port++;
        repeater[1].port++ <--> C <--> HoM[3].port++;
        HoM[3].port++ <--> C <--> router[0].port++;

        endnode[2].port++ <--> C <--> HoM[4].port++;
        HoM[4].port++ <--> C <--> repeater[2].port++;
        repeater[2].port++ <--> C <--> HoM[5].port++;
        HoM[5].port++ <--> C <--> router[0].port++;

        endnode[0].quantum_port++ <--> QuantumChannel <--> HoM[0].quantum_port++;
        HoM[0].quantum_port++ <--> QuantumChannel <--> repeater[0].quantum_port++;
        repeater[0].quantum_port++ <--> QuantumChannel <--> HoM[1].quantum_port++;
        HoM[1].quantum_port++ <--> QuantumChannel <--> router[0].quantum_port++;

        endnode[1].quantum_port++ <--> QuantumChannel <--> HoM[2].quantum_port++;
        HoM[2].quantum_port++ <--> QuantumChannel <--> repeater[1].quantum_port++;
        repeater[1].quantum_port++ <--> QuantumChannel <--> HoM[3].quantum_port++;
        HoM[3].quantum_port++ <--> QuantumChannel <--> router[0].quantum_port++;

        endnode[2].quantum_port++ <--> QuantumChannel <--> HoM[4].quantum_port++;
        HoM[4].quantum_port++ <--> QuantumChannel <--> repeater[2].quantum_port++;
        repeater[2].quantum_port++ <--> QuantumChannel <--> HoM[5].quantum_port++;
        HoM[5].quantum_port++ <--> QuantumChannel <--> router[0].quantum_port++;
}
