% code_with_given_codelengths_alg
% helper module for producing a code given a set of codeword lengths that
% satisfy the Kraft inequality
function c = next_lex(current_codeword, next_length)
c = current_codeword;
for i = numel(c):-1:1
    if c(i)
        c(i) = 0;
    else
        c(i) = 1;
        break
    end
end
c = [c zeros(1,next_length-numel(c))];
end
