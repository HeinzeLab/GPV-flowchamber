//Load the fibrin channel image
open("//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/20210510_SB_Flusskammer_Ctrls/ctrl_wo ThrombinA647/Position 2/C3_oben_Airyscan_decon.tif");
selectWindow("C3_oben_Airyscan_decon.tif");
//Threshold fibrin intensity using the Li threshold
setAutoThreshold("Li dark");
//run("Threshold...");
setOption("BlackBackground", true);
//Convert to binary mask with values 0 (background) and 255 (foreground)
run("Convert to Mask");
saveAs("Tiff", "//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/20210510_SB_Flusskammer_Ctrls/ctrl_wo ThrombinA647/Position 2/Masks_C3_oben/C3_oben_Airyscan_decon_Li.tif");
//Divide the image by 255 to obtain values of 0 (background) and 1 (foreground)
run("Divide...", "value=255.000");
run("16-bit");
saveAs("Tiff", "//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/20210510_SB_Flusskammer_Ctrls/ctrl_wo ThrombinA647/Position 2/Masks_C3_oben/C3_oben_Airyscan_decon_Li_01.tif");
close();

//Use the Li-thresholded Fibrin mask and redoe/dilate the mask
open("//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/20210510_SB_Flusskammer_Ctrls/ctrl_wo ThrombinA647/Position 2/Masks_C3_oben/C3_oben_Airyscan_decon_Li.tif");
selectWindow("C3_oben_Airyscan_decon_Li.tif");
// Use the "EDM binary" from the BioVoxxel toolbox to perform 3 rounds of dilations (3 px ~> 100 nm)
run("EDM Binary Operations", "iterations=3 operation=dilate");
//Divide the image by 255 to obtain values of 0 (background) and 1 (foreground)
run("Divide...", "value=255.000");
run("16-bit");
saveAs("Tiff", "//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/20210510_SB_Flusskammer_Ctrls/ctrl_wo ThrombinA647/Position 2/Masks_C3_oben/C3_oben_Airyscan_decon_Li_3xdilate_01.tif");
close();
open("//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/20210510_SB_Flusskammer_Ctrls/ctrl_wo ThrombinA647/Position 2/Masks_C3_oben/C3_oben_Airyscan_decon_Li.tif");
selectWindow("C3_oben_Airyscan_decon_Li.tif");
//Use the "EDM binary" from the BioVoxxel toolbox to perform 6 rounds of dilations (6 px ~> 200 nm)
run("EDM Binary Operations", "iterations=6 operation=dilate");
//Divide the image by 255 to obtain values of 0 (background) and 1 (foreground)
run("Divide...", "value=255.000");
run("16-bit");
saveAs("Tiff", "//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/20210510_SB_Flusskammer_Ctrls/ctrl_wo ThrombinA647/Position 2/Masks_C3_oben/C3_oben_Airyscan_decon_Li_6xdilate_01.tif");
close();
open("//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/20210510_SB_Flusskammer_Ctrls/ctrl_wo ThrombinA647/Position 2/Masks_C3_oben/C3_oben_Airyscan_decon_Li.tif");
selectWindow("C3_oben_Airyscan_decon_Li.tif");
//Use the "EDM binary" from the BioVoxxel toolbox to perform 3 rounds of erosion (3 px ~> 100 nm)
run("EDM Binary Operations", "iterations=3 operation=erode");
//Divide the image by 255 to obtain values of 0 (background) and 1 (foreground)
run("Divide...", "value=255.000");
run("16-bit");
saveAs("Tiff", "//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/20210510_SB_Flusskammer_Ctrls/ctrl_wo ThrombinA647/Position 2/Masks_C3_oben/C3_oben_Airyscan_decon_Li_3xerode_01.tif");
close();
open("//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/20210510_SB_Flusskammer_Ctrls/ctrl_wo ThrombinA647/Position 2/Masks_C3_oben/C3_oben_Airyscan_decon_Li.tif");
selectWindow("C3_oben_Airyscan_decon_Li.tif");
//Use the "EDM binary" from the BioVoxxel toolbox to perform 6 rounds of erosion (6 px ~> 200 nm)
run("EDM Binary Operations", "iterations=6 operation=erode");
//Divide the image by 255 to obtain values of 0 (background) and 1 (foreground)
run("Divide...", "value=255.000");
run("16-bit");
saveAs("Tiff", "//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/20210510_SB_Flusskammer_Ctrls/ctrl_wo ThrombinA647/Position 2/Masks_C3_oben/C3_oben_Airyscan_decon_Li_6xerode_01.tif");
close();

//Load the 3x dilated and 3x eroded mask
open("//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/20210510_SB_Flusskammer_Ctrls/ctrl_wo ThrombinA647/Position 2/Masks_C3_oben/C3_oben_Airyscan_decon_Li_3xerode_01.tif");
selectWindow("C3_oben_Airyscan_decon_Li_3xerode_01.tif");
open("//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/20210510_SB_Flusskammer_Ctrls/ctrl_wo ThrombinA647/Position 2/Masks_C3_oben/C3_oben_Airyscan_decon_Li_3xdilate_01.tif");
selectWindow("C3_oben_Airyscan_decon_Li_3xdilate_01.tif");
//Subtract the eroded from dilated mask to generate the narrow rim
imageCalculator("Subtract create", "C3_oben_Airyscan_decon_Li_3xdilate_01.tif","C3_oben_Airyscan_decon_Li_3xerode_01.tif");
selectWindow("Result of C3_oben_Airyscan_decon_Li_3xdilate_01.tif");
saveAs("Tiff", "//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/20210510_SB_Flusskammer_Ctrls/ctrl_wo ThrombinA647/Position 2/Masks_C3_oben/C3_oben_Airyscan_decon_Li_3xdil-3xero_01.tif");
close();
close();
selectWindow("C3_oben_Airyscan_decon_Li_3xerode_01.tif");
close();

//Load the 6x dilated and 6x eroded mask
open("//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/20210510_SB_Flusskammer_Ctrls/ctrl_wo ThrombinA647/Position 2/Masks_C3_oben/C3_oben_Airyscan_decon_Li_6xerode_01.tif");
selectWindow("C3_oben_Airyscan_decon_Li_6xerode_01.tif");
open("//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/20210510_SB_Flusskammer_Ctrls/ctrl_wo ThrombinA647/Position 2/Masks_C3_oben/C3_oben_Airyscan_decon_Li_6xdilate_01.tif");
selectWindow("C3_oben_Airyscan_decon_Li_6xdilate_01.tif");
//Subtract the eroded from dilated mask to generate the narrow rim
imageCalculator("Subtract create", "C3_oben_Airyscan_decon_Li_6xdilate_01.tif","C3_oben_Airyscan_decon_Li_6xerode_01.tif");
selectWindow("Result of C3_oben_Airyscan_decon_Li_6xdilate_01.tif");
saveAs("Tiff", "//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/20210510_SB_Flusskammer_Ctrls/ctrl_wo ThrombinA647/Position 2/Masks_C3_oben/C3_oben_Airyscan_decon_Li_6xdil-6xero_01.tif");
close();
close();
selectWindow("C3_oben_Airyscan_decon_Li_6xerode_01.tif");
close();
