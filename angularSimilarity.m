function [asBA, asAB, asSym] = angularSimilarity(A, B, ERRORTYPE)
% Copyright (C) 2018 ECOLE POLYTECHNIQUE FEDERALE DE LAUSANNE, Switzerland
%
%     Multimedia Signal Processing Group (MMSPG)
%
%     This program is free software: you can redistribute it and/or modify
%     it under the terms of the GNU General Public License as published by
%     the Free Software Foundation, either version 3 of the License, or
%     (at your option) any later version.
%
%     This program is distributed in the hope that it will be useful,
%     but WITHOUT ANY WARRANTY; without even the implied warranty of
%     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%     GNU General Public License for more details.
%
%     You should have received a copy of the GNU General Public License
%     along with this program.  If not, see <http://www.gnu.org/licenses/>.
%
%
% Author:
%   Evangelos Alexiou (evangelos.alexiou@epfl.ch)
%
% Reference:
%   E. Alexiou and T. Ebrahimi, "Point Cloud Quality Assessment Metric
%   Based on Angular Similarity," 2018 IEEE International Conference on
%   Multimedia and Expo (ICME), San Diego, CA, 2018, pp. 1-6.
%
%
% angularSimilarity reflects the different orientation of tangent planes
%   that correspond to pairs of points, which are associated as nearest
%   neighbors between models A and B.
%
%   [asBA, asAB, asSym] = angularSimilarity(A, B, ERRORTYPE)
%
%   INPUTS
%       A, B: Point clouds in pointCloud format as defined in MATLAB. The
%       coordinates (e.g., A.Location) and the normal vectors (e.g.,
%       A.Normal) of the input point clouds A and B must exist.
%       ERRORTYPE: Defines how the total similarity is computed, based on
%       the functions 'min', 'mean', 'median', 'max', 'RMS', or 'MSE'.
%
%   OUTPUTS
%       asBA: The total similarity obtained with point cloud A being the
%       reference. The computed value depends on ERRORTYPE selection.
%       asAB: The total similarity obtained with point cloud B being the
%       reference. The computed value depends on ERRORTYPE selection.
%       asSym: The symmetric total similarity. The computed value depends
%       on ERRORTYPE selection.
%
%   Example:
%   [asBA, asAB, asSym] = angularSimilarity(A, B, 'MSE')



if nargin < 2
    error('Too few input arguments.');
elseif nargin==2
    ERRORTYPE = 'mean';
elseif nargin>2
    switch ERRORTYPE
        case {'min', 'mean', 'median', 'max', 'RMS', 'MSE'}
        otherwise
            error('ERRORTYPE is not supported.');
    end
end

if isempty(A.Location) || isempty(B.Location)
    error('No coordinates found in input point cloud(s).');
end

if isempty(A.Normal) || isempty(B.Normal)
    error('No normal vectors found in input point cloud(s).');
end



% Set A as the reference. Loop over B and find nearest neighbor in A
[n1, ~] = knnsearch(A.Location, B.Location);
as_BA = (pi - 2*acos(abs(sum(A.Normal(n1,:).*B.Normal,2))))/pi;
as_BA(isnan(as_BA)) = [];

if strcmp(ERRORTYPE, 'mean')
    asBA = mean(real(as_BA));
elseif strcmp(ERRORTYPE, 'min')
    asBA = min(real(as_BA));
elseif strcmp(ERRORTYPE, 'max')
    asBA = max(real(as_BA));
elseif strcmp(ERRORTYPE, 'median')
    asBA = mean(real(as_BA));
elseif strcmp(ERRORTYPE, 'RMS')
    asBA = sqrt(mean(real(as_BA).^2));
elseif strcmp(ERRORTYPE, 'MSE')
    asBA = mean(real(as_BA).^2);
else
    error('WrongInput');
end

% Set B as the reference. Loop over A and find nearest neighbor in B
[n2, ~] = knnsearch(B.Location, A.Location);
as_AB = (pi - 2*acos(abs(sum(B.Normal(n2,:).*A.Normal,2))))/pi;
as_AB(isnan(as_AB)) = [];

if strcmp(ERRORTYPE, 'mean')
    asAB = mean(real(as_AB));
elseif strcmp(ERRORTYPE, 'min')
    asAB = min(real(as_AB));
elseif strcmp(ERRORTYPE, 'max')
    asAB = max(real(as_AB));
elseif strcmp(ERRORTYPE, 'median')
    asAB = mean(real(as_AB));
elseif strcmp(ERRORTYPE, 'RMS')
    asAB = sqrt(mean(real(as_AB).^2));
elseif strcmp(ERRORTYPE, 'MSE')
    asAB = mean(real(as_AB).^2);
else
    error(message('WrongInput'));
end

% Symmetric total similarity
asSym = min(asBA, asAB);
