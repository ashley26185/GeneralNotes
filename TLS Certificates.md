# Symmetric Encryption
Data is encrypted using a Private Key
Key is sent with the data and used for both encryption and decryption
Hackers can sniff the key as well

# Assymetric Encryption
A Pair of keys - Private Key and Public Key
Public Lock can be used to encrypt and shared with anyone. Encrypted data can only be unlocked using the Private Key

Copy the Public Locks to the servers under ~/.ssh/authorized_keys
Never share the private key with anyone

## Useful Links
https://www.freecodecamp.org/news/openssl-command-cheatsheet-b441be1e8c4a/#4d47

## Generate a RSA Private key. Generate the Public Key from the Private Key
In ANY public key crypto system the public key is mathematically related to the private key. It's very simple. The public key is derived from the private key at generation time, and with the private key at any point in the future it is possible to re-derive the public key easily. It is not feasible to go the other way

### Generate a Private Key [2048 / 4096/ 8192 ]
openssl genrsa -out my-bank.key [bits]

### Generate a Public key from the private key (defaults inform and outform to PEM)
openssl rsa -in my-bank.key -pubout -out pubkey.pem


### Public Certificates Naming convention (This could be after signing)
.crt / .pem

### Private Key Naming Convention
.key / -key.pem

### Connect to remote server and obtain the certificate
openssl s_client -servername stackexchange.com -connect stackexchange.com:443 -showcerts

### Print the certificate
openssl x509 -in stackexchange.crt -text -noou

