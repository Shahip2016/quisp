package modules.PhysicalConnection.BSA;

simple HoMController
{
    parameters:
        int address;
        volatile double Speed_of_light_in_fiber @unit(km);//per sec
        int photon_detection_per_sec = default(10000);
        double Initial_notification_timing_buffer @unit(s) = default(0);
        //rate can be up to 1 billion photons per second by default
        //interval will be 1photon/ns
        int neighbor_address = default(-1);
        int neighbor_address_two = default(-1);
        double distance_to_neighbor = default(-1);//in km
        double distance_to_neighbor_two = default(-1);//in km
        double max_neighbor_distance = default(-1);
        int max_buffer = default(-1);
        double emission_variance = default(0);//in seconds. Photons will be shot towards HoM with 100% accuracy
        bool receiver = default(false);
        bool passive = default(false);

        // performance
        @signal[creation_time](type="float");
        @statistic[creation_time](title="Bell pair creation time"; record=vector; interpolationmode=sample-hold);
    gates:
        input fromRouter_port @loose;
        output toRouter_port @loose;
        input fromBSA_port @loose;
}
