function output = playfair_cipher(plaintext, key)
    % Convert plaintext and key to uppercase
    plaintext = upper(plaintext);
    key = upper(key);
    
    % Remove spaces from the plaintext and key
    plaintext = strrep(plaintext, ' ', '');
    key = strrep(key, ' ', '');
    
    % Remove duplicate characters from the key
    key = unique(key, 'stable');
    
    % Generate the Playfair matrix
    alphabet = 'ABCDEFGHIKLMNOPQRSTUVWXYZ'; % J is omitted
    key_matrix = reshape([key, setdiff(alphabet, key)], 5, 5);
    
    % Preprocess the plaintext (replace J with I and add dummy character if necessary)
    plaintext = replace(plaintext, 'J', 'I');
    if mod(length(plaintext), 2) ~= 0
        plaintext = [plaintext, 'X']; % Add a dummy character (e.g., 'X') if plaintext length is odd
    end
    
    % Initialize output variable
    output = '';
    
    % Encrypt the plaintext
    for i = 1:2:length(plaintext)
        % Find positions of the two characters in the key matrix
        [row1, col1] = find(key_matrix == plaintext(i));
        [row2, col2] = find(key_matrix == plaintext(i + 1));
        
        % Handle characters in the same row
        if row1 == row2
            col1 = mod(col1, 5) + 1;
            col2 = mod(col2, 5) + 1;
            
        % Handle characters in the same column
        elseif col1 == col2
            row1 = mod(row1, 5) + 1;
            row2 = mod(row2, 5) + 1;
            
        % Handle characters forming a rectangle
        else
            col1_old = col1;
            col2_old = col2;
            col1 = col2_old;
            col2 = col1_old;
        end
        
        % Append the encrypted characters to the output
        output = [output, key_matrix(row1, col1), key_matrix(row2, col2)];
    end
end


plaintext = ['HELLO' ...];
key = 'PLAYFAIREXAMPLE';
encrypted_text = playfair_cipher(plaintext, key);
disp(encrypted_text);
