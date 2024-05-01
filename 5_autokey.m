function output = autokey_cipher(plaintext, key)
    % Convert plaintext and key to uppercase
    plaintext = upper(plaintext);
    key = upper(key);
    
    % Define the alphabet
    alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    
    % Initialize output variable
    output = '';
    
    % Generate the autokey
    autokey = [key, plaintext];
    
    % Loop through each character in the plaintext
    for i = 1:length(plaintext)
        % Find the index of the current character in the alphabet
        plaintext_idx = find(alphabet == plaintext(i));
        key_idx = find(alphabet == autokey(i));
        
        % Apply the encryption formula: C = (P + K) mod 26
        encrypted_idx = mod(plaintext_idx + key_idx - 2, 26) + 1;
        
        % Append the encrypted character to the output
        output = [output, alphabet(encrypted_idx)];
    end
end

plaintext = 'HELLO';
key = 'SECRET';
encrypted_text = autokey_cipher(plaintext, key);
disp(encrypted_text);
