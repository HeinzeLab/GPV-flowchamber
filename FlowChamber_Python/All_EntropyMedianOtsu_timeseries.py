# Segmentation of a whole folder of images, timeseries acquired with 30s gap
# used for all channels (C1: brightfiled image, 
# C2 & C3: fluorescence signal after ICC using the Leica THUNDER)
# https://www.leica-microsystems.com/science-lab/an-introduction-to-computational-clearing/

# 1. Importing of all required function from scikit-image
from skimage.filters.rank import entropy
from skimage.morphology import disk
from skimage.filters import threshold_otsu, median
from skimage import io
# ...from matplotlib and numpy
import matplotlib.pyplot as plt
from matplotlib import interactive
import numpy as np
# ...glob: the glob module is used to retrieve files/pathnames matching a specified pattern
import glob

# 2. set the parameter and data path
interactive(True)  # the image will be shown
start_images = 210  # all images of the time series acquired before XXX sec will be processed using the scaling_factor_start
# note: at the beginning the field of view is quite empty, different level of image noise, thus different threshold required
scaling_factor_start = 1.05  # factor with which the Otsu threshold will be scaled for the initial images
scaling_factor = 1.0  # scaling factor with which the Otsu threshold will be scaled for the images acquired at XXX sec or later
path = r"\\HC1008\Users\AG Nieswandt\SarahBeck_GPV\Coagulation flow chamber_ICC\20200421\KO4_timeseries\C3*.tif"  # path to folder/data which should be processed

# 3. Initialize values
time = 0
time_list =[]
area_list_px =[]
area_list_perc =[]
threshold_list = []

# 4. Loop over the folder of images to process them
for file in glob.glob(path):
    img = io.imread(file)  # read image
    
    total_nr_of_pixel = img.size  # get number of pixel per image
    
    entropy_img = entropy(img, disk(5))  # generate entropy image, disk size in pixel gives search area

    median_img = median(entropy_img, disk(10))  # generate median image, disk size in pixel gives averaging area
    
    thresh = threshold_otsu(median_img)  # Define the segmentation threshold (based on Otsu's method)
    if time < start_images:  # for images below start_images use scaling_factor_start
        binary = median_img <= scaling_factor_start*thresh
    if time >= start_images:  # for images above or equal to start_images use scaling_factor
        binary = median_img <= scaling_factor*thresh

    covered_area = np.sum(binary == False)  # calculate the covered area in pixel
    covered_area_in_perc = covered_area / total_nr_of_pixel * 100  # convert calculated area to percent

    print(time, thresh, covered_area, covered_area_in_perc)  # print the values of the at the moment processed image to give progress overview
    time_list.append(time)  # append values of just processed image to the list from the previous images
    threshold_list.append(thresh)
    area_list_px.append(covered_area)
    area_list_perc.append(covered_area_in_perc)

    # generate and save images
    plt.figure()
    plt.subplot(221)
    plt.imshow(img, cmap="magma")  # Original image
    plt.title("Original Image")
    plt.subplot(222)
    plt.imshow(entropy_img)  # Entropy image
    plt.title("Entropy Image")
    plt.subplot(223)
    plt.imshow(median_img)  # Median image
    plt.title("Median Image")
    plt.subplot(224)
    plt.imshow(binary)  # Binary image
    plt.title("Binary Image")
    plt.tight_layout()
    plt.savefig("KO4-C3_" + str(time) + ".svg", dpi=150)
    plt.close()
    
    time += 30  # increase counting by 30 s with every iteration

# save the result
filename = 'KO4-C3_timeseries_covered area.txt'
np.savetxt(
    filename,
    np.vstack(
        [
            time_list,
            threshold_list,
            area_list_px,
            area_list_perc
        ]
    ).T,
    delimiter='\t'
)

# plot the covered area
plt.tight_layout()
plt.plot(time_list, area_list_perc,'bo')
plt.xlabel("Time [sec]")
plt.ylabel("covered area [%]")


