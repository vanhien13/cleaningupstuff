old_vector = [1 1 1 1 5 1 1 7 8 10];
new_vector = [0 0 0 0 0 0 0 0 0 0 ];
for i = 1 : length(old_vector)
    new_vector(i) = sum( old_vector( 1:i ) );
    %new_vector(i) = old_vector(1)+new_vector(i-1) + old_vector(i); 
end
