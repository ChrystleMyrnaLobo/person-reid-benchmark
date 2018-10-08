clc
clear 
%% Main file to run the experiment 

env_setup;

%% parameters for data
% name - ['viper','airport','DukeMTMC','caviar'];
% datafolder - path to the folder for datasets
% pair - specific camera pairs (valid for ['raid','ward','saivt'])

% datafolder = '../VIPeR'
% params = { 'name','viper',...       % dataset name [viper, airport, DukeMTMC, caviar]
%            'datafolder',datafolder,...% folder for datasets
%            'pair',[]};              % specific camera pairs

datafolder = '../MOT16_ReID/SSMOT16-10'
params = { 'name', 'ssmot10', ...
            'datafolder', datafolder, ...
            'pair', [] };

dopts = setParam('dataset',params);
%% parameters for feature extraction
% featureType - ['whos', 'gog', 'gbicov', 'ldfv', 'color_texture', 'hist_lbp', 'lomo']
% numRow/numCol/overlap - parameters for bounding box partition 
params = { 'featureType','whos',... % feature type [whos, gog, gbicov, ldfv, color_texture, hist_lbp, lomo]
           'numRow',6,...           % number of split rows    
           'numCol',1,...           % number of split cols
           'overlap',0,...          % indicator for overlapping split (50%)
           'doPCA',1,...            % indicator for PCA dimension reduction
           'pcadim',100};           % PCA dimensions
fopts = setParam('feature',params);
%% parameters for metric learning 
params = { 'method','klfda',...      % metric learning method [fda, lfda, klfda, mfa, kmfa, xqda, pcca, rpcca, kpcca, NFST, kissme, prdc, svmml]
           'kernels','linear'};           % kernel types [linear, chi2, chi2-rbf, exp]
mopts = setParam('metric',params);
%% parameters for ranking
params = { 'rankType','rnp',...     % rank type for multi-shot [rnp, srid, ahisd]
           'saveMetric',1,...       % indicator for saving learned metric
           'saveInterm',1};         % indicator for saving intermediate results
ropts = setParam('ranking',params);

%% evaluate 
run_one_experiment;