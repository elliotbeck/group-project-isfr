# Libraries to include
import matplotlib.pyplot as plt
import numpy as np

# Read a CSV file "data.csv" shared to the Docker container from the Docker host.
# The header line is skipped, and typically contains a description of the columns:
# [ x-coordinate, y-coordinate, colour, size ]
# Each row of the CSV file (other than the header) defines one point to plot.
the_data = np.genfromtxt('data/coding-environment-exercise.csv', delimiter=';',skip_header=1)
transposed_data = the_data.transpose()

points_x = transposed_data[0]
points_y = transposed_data[1]

# This code is not at all robust, but skipping error handling makes it more brief.

# Define the scatter plot
f = plt.figure()
plt.scatter(points_x, points_y)
plt.show()

# Save the scatter plot (on the Docker host).
f.savefig("data/output.pdf", bbox_inches='tight')
