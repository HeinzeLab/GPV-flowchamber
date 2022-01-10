//Open the GPV image
open("//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/Exported tif/C2_bottom_FC_PFA.tif");
//Open the basic Fibrin and GPIX masks
open("//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/GPV_analysis/C3_bottom_FC_PFA_Li_01.tif");
open("//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/GPV_analysis/C4_bottom_FC_PFA_Li_01.tif");
open("//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/GPV_analysis/C3_bottom_FC_PFA_Li_10.tif");
open("//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/GPV_analysis/C4_bottom_FC_PFA_Li_10.tif");

//Determine the number of pixel, intensity etc of the original GPV image using Fiji's "measure" options
selectWindow("C2_bottom_FC_PFA.tif");
run("Measure");
//Next, the original GPV image is multiplied with the loaded basic masks first
//Here, the intensity values outside fibrin-rich region or outside the thrombus are set to 0 (multiplication with 0)
//Intensity values inside are unchanged (multiplication with 1)
//Intensity-sum and the number of pixel > 0 are determined
imageCalculator("Multiply create", "C2_bottom_FC_PFA.tif","C3_bottom_FC_PFA_Li_01.tif");
selectWindow("Result of C2_bottom_FC_PFA.tif");
run("Measure");
saveAs("Tiff", "//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/GPV_analysis/C2 x C3_bottom_FC_PFA_Li_01.tif");
imageCalculator("Multiply create", "C2_bottom_FC_PFA.tif","C4_bottom_FC_PFA_Li_01.tif");
selectWindow("Result of C2_bottom_FC_PFA.tif");
run("Measure");
//In the next tow operations, the intensity values inside fibrin-rich region or inside the thrombus are set to 0 (multiplication with 0)
//Intensity values outside are unchanged (multiplication with 1)
//Intensity-sum and the number of pixel > 0 are determined
saveAs("Tiff", "//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/GPV_analysis/C2 x C4_bottom_FC_PFA_Li_01.tif");
imageCalculator("Multiply create", "C2_bottom_FC_PFA.tif","C3_bottom_FC_PFA_Li_10.tif");
selectWindow("Result of C2_bottom_FC_PFA.tif");
run("Measure");
saveAs("Tiff", "//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/GPV_analysis/C2 x C3_bottom_FC_PFA_Li_10.tif");
imageCalculator("Multiply create", "C2_bottom_FC_PFA.tif","C4_bottom_FC_PFA_Li_10.tif");
selectWindow("Result of C2_bottom_FC_PFA.tif");
run("Measure");
saveAs("Tiff", "//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/GPV_analysis/C2 x C4_bottom_FC_PFA_Li_10.tif");

//Open the mask "outside thrombus and outside fibrin" (=background), multiply with GPV and run the measurement
open("//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/GPV_analysis/C4_10 x C3_bottom_FC_PFA_Li_10.tif");
imageCalculator("Multiply create", "C2_bottom_FC_PFA.tif","C4_10 x C3_bottom_FC_PFA_Li_10.tif");
selectWindow("Result of C2_bottom_FC_PFA.tif");
run("Measure");
saveAs("Tiff", "//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/GPV_analysis/C2 x C4_10 x C3_bottom_FC_PFA_Li_10.tif");

//Open the masks for "inside fibrin but outside thrombus" including the 100 nm and 200 nm dilations
open("//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/GPV_analysis/C4_10 x C3_bottom_FC_PFA_Li_01.tif");
open("//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/GPV_analysis/C4_10 x C3_bottom_FC_PFA_Li_3xdil_01.tif");
open("//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/GPV_analysis/C4_10 x C3_bottom_FC_PFA_Li_6xdil_01.tif");

//Multiply these masks with the GPV image and also determine the measures
imageCalculator("Multiply create", "C2_bottom_FC_PFA.tif","C4_10 x C3_bottom_FC_PFA_Li_01.tif");
selectWindow("Result of C2_bottom_FC_PFA.tif");
run("Measure");
saveAs("Tiff", "//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/GPV_analysis/C2 x C4_10 x C3_bottom_FC_PFA_Li_01.tif");
imageCalculator("Multiply create", "C2_bottom_FC_PFA.tif","C4_10 x C3_bottom_FC_PFA_Li_3xdil_01.tif");
selectWindow("Result of C2_bottom_FC_PFA.tif");
run("Measure");
saveAs("Tiff", "//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/GPV_analysis/C2 x C4_10 x C3_bottom_FC_PFA_Li_3xdil_01.tif");
imageCalculator("Multiply create", "C2_bottom_FC_PFA.tif","C4_10 x C3_bottom_FC_PFA_Li_6xdil_01.tif");
selectWindow("Result of C2_bottom_FC_PFA.tif");
run("Measure");
saveAs("Tiff", "//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/GPV_analysis/C2 x C4_10 x C3_bottom_FC_PFA_Li_6xdil_01.tif");

//Finally, open the masks for the narrow and broad rim
open("//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/GPV_analysis/C4_10 x C3_bottom_FC_PFA_Li_narrow_01.tif");
open("//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/GPV_analysis/C4_10 x C3_bottom_FC_PFA_Li_broad_01.tif");

//Multiply these masks with the GPV image and also determine the measures
imageCalculator("Multiply create", "C2_bottom_FC_PFA.tif","C4_10 x C3_bottom_FC_PFA_Li_narrow_01.tif");
selectWindow("Result of C2_bottom_FC_PFA.tif");
run("Measure");
saveAs("Tiff", "//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/GPV_analysis/C2 x C4_10 x C3_bottom_FC_PFA_Li_narrow_01.tif");
imageCalculator("Multiply create", "C2_bottom_FC_PFA.tif","C4_10 x C3_bottom_FC_PFA_Li_broad_01.tif");
selectWindow("Result of C2_bottom_FC_PFA.tif");
run("Measure");
saveAs("Tiff", "//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/GPV_analysis/C2 x C4_10 x C3_bottom_FC_PFA_Li_broad_01.tif");

close("*");