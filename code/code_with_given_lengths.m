% producing a code with a set of codeword lengths that satisfy 
% the Kraft inequality

function code = code_with_given_lengths(lens)
if sum(1./(2.^lens)) > 1
    error('Kraft inequality not satisfied')
end
lens = sort(lens);
code{numel(lens),1} = [];
current_codeword = [];
for i = 1:numel(lens)
    current_codeword = next_lex(current_codeword, lens(i));
    code{i} = current_codeword;
end