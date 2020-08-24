

# Point cloud quality assessment metric based on angular similarity


In this repository, a script for the computation of the angular similarity of tangent planes between two point cloud models is provided (also called as plane-to-plane). The computation of this metric relies on normal vectors that are carried with associated pairs of points, and quantifies the difference in orientation of their corresponding tangent planes. A tangent plane provides a local linear approximation of the underlying surface; thus, the angular similarity between two tangent planes provides an indication of the difference between the local surfaces that pass by the corresponding points. In the provided implementation, pairs of associated points are obtained using the nearest neighbor. The angular similarity offers a prediction score for the visual quality of a distorted model with respect to a reference.

The current implementation requires the normals of both the original and the distorted models. Although explicitly depending on normal vectors, no algorithm is imposed for normal estimation in case of absence.

To compute point cloud angular similarity scores:

`[asBA, asAB, asSym] = angularSimilarity(A, B, ERRORTYPE)`

For more details, the reader can refer to [1].  

**UPDATED**: A benchmarking study on the performance of the metric as a function of the normal estimation algorithm and configuration, is reported in [2]. The impact of the neighborhood selection is examined and best-practices for high performance are indicated, using as ground truth widely-used subjectively annotated point cloud data sets.

![alt text](/docs/plane_to_plane.png)
*\*Angular similarity between tangent planes (plane-to-plane).*

### Conditions of use

If you wish to use the provided script in your research, we kindly ask you to cite [1].


### References

[1] E. Alexiou and T. Ebrahimi, "[Point Cloud Quality Assessment Metric Based on Angular Similarity](https://infoscience.epfl.ch/record/254987)," *2018 IEEE International Conference on Multimedia and Expo (ICME)*, San Diego, CA, 2018, pp. 1-6. doi: [10.1109/ICME.2018.8486512](https://doi.org/10.1109/ICME.2018.8486512)

[2] E. Alexiou and T. Ebrahimi, "[Benchmarking of the plane-to-plane metric](https://infoscience.epfl.ch/record/278961)," *ISO/IEC JTC1/SC29/WG1 Doc. M88038*, July 2020
