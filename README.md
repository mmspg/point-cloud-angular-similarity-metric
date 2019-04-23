# Point cloud objective quality metric based on angular similarity

Point clouds denote a 3D content representation which has recently gained a significant amount of interest. Among other challenges, objective quality assessment remains an open problem. Thus, new and efficient algorithms are required, able to predict the level of perceptual impairment of a distorted point cloud with respect to its original version. This algorithm is based on the angular similarity and provides a normal-based alternative approach for objective quality assessment of point cloud contents.

The angular similarity reflects the different orientation of tangent planes that correspond to pairs of points, which are associated as nearest neighbors between point clouds A and B. Tangent planes can be viewed as local linear approximations of the underlying surfaces of the model. Thus, the angular similarity between two tangent planes provides an indication of the difference between local surfaces that pass by the corresponding points. 

This metric requires the normals of both the original and the distorted contents. In case there are no normals present in a content by default, they should be estimated before using this script.


If you use this code in your research, please cite our paper:

E. Alexiou and T. Ebrahimi, "Point Cloud Quality Assessment Metric Based on Angular Similarity," 2018 IEEE International Conference on Multimedia and Expo (ICME), San Diego, CA, 2018, pp. 1-6. doi: 10.1109/ICME.2018.8486512

URL @ Infoscience: https://infoscience.epfl.ch/record/254987?ln=en
URL @ IEEEXplore:  https://ieeexplore.ieee.org/document/8486512
