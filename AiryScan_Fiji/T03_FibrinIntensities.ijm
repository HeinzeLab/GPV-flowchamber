//Load the fibrin channel
open("//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/20210510_SB_Flusskammer_Ctrls/ctrl_wo ThrombinA647/Position 2/C3_oben_Airyscan_decon.tif");
selectWindow("C3_oben_Airyscan_decon.tif");
//Determine the intensity sum and number of pixel for the original image
run("Measure");

//Load the different masks generated in T01_Mask_generation.ijm
//Multiply with the fibrin channel
//Perform the measurements
//Close all images
//Li-threshold
open("//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/20210510_SB_Flusskammer_Ctrls/ctrl_wo ThrombinA647/Position 2/Masks_C3_oben/C3_oben_Airyscan_decon_Li_01.tif");
selectWindow("C3_oben_Airyscan_decon_Li_01.tif");
imageCalculator("Multiply create", "C3_oben_Airyscan_decon.tif","C3_oben_Airyscan_decon_Li_01.tif");
selectWindow("Result of C3_oben_Airyscan_decon.tif");
saveAs("Tiff", "//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/20210510_SB_Flusskammer_Ctrls/ctrl_wo ThrombinA647/Position 2/C3_oben/C3 x C3_oben_Airyscan_decon_Li_01.tif");
run("Measure");
close();
close();
//3x dilated
open("//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/20210510_SB_Flusskammer_Ctrls/ctrl_wo ThrombinA647/Position 2/Masks_C3_oben/C3_oben_Airyscan_decon_Li_3xdilate_01.tif");
selectWindow("C3_oben_Airyscan_decon_Li_3xdilate_01.tif");
imageCalculator("Multiply create", "C3_oben_Airyscan_decon.tif","C3_oben_Airyscan_decon_Li_3xdilate_01.tif");
selectWindow("Result of C3_oben_Airyscan_decon.tif");
saveAs("Tiff", "//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/20210510_SB_Flusskammer_Ctrls/ctrl_wo ThrombinA647/Position 2/C3_oben/C3 x C3_oben_Airyscan_decon_Li_3xdilate_01.tif");
run("Measure");
close();
//6x dilated
open("//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/20210510_SB_Flusskammer_Ctrls/ctrl_wo ThrombinA647/Position 2/Masks_C3_oben/C3_oben_Airyscan_decon_Li_6xdilate_01.tif");
selectWindow("C3_oben_Airyscan_decon_Li_6xdilate_01.tif");
imageCalculator("Multiply create", "C3_oben_Airyscan_decon.tif","C3_oben_Airyscan_decon_Li_6xdilate_01.tif");
selectWindow("Result of C3_oben_Airyscan_decon.tif");
saveAs("Tiff", "//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/20210510_SB_Flusskammer_Ctrls/ctrl_wo ThrombinA647/Position 2/C3_oben/C3 x C3_oben_Airyscan_decon_Li_6xdilate_01.tif");
close();
close();
close();
open("//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/20210510_SB_Flusskammer_Ctrls/ctrl_wo ThrombinA647/Position 2/C3_oben/C3 x C3_oben_Airyscan_decon_Li_6xdilate_01.tif");
selectWindow("C3 x C3_oben_Airyscan_decon_Li_6xdilate_01.tif");
run("Measure");
close();
//Narrow rim
open("//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/20210510_SB_Flusskammer_Ctrls/ctrl_wo ThrombinA647/Position 2/Masks_C3_oben/C3_oben_Airyscan_decon_Li_3xdil-3xero_01.tif");
selectWindow("C3_oben_Airyscan_decon_Li_3xdil-3xero_01.tif");
imageCalculator("Multiply create", "C3_oben_Airyscan_decon.tif","C3_oben_Airyscan_decon_Li_3xdil-3xero_01.tif");
selectWindow("Result of C3_oben_Airyscan_decon.tif");
saveAs("Tiff", "//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/20210510_SB_Flusskammer_Ctrls/ctrl_wo ThrombinA647/Position 2/C3_oben/C3 x C3_oben_Airyscan_decon_Li_3xdil-3xero_01.tif");
run("Measure");
close();
close();
//Broad rim
open("//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/20210510_SB_Flusskammer_Ctrls/ctrl_wo ThrombinA647/Position 2/Masks_C3_oben/C3_oben_Airyscan_decon_Li_6xdil-6xero_01.tif");
selectWindow("C3_oben_Airyscan_decon_Li_6xdil-6xero_01.tif");
imageCalculator("Multiply create", "C3_oben_Airyscan_decon.tif","C3_oben_Airyscan_decon_Li_6xdil-6xero_01.tif");
selectWindow("Result of C3_oben_Airyscan_decon.tif");
saveAs("Tiff", "//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/20210510_SB_Flusskammer_Ctrls/ctrl_wo ThrombinA647/Position 2/C3_oben/C3 x C3_oben_Airyscan_decon_Li_6xdil-6xero_01.tif");
run("Measure");
close();
close();
selectWindow("C3_oben_Airyscan_decon.tif");
close();

