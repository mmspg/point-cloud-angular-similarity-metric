
# Point cloud quality assessment metric based on angular similarity


In this repository, a script for the computation of the angular similarity of tangent planes between two point cloud models is provided (also called as plane-to-plane). The computation of this metric relies on normal vectors that are carried with associated pairs of points, and quantifies the difference in orientation of their corresponding tangent planes. A tangent plane provides a local linear approximation of the underlying surface; thus, the angular similarity between two tangent planes provides an indication of the difference between the local surfaces that pass by the corresponding points. In the provided implementation, pairs of associated points are obtained using the nearest neighbor. The angular similarity offers a prediction score for the visual quality of a distorted model with respect to a reference.

To compute angular similarity scores:

`[asBA, asAB, asSym] = angularSimilarity(A, B, ERRORTYPE)`

This metric requires the normals of both the original and the distorted models. Although explicitly depending on normal vectors, no algorithm is imposed for normal estimation in case of absence.

For more details, the reader can refer to [1].

![alt text](/docs/plane_to_plane.png)
*\*Angular similarity between tangent planes (plane-to-plane).*


### Conditions of use

If you wish to use the provided script in your research, we kindly ask you to cite [1].


### References

[1] E. Alexiou and T. Ebrahimi, "[Point Cloud Quality Assessment Metric Based on Angular Similarity](https://infoscience.epfl.ch/record/254987)," *2018 IEEE International Conference on Multimedia and Expo (ICME)*, San Diego, CA, 2018, pp. 1-6. doi: [10.1109/ICME.2018.8486512](https://doi.org/10.1109/ICME.2018.8486512)
