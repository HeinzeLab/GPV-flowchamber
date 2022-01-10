# Li-threshold: minimizing the cross-entropy between the foreground and the foreground mean, 
# and the background and the background mean, would give the best threshold in most situations
# DOI:10.1016/0031-3203(93)90115-D
# DOI:10.1016/S0167-8655(98)00057-9
# https://scikit-image.org/docs/dev/auto_examples/developers/plot_threshold_li.html

# Script processes a single image
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

# 2. Select the input data
# paste the complete path to your data here in " "
# do not delete the "r"
img = io.imread(r"\\HC1008\Users\AG Nieswandt\SarahBeck_GPV\Coagulation flow chamber_ICC\20200421\KO1_wash\C3_wash 1.tif")
total_nr_of_pixel = img.size  # get number of pixel per image

# 3. Calculate thresholds and entropies
thresholds = np.arange(np.min(img) + 1.5, np.max(img) - 1.5)  # array of thresholds ranging from nearly minimal to nearly maximal image intensity
entropies = [_cross_entropy(img, t) for t in thresholds]  # calculate cross-entropy for each of the thresholds
optimal_image_threshold = thresholds[np.argmin(entropies)]  # optimal threshold image intensity with lowest entropy

# 4. Apply the threshold to the image
# all intensity values of the image above threshold are set to 1:
# "if value of image is above thresh then this statement is true" and true = 1
thresholded_image = img > optimal_image_threshold

# 5. Calculate the area covered with platelets/clots
# All pixel in the image with values higher than the threshold are "true" = 1
# All true pixel are counted to calculate the area covered with platelets
covered_area = np.sum(thresholded_image == True)
covered_area_in_perc = covered_area / total_nr_of_pixel * 100  # convert calculated area to percent

# 6. Generate a figure showing the original image and all steps
fig, ax = plt.subplots(1, 3, figsize=(8, 3))
ax[0].imshow(img, cmap='CMRmap')  # original image
ax[0].set_title('image')
ax[0].set_axis_off()

ax[1].imshow(thresholded_image, cmap='gray')  # thresholded image
ax[1].set_title('thresholded')
ax[1].set_axis_off()

ax[2].plot(thresholds, entropies)  # entropies vs threshold (image intensity)
ax[2].set_xlabel('thresholds')
ax[2].set_ylabel('cross-entropy')
ax[2].vlines(optimal_image_threshold,  # line to show optimal threshold
             ymin=np.min(entropies) - 0.05 * np.ptp(entropies),
             ymax=np.max(entropies) - 0.05 * np.ptp(entropies))
ax[2].set_title('optimal threshold')

fig.tight_layout()

# 7. Report result
print('The brute force optimal threshold is:', optimal_image_threshold)
# print('The computed optimal threshold is:', filters.threshold_li(img))  # not used
print("Covered area [px]: ",covered_area)
print("Covered area [%]: ",covered_area_in_perc)
plt.show()


