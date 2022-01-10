# Segmentation of a whole folder of images, channel 1 (brightfield image)
# The analysis was applied to the brightfield images after 6 min of thrombus formation under flow
# followed by washing to remove loosely-bound material 

# 1. Importing of all required functions from scikit-image
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
scaling_factor = 1.3 # factor with which the Otsu threshold will be multiplied
path = r"\\HC1008\Users\AG Nieswandt\SarahBeck_GPV\Coagulation flow chamber_ICC\20200421\KO1_wash\C3_wash*.tif"

# 3. Initialize values
series = 1
series_list =[]
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
    binary = median_img <= scaling_factor*thresh
    
    covered_area = np.sum(binary == False)  # calculate the covered area in pixel
    covered_area_in_perc = covered_area/ total_nr_of_pixel * 100  # convert calculated are to percent
    
    print(series, thresh, covered_area, covered_area_in_perc)  # print the values of the at the moment processed image to give progress overview
    series_list.append(series)  # append values of just processed image to the list from the previous images
    threshold_list.append(thresh)
    area_list_px.append(covered_area)
    area_list_perc.append(covered_area_in_perc)

    # generate and save images
    plt.figure()
    plt.subplot(221)
    plt.imshow(img, cmap="magma")
    plt.title("Original Image")
    plt.subplot(222)
    plt.imshow(entropy_img)
    plt.title("Entropy Image")
    plt.subplot(223)
    plt.imshow(median_img)
    plt.title("Median Image")
    plt.subplot(224)
    plt.imshow(binary)
    plt.title("Binary Image")
    plt.tight_layout()
    plt.savefig("WT4-C2_wash_" + str(series) + ".svg", dpi=150)
    plt.close()
    
    series += 1  # increase counting by 1 with every iteration

# save the result
filename = 'WT4-C2_wash_covered area.txt'
np.savetxt(
    filename,
    np.vstack(
        [
            series_list,
            threshold_list,
            area_list_px,
            area_list_perc
        ]
    ).T,
    delimiter='\t'
)

# plot the covered area
plt.plot(series_list, area_list_perc,'bo')
plt.xlabel("ROI")
plt.ylabel("covered area [%]")


