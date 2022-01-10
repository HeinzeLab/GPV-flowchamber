//Export images from Leica lif-container and save as individual channel tif-files
run("8-bit");
run("Split Channels");
run("Grays");
saveAs("Tiff", "//HC1008/Users/AG Nieswandt/SarahBeck_GPV/Coagulation flow chamber_ICC/20200421/WT4_timeseries/C3_000s.tif");
close();
run("Grays");
saveAs("Tiff", "//HC1008/Users/AG Nieswandt/SarahBeck_GPV/Coagulation flow chamber_ICC/20200421/WT4_timeseries/C2_000s.tif");
close();
run("Grays");
saveAs("Tiff", "//HC1008/Users/AG Nieswandt/SarahBeck_GPV/Coagulation flow chamber_ICC/20200421/WT4_timeseries/C1_000s.tif");
close();
