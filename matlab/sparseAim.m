function [varargout] = sparseAim(varargin)
% Following is the argument list. 
%   I = input argument (to MEX,C program)
%   O = output argument (from MEX,C program)
%   REQ = basic argument
%
% inMatrix (I,REQ) structural coefficients matrix.
%    parsed into hmat, hmatj, hmati in the Gateway.
% 
% leads (I,REQ) number of leads
% 
% outMatrix (I optional,O REQ) asymptotic constraint matrix in
%                              "Compressed Sparse Row" format.
%    created from qmat, qmatj, qmati in the Gateway.
% 
% roots (O,REQ) real and imaginary parts of transition matrix eigenvalues.
%    created from rootr and rooti in the Gateway.
%
% maxNumberOfHElements (I,O) A strictly positive integer. The
%   number of elements to allocate for hmat storage. On output, the minimum
%   value required to carry out the computations for this function invocation.
% 
% discreteTime (I) when non-zero, computes discrete time solutions, when
%   0 computes continuous time solutions. The former case requires ruling out
%   eigenvalues bigger than one in magnitude. The latter case requires ruling
%   out eigenvalues with positive real part.
% 
% hrows (I) number of rows in inMatrix. Obtained from inMatrix
%                                       
% hcols (I) number of columns in inMatrix. Obtained from inMatrix
% 
% outnewHmat (O) transformed structural coefficients matrix in
%                "Compressed Sparse Row" format. Leading block non-singular.
%    created from newHmat, newHmatj, newHmati in the Gateway.
% 
% auxiliaryInitialConditions (I,O) number of auxiliary initial conditions.
% 
% rowsInQ (I,O) number of rows in outMatrix
% 
% essential (O) number of elements in rootr and rooti modified by routine.
% 
% returnCode (O)
%
% sparseAim - MATLAB template function to call sparseAimGateway, a MEX program that
%             calls the Anderson sparseAim algorithum.
%

% Basic execution of sparseAim requires as input the structural
% coefficients matrix in "Compressed Sparse Row" format and the 
% number of leads in the model. The input matrix may be either full 
% or sparse. A full matrix(row format) will be converted to a sparse 
% matrix in the Gateway program.
%
% Values for additional input parameters(arguments) may be specified
% for more sophisticated problems. This template supplies values
% for a basic setting of input arguments.
%  
% Primary outputs are the asymptotic constraint matrix in 
% "Compressed Sparse Row" format and a roots matrix. Other output
% parameters are generated and may be used for more spohisticated
% problems. A modified form of the input matrix is returned as the
% last output argument.

%
%      !!! NOTE NOTE NOTE !!!
% Anderson's sparseAim routines require "Compressed
% Sparse Row" format while Matlab's built in matrix routines 
% and MEX functions are in "Compressed Column Format". The input
% matrix will therefore be transposed before calling sparseAimGateway
% and then transposed again after returning from sparseAimGateway.
% Row and column values(hrows,hcols) are obtained from the transposed
% matrix. These operations are performed below.
%
% Arguments to the function must be entered in the order specified below.
%
% Note that some arguments could be both input and output. 
%
%  END OF HELP DOCUMENT

disp('STARTING sparseAim.m');
disp(' ')
disp(datestr(now))
disp(' ')

%  Remove this block of code when testing is complete.

inMatrix = [0 0 -1.1 0 1 1.;0 -0.7 0 1 0 0];
inMatrix = inMatrix';
spincheck = sparse(inMatrix);

leads = 1;

[hrows,hcols] = size(inMatrix);

maxNumberOfHElements = (hrows * hcols);
if (maxNumberOfHElements > 100000)
  maxNumberOfHElements = 100000
end

%  Remove this block of code when testing is complete.

discreteTime = 1;
auxiliaryInitialConditions = 0;
rowsInQ = 0;

disp('nargin = '); disp(nargin)
disp('nargout = '); disp(nargout)

if (nargin > 0)
  disp('unpacking  input arguments')
  for i = 1:nargin
    switch i
      case 1
        inMatrix = varargin{1};
      case 2
        leads = varargin{2};
      case 3
        maxNumberOfHElements = varargin{3};
      case 4
        discreteTime = varargin{4};
      case 5
         auxiliaryInitialConditions = varargin{5};
      case 6
        rowsInQ = varargin{6};
     end
  end
end

%inMatrix = inMatrix';
spincheck = sparse(inMatrix);

[hrows,hcols] = size(inMatrix);

maxNumberOfHElements = (hrows * hcols);
if (maxNumberOfHElements > 100000)
  maxNumberOfHElements = 100000
end

%disp(' Transposed inMatrix = '); disp(inMatrix)

hrows
hcols

[outMatrix,roots,outnewHmat,outmaxNumberOfHElements,outauxiliaryInitialConditions, ...
  outrowsInQ,outessential,outreturnCode,spinmatrix] = ...
    sparseAMAGateway(inMatrix,leads,maxNumberOfHElements,discreteTime,hrows, ...
    hcols,auxiliaryInitialConditions,rowsInQ);

  outMatrixt = outMatrix';
  roots = roots';

printout = 0;

if (printout == 1)
  outMatrixt
  roots
  outnewHmat
  outmaxNumberOfHElements
  outauxiliaryInitialConditions
  outrowsInQ
  outessential
  outreturnCode
end

[hrowsout,hcolsout] = size(outMatrix)
[hrowsoutt,hcolsoutt] = size(outMatrixt)


%outFullMatrix = full(outMatrixt);

if (nargout > 0)
  disp('packing  output arguments')
  for i = 1:nargout
    switch i
      case 1
       varargout{1} = outMatrixt;
      case 2
       varargout{2} = roots;
      case 3
       varargout{3} = outnewHmat;
      case 4
       varargout{4} = outmaxNumberOfHElements;
      case 5
       varargout{5} = outauxiliaryInitialConditions;
      case 6
       varargout{6} = outrowsInQ;
      case 7
       varargout{7} = outessential;
      case 8
       varargout{8} = outreturnCode;
      case 9
       varargout{9} = spinmatrix;
      end
    end
end

disp(' ')
disp(datestr(now))
disp(' ')

disp('ENDING sparseAim.m');
