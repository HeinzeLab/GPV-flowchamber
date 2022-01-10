//Opens the .czi file container and saves each channel as separate tif-file.
// Note: Each czi-container contains only a single 4-channel image.
open("I:/Airyscan/20210510_SB_Flusskammer_Ctrls/Crop Area 1.7/ctrl_staining all_56F8 A405_FGN A488_GPV A546_Thrombin A647/Position 1/Mitte_Airyscan decon.czi");
selectWindow("Mitte_Airyscan decon.czi");
run("Split Channels");
saveAs("Tiff", "I:/Airyscan/20210510_SB_Flusskammer_Ctrls/Crop Area 1.7/ctrl_staining all_56F8 A405_FGN A488_GPV A546_Thrombin A647/Position 1/Tiff_new/C4-Mitte_Airyscan decon.tif");
close();
saveAs("Tiff", "I:/Airyscan/20210510_SB_Flusskammer_Ctrls/Crop Area 1.7/ctrl_staining all_56F8 A405_FGN A488_GPV A546_Thrombin A647/Position 1/Tiff_new/C3-Mitte_Airyscan decon.tif");
close();
saveAs("Tiff", "I:/Airyscan/20210510_SB_Flusskammer_Ctrls/Crop Area 1.7/ctrl_staining all_56F8 A405_FGN A488_GPV A546_Thrombin A647/Position 1/Tiff_new/C2-Mitte_Airyscan decon.tif");
close();
saveAs("Tiff", "I:/Airyscan/20210510_SB_Flusskammer_Ctrls/Crop Area 1.7/ctrl_staining all_56F8 A405_FGN A488_GPV A546_Thrombin A647/Position 1/Tiff_new/C1-Mitte_Airyscan decon.tif");
close();
