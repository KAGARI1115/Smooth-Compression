%sig1 = lower('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');
%sig1 = sig1(1:100);
sig1 = lower('Mi. Felis habitant dictumst. Viverra felis pede euismod nostra metus dapibus eros. Parturient. Arcu nec duis mollis nisl potenti. Nascetur sociis maecenas libero suscipit. Odio ut erat nullam posuere. Pharetra ut inceptos quisque neque dapibus purus natoque eros bibendum libero. Eu. Facilisi ipsum Habitant porta ipsum pretium inceptos sed, pellentesque pede mattis. Molestie nam proin eros habitant sollicitudin condimentum sagittis porttitor nam cursus quis pellentesque platea dui quisque commodo eleifend, sociis pede purus amet tempus scelerisque elementum ultrices, elementum habitasse nostra aliquam nibh erat posuere. Montes ad eleifend magnis eu, pretium accumsan habitant habitasse ut facilisi imperdiet interdum phasellus per justo scelerisque commodo eu montes consectetuer tincidunt tempor pulvinar elementum. Integer venenatis felis morbi malesuada id mi dui. Conubia magna rutrum lacus. Ac mollis gravida integer natoque primis pede erat. Lobortis mattis quisque magnis mi cubilia ultricies tortor elit. Nullam. Rutrum ullamcorper sit eget tincidunt. Facilisis commodo etiam. Sed vel dictumst lacus, placerat nostra ac facilisi eleifend erat tempus vestibulum, diam lectus convallis cum libero dis id turpis Mus nulla scelerisque hymenaeos a gravida metus purus donec. Odio pretium convallis fusce posuere auctor natoque ridiculus ante semper elementum sodales tristique enim sodales. Consectetuer ut vivamus blandit inceptos placerat ut tellus. Porta duis ridiculus aptent rutrum egestas ultrices habitasse nunc. Platea metus pulvinar parturient conubia sem convallis nunc pretium. Eu eu, eu cubilia nisl id. Ultricies, vitae justo. Ac pede ligula curabitur arcu, bibendum vitae. Facilisi. Ridiculus. Donec eleifend dapibus primis tempor, eget lorem lorem habitasse bibendum hymenaeos cubilia in porta cras morbi curabitur faucibus primis hendrerit justo. Condimentum arcu mi rhoncus et integer praesent ac. Vehicula at habitasse hendrerit a. Eros, libero pharetra praesent fames fusce fames commodo ullamcorper condimentum mus laoreet est dignissim. Molestie feugiat integer elit diam lobortis. Curae; faucibus. Bibendum elit pulvinar ligula torquent eros fames. Purus faucibus, penatibus conubia massa, aptent eros cras dapibus per faucibus cubilia, ad sociosqu nisi mollis tempus orci nulla rutrum. Malesuada semper a nullam natoque aenean. Potenti cubilia mattis. Facilisi dignissim varius arcu purus quis viverra nec curabitur ultrices volutpat mauris non dignissim neque ullamcorper. Semper mus rutrum tempor enim dolor semper tempor eros gravida morbi tellus ligula, erat fringilla, nullam senectus nullam consequat ultrices commodo, curae; torquent imperdiet platea tellus fringilla dolor ullamcorper cum hac risus ullamcorper netus volutpat libero vivamus quam parturient gravida. Id dapibus ad pharetra ultrices eu luctus quam gravida class nisi pretium nostra placerat non potenti. Dis nullam. Mus at. Non litora lobortis nulla fusce habitant sagittis dictum ridiculus. Ullamcorper facilisis pellentesque eleifend. Nunc pellentesque pretium. Suspendisse sollicitudin. Vestibulum, platea condimentum tempor iaculis sodales aptent, facilisis habitasse euismod tincidunt. Ante ultrices porta ridiculus sagittis. Gravida quisque convallis magnis justo habitant vestibulum lacinia ridiculus orci sociis varius condimentum nam Volutpat elementum. Morbi aptent per. Duis posuere. Suscipit taciti imperdiet, nec sagittis est lobortis curae; fusce odio. Per vehicula cum turpis nulla nunc cum accumsan aptent sit. Ultrices sit lectus class cras phasellus interdum integer iaculis vehicula nullam Posuere placerat fermentum ipsum mollis. Erat fringilla non phasellus Pulvinar.')
m = length(sig1);
Max_l = 20;
n_reps = 1;
D = zeros(Max_l,1);
CD = zeros(n_reps,Max_l);
for l = Max_l-1:Max_l
    l
    for rep = 1:n_reps
        % delete the first occurrence of sed
        i = randi(m-l);
        sig2 = [sig1(1:i-1), sig1(i+l:end)];
        disp('___________')
        deleted = sig1(i:i+l-1); %#ok<*NOPTS> 
        n = length(sig2);
        %sig2 = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';
        [dict1,avglen1,sig1_comp] = huffmanDictText(sig1,1);
        [dict2,avglen2,sig2_comp] = huffmanDictText(sig2,1);
        Dict = outerjoin(dict1,dict2,"Keys","letter","MergeKeys",true);
        Dict = Dict(:,{'letter', 'freq_dict1', 'freq_dict2', ...
            'codeword_dict1', 'codeword_dict2', 'lens_dict1', 'lens_dict2'});
        Dict = sortrows(Dict,{'lens_dict1','letter'});
        M = length(sig1_comp)
        N = length(sig2_comp)
        %d_str = editDistance(sig1,sig2,'SubstituteCost',inf);
        %d_comp = editDistance(sig1_comp,sig2_comp,'SubstituteCost',inf)/ceil(log2(numel(unique(sig1))));
        D(l) = d_str;
        CD(rep,l) = d_comp;
    end
end
figure
plot(D,mean(CD))
