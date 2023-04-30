% Given a string, the function finds its letters, their frequencies, and
% constructs a Huffman code. It provides the dictionary for the Huffman
% code, as well as its average length and the compressed signal.
function [letters,freq,dict,avglen,sig_comp] = huffmanDictText(sig,sort)
letters_str = unique(sig);
letters = {};
M = numel(letters_str);
L = length(sig);
freq = zeros(1,M);
for i = 1:M
    for j = 1:L
        if letters_str(i) == sig(j)
            freq(i) = freq(i) + 1;
        end
    end
    letters{i} = letters_str(i);
end
freq = freq/sum(freq);
[dict, avglen]  = huffmandict(letters,freq);
if sort
    for i = 1:size(dict,1)
        dict{i,3} = length(dict{i,2});
        dict{i,4} = sprintf('%d',dict{i,2});
    end
    dict = cell2table(dict);
    dict = sortrows(dict,{'dict3','dict4'});
    dict = table2cell(dict);
    for i = 1:size(dict,1)
        for j = 1:size(dict,1)-1
            if dict{j,3} == dict{j+1,3} && dict{j,1} > dict{j+1,1}
                a = dict(j,1);
                dict(j,1) = dict(j+1,1);
                dict(j+1,1) = a;
            end
        end
    end
end
dict = dict(:,[1,4]);
sig_comp = huffmanenco(sig,dict);
sig_comp = num2str(sig_comp,'%d');