function output = multiplicative_cipher(plaintext, key)
    % Convert plaintext to uppercase
    plaintext = upper(plaintext);
    
    % Define the alphabet
    alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    
    % Initialize output variable
    output = '';
    
    % Loop through each character in the plaintext
    for i = 1:length(plaintext)
        % Find the index of the current character in the alphabet
        idx = find(alphabet == plaintext(i));
        
        % Apply the encryption formula: C = (P * key) mod 26
        encrypted_idx = mod(idx * key, 26);
        
        % Handle the case when encrypted index is 0
        if encrypted_idx == 0
            encrypted_idx = 26;
        end
        
        % Append the encrypted character to the output
        output = [output, alphabet(encrypted_idx)];
    end
end

plaintext = 'HELLO';
key = 7; % Choose a key (must be coprime with 26)
encrypted_text = multiplicative_cipher(plaintext, key);
disp(encrypted_text);
