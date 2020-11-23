function [asimBA, asimAB, asimSym] = pc_asim(A, B, POOLING_TYPE)
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
% Angular similarity between point clouds A and B quantifies the difference
%   in orientation of tangent planes corresponding to associated points
%   that belong to the two models. The points are associated as nearest
%   neighbors and an individual angular similarity value is computed for
%   every pair. After pooling across the individual values, an angular
%   similarity score is obtained.
%
%   [asimBA, asimAB, asimSym] = pc_asim(A, B, POOLING_TYPE)
%
%   INPUTS
%       A, B: Point clouds in pointCloud format as defined in MATLAB. The
%           coordinates (e.g., A.Location, B.Location) and the normal
%           vectors (e.g., A.Normal, B.Normal) of both models are required.
%       POOLING_TYPE: Defines the pooling method that is applied on
%           individual angular similarity values obtained from pairs of
%           associated points. The following options are available:
%           {'Mean', 'Min', 'Max', 'MSE', 'RMS'}.
%
%   OUTPUTS
%       asimBA: Angular similarity score of point cloud B, using A as
%           reference. The computed score depends on POOLING_TYPE.
%       asimAB: Angular similarity score of point cloud A, using B as
%           reference. The computed score depends on POOLING_TYPE.
%       asimSym: Symmetric angular similarity score, using both A and B as
%           reference. The computed score depends on POOLING_TYPE.


if nargin < 2
    error('Too few input arguments.');
elseif nargin==2
    POOLING_TYPE = 'Mean';
elseif nargin>2
    switch POOLING_TYPE
        case {'Mean', 'Min', 'Max', 'MSE', 'RMS'}
        otherwise
            error('POOLING_TYPE is not supported.');
    end
end

if isempty(A.Location) || isempty(B.Location)
    error('No coordinates found in input point cloud(s).');
end

if isempty(A.Normal) || isempty(B.Normal)
    error('No normal vectors found in input point cloud(s).');
end


%% Association of points between point clouds A and B
% Loop over B and find nearest neighbor in A (set A as the reference)
[idBA, ~] = knnsearch(A.Location, B.Location);
% Loop over A and find nearest neighbor in B (set B as the reference)
[idAB, ~] = knnsearch(B.Location, A.Location);


%% Angular similarity score of B (set A as reference)
% Angular similarity between tangent planes of associated points
asBA = 1 - 2*acos(abs( sum(A.Normal(idBA,:).*B.Normal,2)./(sqrt(sum(A.Normal(idBA,:).^2,2)).*sqrt(sum(B.Normal.^2,2))) ))/pi;

% Pooling
if strcmp(POOLING_TYPE, 'Mean')
    asimBA = nanmean(real(asBA));
elseif strcmp(POOLING_TYPE, 'Min')
    asimBA = nanmin(real(asBA));
elseif strcmp(POOLING_TYPE, 'Max')
    asimBA = nanmax(real(asBA));
elseif strcmp(POOLING_TYPE, 'MSE')
    asimBA = nanmean(real(asBA).^2);
elseif strcmp(POOLING_TYPE, 'RMS')
    asimBA = sqrt(nanmean(real(asBA).^2));
else
    error('WrongInput');
end


%% Angular similarity score of A (set B as reference)
% Angular similarity between tangent planes of associated points
asAB = 1 - 2*acos(abs( sum(A.Normal.*B.Normal(idAB,:),2)./(sqrt(sum(A.Normal.^2,2)).*sqrt(sum(B.Normal(idAB,:).^2,2))) ))/pi;

% Pooling
if strcmp(POOLING_TYPE, 'Mean')
    asimAB = nanmean(real(asAB));
elseif strcmp(POOLING_TYPE, 'Min')
    asimAB = nanmin(real(asAB));
elseif strcmp(POOLING_TYPE, 'Min')
    asimAB = nanmax(real(asAB));
elseif strcmp(POOLING_TYPE, 'MSE')
    asimAB = nanmean(real(asAB).^2);
elseif strcmp(POOLING_TYPE, 'RMS')
    asimAB = sqrt(nanmean(real(asAB).^2));
else
    error(message('WrongInput'));
end


%% Symmetric angular similarity score
asimSym = nanmin(asimBA, asimAB);
