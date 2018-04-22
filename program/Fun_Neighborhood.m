function []=Fun_Neighborhood(structure)

% start = 1; koniec = start + 50 - 1;
% sklejone = cat(2, structure.Markers{start:koniec})
% sklejoneX = sklejone(:, 1:2:end);
%%
for k=49:50:size(structure.Markers,2)
    
    m1=structure.Markers{k};
    m2=structure.Markers{k+1};
    podobne=knnsearch(m1(:,1), m2(:,1));
    
    
    %% ka¿d¹ kolejn¹, a¿ do 100 muszê przerobiæ miejscami
    for i=k+1:1:k
        a=structure.Markers{i};
        for j=1:1:size(podobne,1)
            b(j,1)=a(podobne(j),1);
            b(j,2)=a(podobne(j),2);
        end
        structure.Markers{i}=b;
    end
    
end
zostaw=zeros(5,1);
for i=1:50:size(structure.Markers,2)
    
    sklejone = cat(2, structure.Markers{i:i+48});
    sklejone = sklejone(:, 1:2:end);
    %
    %wsk = abs(sklejone(:, 1) - sklejone(:, end));
    wsk = abs(diff(sklejone, 1, 2));
    [~, I] = sort(wsk, 'Descend');
    I = I(1:5);
    zostaw = [zostaw sklejone(I, :)];
    if(i==1)
        zostaw=zostaw(:,2:end);
    end
end
structure.Neighborhood=zostaw;
end
