# Li-threshold: minimizing the cross-entropy between the foreground and the foreground mean, 
# and the background and the background mean, would give the best threshold in most situations
# DOI:10.1016/0031-3203(93)90115-D
# DOI:10.1016/S0167-8655(98)00057-9
# https://scikit-image.org/docs/dev/auto_examples/developers/plot_threshold_li.html

# Script analyses whole folder of images
# The analysis was applied to the fluorescence images (C2, C3) after 6 min of thrombus formation under flow
# followed by washing to remove loosely-bound material
# Fluorescence images were preprocessed using ICC of the Leica THUNDER
# https://www.leica-microsystems.com/science-lab/an-introduction-to-computational-clearing/

# 1. Importing of all required function from scikit-image
from skimage import filters
from skimage.filters.thresholding import _cross_entropy
from skimage import io
# ...from matplotlib and numpy
import numpy as np
import matplotlib.pyplot as plt
from matplotlib import interactive
# ...glob: the glob module is used to retrieve files/pathnames matching a specified pattern
import glob

# 2. set the parameter and data path
interactive(True)    # the image will be shown
path = r"C:\Users\Katherina\Desktop\20200421\WT4_wash\C2_*.tif"  # path to folder/data which should be processed

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

    thresholds = np.arange(np.min(img) + 1.5, np.max(img) - 1.5)  # array of thresholds based on min-max image intensity
    entropies = [_cross_entropy(img, t) for t in thresholds]  # cross-entropies for each threshold value
    optimal_image_threshold = thresholds[np.argmin(entropies)]  # optimal threshold is intensity with lowest entropy
    
    thresholded_image = img > optimal_image_threshold  # Apply the threshold to the image

    covered_area = np.sum(thresholded_image == True)  # calculate the covered area in pixel
    covered_area_in_perc = covered_area/ total_nr_of_pixel * 100  # convert calculated area to percent

    print(series, optimal_image_threshold, covered_area, covered_area_in_perc)  # print the values of the at the moment processed image to give progress overview
    series_list.append(series)  # append values of just processed image to the list from the previous images
    threshold_list.append(optimal_image_threshold)
    area_list_px.append(covered_area)
    area_list_perc.append(covered_area_in_perc)

    # generate and save images
    fig, ax = plt.subplots(1, 3, figsize=(8, 3))
    ax[0].imshow(img, cmap='CMRmap')  # Original image
    ax[0].set_title('image')
    ax[0].set_axis_off()
    ax[1].imshow(thresholded_image, cmap='gray')  # Li-thresholded image
    ax[1].set_title('thresholded')
    ax[1].set_axis_off()
    ax[2].plot(thresholds, entropies)  # Entropy vs intensity threshold
    ax[2].set_xlabel('thresholds')
    ax[2].set_ylabel('cross-entropy')
    ax[2].vlines(optimal_image_threshold,
                 ymin=np.min(entropies) - 0.05 * np.ptp(entropies),
                 ymax=np.max(entropies) - 0.05 * np.ptp(entropies))
    ax[2].set_title('optimal threshold')
    fig.tight_layout()
    fig.savefig("WT4-C2_ROI_" + str(series) + ".svg", dpi=150)
    plt.close(fig)
    
    series += 1  # increase counting by 1 with every iteration

# save the result
filename = 'WT4-C2_roi_covered area.txt'
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
plt.show()

