/*
==============================================
* Test parameter configuration package

*   Date: 4/25/24
==============================================
*/

package tst_config_pkg;
    parameter int ADC_RESOLUTION = 10;
    parameter int PERIOD = 100;
    parameter real VREF = 2**ADC_RESOLUTION;
    parameter int SANITY_SEQUENCE_ITERATIONS = 10000;
    parameter real LSB_VAL = VREF * (real'(1)/2**ADC_RESOLUTION);
endpackage
