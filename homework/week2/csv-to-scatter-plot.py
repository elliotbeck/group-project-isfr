# Libraries to include
import matplotlib.pyplot as plt
import numpy as np

# Read a CSV file "data.csv" 
the_data = np.genfromtxt('data/coding-environment-exercise.csv', 
                         delimiter=';',skip_header=1)
transposed_data = the_data.transpose()

# extract data for plot
points_x = transposed_data[0]
points_y = transposed_data[1]

# Define the scatter plot
f = plt.figure()
plt.scatter(points_x, points_y)
plt.show()

# Save the scatter plot (on the Docker host).
f.savefig("data/output.pdf", bbox_inches='tight')
