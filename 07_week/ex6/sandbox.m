function word_indices = sandbox()
	
	email_contents = {'this' 'is' 'a' 'spam' 'email'};

	vocabList = {'not'; 'found'; 'spam'; 'this'; 'one'; 'email'};

	word_indices = [];

	for word = email_contents
       	 	index = find(strcmp(vocabList, word), 1, 'first');
        	if ( ! isempty(index))
                	word_indices = [word_indices ; index];
        	end
	end

	x = zeros(6, 1);

	for i = 1:length(x)
		x(i) = any(word_indices == i);
	end
	x
end
