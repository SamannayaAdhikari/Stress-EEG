data = featuresymmetrySheet1;

%removing unnecessary columns
data(:,1:2) = [];
data(:,8) = [];

%removing unnecessary rows
%data(1,:) = []


% removing outliers
%for i=3:32
    %col=data{:,i};
    %outs(1,i)=sum(isoutlier(col))
    %tempcol=filloutliers(col,"nearest");
    %col=tempcol;
    %outs(2,i)=sum(isoutlier(col))
    %data{:,i}=col;

%end


%standardization

for i=1:31
    col=data{:,i};
    col=zscore(col);
    data{:,i}=col;

end

%normalization

for i=1:31
    col=data{:,i};
    col = (col - min(col))/ (max(col) - min(col));
    data{:,i}=col;
end


% %one hot encoding for channels
% channel=unique(data.ChannelName)
% dummy_var=[]
% variables=data.ChannelName
% for i = 1:length(channel)
%     dummy_var(:,i)=double(ismember(variables, channel(i)));
% end
% 
% channel=cellstr(channel)
% new=array2table(dummy_var,'VariableNames',channel);
% data=[data new]
% 
% 
% %moving label column to last
% 
% data=movevars(data,"lebel","After","T8");
% 
