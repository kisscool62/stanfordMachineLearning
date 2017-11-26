function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%


C_candidates = [0.01 0.03 0.1 0.3 1 3 10 30];
sigma_candidates = [0.01 0.03 0.1 0.3 1 3 10 30];

nb_C_candidates = size(C_candidates, 2);
nb_sigma_candidates = size(sigma_candidates, 2);

candidates = zeros(nb_C_candidates * nb_sigma_candidates, 3);

iter = 0;
for C_candidate = C_candidates
	for sigma_candidate = sigma_candidates
		iter ++;
		candidates(iter, 1) = C_candidate;
		candidates(iter, 2) = sigma_candidate;
		model = svmTrain(X, y, C_candidate, @(x1, x2)gaussianKernel(x1, x2, sigma_candidate), 1e-3, 20);

		predictions = svmPredict(model, Xval);

		error = mean(double(predictions ~= yval));

		candidates(iter, 3) = error; 
	end
end


[_ ix] = min (candidates(:, 3));

C = candidates(ix, 1);
sigma = candidates(ix, 2);




% =========================================================================

end
