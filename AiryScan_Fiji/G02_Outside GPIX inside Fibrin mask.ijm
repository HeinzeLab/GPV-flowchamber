//Open all required binary masks, which are to be combined
//1: GPIX with background = 1 and foreground = 0
open("//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/GPV_analysis/C4_bottom_FC_PFA_Li_10.tif");
//2: Fibrin with background = 0 and foreground = 1
open("//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/GPV_analysis/C3_bottom_FC_PFA_Li_01.tif");
//3: Fibrin with background = 1 and foreground = 0
open("//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/GPV_analysis/C3_bottom_FC_PFA_Li_10.tif");
//Multiply 2 with 1: Values inside Fibrin-rich region but outside thrombus = 1
imageCalculator("Multiply create", "C3_bottom_FC_PFA_Li_01.tif","C4_bottom_FC_PFA_Li_10.tif");
selectWindow("Result of C3_bottom_FC_PFA_Li_01.tif");
saveAs("Tiff", "//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/GPV_analysis/C4_10 x C3_bottom_FC_PFA_Li_01.tif");
//Multiply 3 with 1: Values outside Fibrin-rich region and outside thrombus = 1 (backgorund level of whole image)
imageCalculator("Multiply create", "C3_bottom_FC_PFA_Li_10.tif","C4_bottom_FC_PFA_Li_10.tif");
selectWindow("Result of C3_bottom_FC_PFA_Li_10.tif");
saveAs("Tiff", "//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/GPV_analysis/C4_10 x C3_bottom_FC_PFA_Li_10.tif");

//Open dilated fibrin masks
open("//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/GPV_analysis/C3_bottom_FC_PFA_Li_3xdilate_01.tif");
open("//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/GPV_analysis/C3_bottom_FC_PFA_Li_6xdilate_01.tif");
//Multiply 3x dilated fibrin with GPIX
imageCalculator("Multiply create", "C3_bottom_FC_PFA_Li_3xdilate_01.tif","C4_bottom_FC_PFA_Li_10.tif");
selectWindow("Result of C3_bottom_FC_PFA_Li_3xdilate_01.tif");
saveAs("Tiff", "//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/GPV_analysis/C4_10 x C3_bottom_FC_PFA_Li_3xdil_01.tif");
//Multiply 6x dilated fibrin with GPIX
imageCalculator("Multiply create", "C3_bottom_FC_PFA_Li_6xdilate_01.tif","C4_bottom_FC_PFA_Li_10.tif");
selectWindow("Result of C3_bottom_FC_PFA_Li_6xdilate_01.tif");
saveAs("Tiff", "//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/GPV_analysis/C4_10 x C3_bottom_FC_PFA_Li_6xdil_01.tif");

//Open eroded fibrin masks
open("//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/GPV_analysis/C3_bottom_FC_PFA_Li_3xerode_01.tif");
open("//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/GPV_analysis/C3_bottom_FC_PFA_Li_6xerode_01.tif");
//Generate narrow rim by subtracting 3x eroded from 3x dilated
imageCalculator("Subtract create", "C3_bottom_FC_PFA_Li_3xdilate_01.tif","C3_bottom_FC_PFA_Li_3xerode_01.tif");
selectWindow("Result of C3_bottom_FC_PFA_Li_3xdilate_01.tif");
saveAs("Tiff", "//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/GPV_analysis/C3_bottom_FC_PFA_Li_narrow_01.tif");
//Generate broad rim by subtracting 6x eroded from 6x dilated
imageCalculator("Subtract create", "C3_bottom_FC_PFA_Li_6xdilate_01.tif","C3_bottom_FC_PFA_Li_6xerode_01.tif");
selectWindow("Result of C3_bottom_FC_PFA_Li_6xdilate_01.tif");
saveAs("Tiff", "//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/GPV_analysis/C3_bottom_FC_PFA_Li_broad_01.tif");

//Narrow rim multiplied with "3" to set values inside trombus to 0
imageCalculator("Multiply create", "C3_bottom_FC_PFA_Li_narrow_01.tif","C4_bottom_FC_PFA_Li_10.tif");
selectWindow("Result of C3_bottom_FC_PFA_Li_narrow_01.tif");
saveAs("Tiff", "//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/GPV_analysis/C4_10 x C3_bottom_FC_PFA_Li_narrow_01.tif");
//Broad rim multiplied with "3" to set values inside trombus to 0
imageCalculator("Multiply create", "C3_bottom_FC_PFA_Li_broad_01.tif","C4_bottom_FC_PFA_Li_10.tif");
selectWindow("Result of C3_bottom_FC_PFA_Li_broad_01.tif");
saveAs("Tiff", "//HC1008/Users/AG Nieswandt/SarahBeck_GPV/AiryScan/GPV_analysis/C4_10 x C3_bottom_FC_PFA_Li_broad_01.tif");

close("*");

