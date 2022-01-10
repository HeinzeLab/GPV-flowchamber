# Segmentation of all channels, analysis of single image
# This script was used to test settings for the Otsu threshold scaling factor
# Brightfield images were used as is
# Fluorescence images were preprocessed using Leica THUNDER
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

# 2. set the parameter
interactive(True)  # the image will be shown
scaling_factor = 1.05  # Vary this parameter to adjust the threshold level, 1 = Otsu threshold

# 3. Select the input data
# paste the complete path to your data here in " "
# do not delete the "r"
img = io.imread(r"\\HC1008\Users\AG Nieswandt\SarahBeck_GPV\Coagulation flow chamber_ICC\20200421\KO4_timeseries\C3_360s.tif")
total_nr_of_pixel = img.size  # get number of pixel per image

# 4. Generate the entropy image based on the original image
entropy_img = entropy(img, disk(5)) # disk size in pixel gives search area

# 5. Perform a median filter on the entropy image
median_img = median(entropy_img, disk(10))  # disk size in pixel gives averaging area

# 6. Define the segmentation threshold (based on Otsu's method)
thresh = threshold_otsu(median_img)
print("Threshold: ",thresh)  # the threshold value is reported

# 7. Generate the binary image
# all intensity values of the median image below a threshold are set to 0:
# "if value of median is below thresh then this statement is true" and true = 0
# as the Otsu threshold does not fit perfectly, it is adjusted by the scaling factor
# increase scaling factor: more data is considered background
# decrease scaling factor: less data is considered background
binary = median_img <= scaling_factor*thresh

# 8. Calculate the area covered with platelets/clots
# all pixel in the median image with values larger than the threshold are "false" = 1
# All false pixel are counted to calculate the area covered with platelets
covered_area = np.sum(binary == False)
covered_area_in_perc = covered_area / total_nr_of_pixel * 100  # convert calculated are to percent
print("Covered area [px]: ",covered_area)
print("Covered area [%]: ",covered_area_in_perc)

# 9. Generate a figure showing the original image and all steps
plt.figure()
plt.subplot(221)  # Original image, shown in gray scale
plt.imshow(img, cmap="magma")
plt.title("Original Image")
plt.subplot(222)  # Entropy image
plt.imshow(entropy_img)
plt.title("Entropy Image")
plt.subplot(223)  # Median filtered image
plt.imshow(median_img)
plt.title("Median Image")
plt.subplot(224)  # Binary image, yellow = background, blue = foreground
plt.imshow(binary)
plt.title("Binary Image")
plt.tight_layout()
