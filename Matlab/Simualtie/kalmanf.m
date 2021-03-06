% KALMANF - updates a system state vector estimate based upon an
%           observation, using a discrete Kalman filter.
%
% Version 1.0, June 30, 2004
%
% This tutorial function was written by Michael C. Kleder

function s = kalmanf(s)
% set defaults for absent fields:
if ~isfield(s,'x'); s.x=nan*z; end
if ~isfield(s,'P'); s.P=nan; end
if ~isfield(s,'z'); error('Observation vector missing'); end
if ~isfield(s,'u'); s.u=0; end
if ~isfield(s,'A'); s.A=eye(length(x)); end
if ~isfield(s,'B'); s.B=0; end
if ~isfield(s,'Q'); s.Q=zeros(length(x)); end
if ~isfield(s,'R'); error('Observation covariance missing'); end
if ~isfield(s,'H'); s.H=eye(length(x)); end
if isnan(s.x)
   % initialize state estimate from first observation
   if diff(size(s.H))
      error('Observation matrix must be square and invertible for state autointialization.');
   end
   s.x = s.H\s.z;
   s.P = s.H\(s.R/(s.H')); 
else
   
   % This is the code which implements the discrete Kalman filter:
   
   % Prediction for state vector and covariance:
   s.x = s.A*s.x + s.B*s.u;
   s.P = s.A * s.P * s.A' + s.Q;
   % Compute Kalman gain factor:
   K = (s.P*s.H')/(s.H*s.P*s.H'+s.R);
   % Correction based on observation:
   s.x = s.x + K*(s.z-s.H*s.x);
   s.P = s.P - K*s.H*s.P;
end
return
