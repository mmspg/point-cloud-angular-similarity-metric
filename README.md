# Point cloud objective quality metric based on angular similarity

Point clouds denote a 3D content representation which has recently gained a significant amount of interest. Among other challenges, objective quality assessment remains an open problem. Thus, new and efficient algorithms are required, able to predict the level of perceptual impairment of a distorted point cloud with respect to its original version. This algorithm is based on the angular similarity and provides a normal-based alternative approach for objective quality assessment of point cloud contents.

The angular similarity reflects the different orientation of tangent planes that correspond to pairs of points, which are associated as nearest neighbors between two point clouds. Tangent planes can be viewed as local linear approximations of the underlying surfaces of a model. Thus, the angular similarity between two tangent planes provides an indication of the difference between local surfaces that pass by the corresponding points. For more details, please refer to [1].

This metric requires the normals of both the original and the distorted contents. In case there are no normals present in a content by default, they should be estimated before using this script.  

### Conditions of use

If you wish to use this metric in your research, please cite [1].


### References

[1] E. Alexiou and T. Ebrahimi, "[Point Cloud Quality Assessment Metric Based on Angular Similarity](https://ieeexplore.ieee.org/document/8486512)," 2018 IEEE International Conference on Multimedia and Expo (ICME), San Diego, CA, 2018, pp. 1-6. 
