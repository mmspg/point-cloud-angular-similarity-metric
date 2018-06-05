# point-cloud-angular-similarity-metric

Point clouds denote a 3D content representation which has recently gained a significant amount of interest. Among other challenges, objective quality assessment remains an open problem. Thus, new and efficient algorithms are required, able to predict the level of perceptual impairment of a distorted point cloud with respect to its original version. This algorithm is a based on the angular similarity and provides a normal-based alternative approach for objective quality assessment of point clouds contents.

The angular similarity reflects the different orientation of tangent planes that correspond to pairs of points, which are associated as nearest neighbors between point clouds A and B. Tangent planes can be viewed as a local linear approximation of the underlying surfaces of the model. Thus, the angular similarity between two tangent planes provides an indication of the difference between local surfaces that pass by the corresponding points. 

This metric requires the normals of both the original and the distorted contents. In case there are no normals present in a content, they should be estimated


If you use this code in your research, please cite our paper:

E. Alexiou; T. Ebrahimi : Point cloud quality assessment metric based on angular similarity. 2018. International Conference on Multimedia and Expo (ICME), San Diego, USA, July 23-27, 2018.

URL: https://infoscience.epfl.ch/record/254987?ln=en
