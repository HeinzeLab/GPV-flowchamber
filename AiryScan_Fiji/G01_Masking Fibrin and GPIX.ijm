//Open the Fibrin channel
open("//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/Exported tif/C3_bottom_FC_PFA.tif");
selectWindow("C3_bottom_FC_PFA.tif");
//Threshold fibrin intensity using the Li threshold
setAutoThreshold("Default dark");
//run("Threshold...");
setAutoThreshold("Li dark");
setOption("BlackBackground", true);
//Convert to binary mask with values 0 (background) and 255 (foreground)
run("Convert to Mask");
saveAs("Tiff", "//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/GPV_analysis/C3_bottom_FC_PFA_Li.tif");
//Divide the image by 255 to obtain values of 0 (background) and 1 (foreground)
run("Divide...", "value=255");
run("16-bit");
saveAs("Tiff", "//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/GPV_analysis/C3_bottom_FC_PFA_Li_01.tif");
//Invert image, now background = 1 and foreground = 0
run("Invert");
saveAs("Tiff", "//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/GPV_analysis/C3_bottom_FC_PFA_Li_10.tif");
close();

//Load the binary fibrin mask (0, 255)
open("//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/GPV_analysis/C3_bottom_FC_PFA_Li.tif");
selectWindow("C3_bottom_FC_PFA_Li.tif");
//Use the "EDM binary" from the BioVoxxel toolbox to perform 3 rounds of dilations (3 px ~> 100 nm)
run("EDM Binary Operations", "iterations=3 operation=dilate");
//Divide the image by 255 to obtain values of 0 (background) and 1 (foreground)
run("Divide...", "value=255.000");
run("16-bit");
saveAs("Tiff", "//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/GPV_analysis/C3_bottom_FC_PFA_Li_3xdilate_01.tif");
close();
//Load the binary fibrin mask (0, 255)
open("//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/GPV_analysis/C3_bottom_FC_PFA_Li.tif");
selectWindow("C3_bottom_FC_PFA_Li.tif");
// Use the "EDM binary" from the BioVoxxel toolbox to perform 6 rounds of dilations (6 px ~> 200 nm)
run("EDM Binary Operations", "iterations=6 operation=dilate");
//Divide the image by 255 to obtain values of 0 (background) and 1 (foreground)
run("Divide...", "value=255.000");
run("16-bit");
saveAs("Tiff", "//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/GPV_analysis/C3_bottom_FC_PFA_Li_6xdilate_01.tif");
close();

//Load the binary fibrin mask (0, 255)
open("//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/GPV_analysis/C3_bottom_FC_PFA_Li.tif");
selectWindow("C3_bottom_FC_PFA_Li.tif");
//Use the "EDM binary" from the BioVoxxel toolbox to perform 3 rounds of erosion (3 px ~> 100 nm)
run("EDM Binary Operations", "iterations=3 operation=erode");
//Divide the image by 255 to obtain values of 0 (background) and 1 (foreground)
run("Divide...", "value=255.000");
run("16-bit");
saveAs("Tiff", "//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/GPV_analysis/C3_bottom_FC_PFA_Li_3xerode_01.tif");
close();
//Load the binary fibrin mask (0, 255)
open("//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/GPV_analysis/C3_bottom_FC_PFA_Li.tif");
selectWindow("C3_bottom_FC_PFA_Li.tif");
//Use the "EDM binary" from the BioVoxxel toolbox to perform 6 rounds of erosion (6 px ~> 200 nm)
run("EDM Binary Operations", "iterations=6 operation=erode");
//Divide the image by 255 to obtain values of 0 (background) and 1 (foreground)
run("Divide...", "value=255.000");
run("16-bit");
saveAs("Tiff", "//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/GPV_analysis/C3_bottom_FC_PFA_Li_6xerode_01.tif");
close();

//Open the GPIX channel
open("//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/Exported tif/C4_bottom_FC_PFA.tif");
selectWindow("C4_bottom_FC_PFA.tif");
//Threshold GPIX intensity using the Li threshold
setAutoThreshold("Li dark");
//run("Threshold...");
//Convert to binary mask with values 0 (background) and 255 (foreground)
run("Convert to Mask");
//Divide the image by 255 to obtain values of 0 (background) and 1 (foreground)
run("Divide...", "value=255.000");
run("16-bit");
saveAs("Tiff", "//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/GPV_analysis/C4_bottom_FC_PFA_Li_01.tif");
//Invert image, now background = 1 and foreground = 0
run("Invert");
saveAs("Tiff", "//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/GPV_analysis/C4_bottom_FC_PFA_Li_10.tif");
selectWindow("C4_bottom_FC_PFA_Li_10.tif");
close();
