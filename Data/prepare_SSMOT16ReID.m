clc
clear 
%% 
% Make one folder per person
% person_id / image_name

camIDs = {'1', '2'};
for c = 1:numel(camIDs)
    fprintf('Parsing cam-%d...\n',c);
    camID = camIDs{c};
    iminfo = dir(sprintf('../../MOT16_ReID/SSMOT16-10/cam_%s/*.jpg',camID));
    names = {iminfo.name};
    
    for i = 1:numel(names)
        tmpname = names{i};
        namesplit = split(tmpname,'-');
        person_id = cell2mat(namesplit(1,1));
        mkdir(sprintf('../../MOT16_ReID/SSMOT16-10/cam%d/%s',c,person_id));
        movefile(sprintf('../../MOT16_ReID/SSMOT16-10/cam_%s/%s',camID,tmpname),sprintf('../../MOT16_ReID/SSMOT16-10/cam%d/%s/%s',c,person_id,tmpname));
    end
end