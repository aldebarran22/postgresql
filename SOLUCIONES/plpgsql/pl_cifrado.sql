create extension pgcrypto;

select convert_from(decrypt('\x34591627f9c8eae417fc7cbbf458592c','1234','aes'),'SQL_ASCII');

Select encode(decrypt(encrypt('mi mensaje', 'clave', 'bf'),
'clave', 'bf'), 'escape');


select pgp_sym_decrypt(pgp_sym_encrypt('mi mensaje', '12345'), '12345');

select pgp_sym_decrypt(pgp_sym_encrypt('mi mensaje 22222', '12345', 'compress-algo=1, cipher-algo=aes256'), 
					   '12345','compress-algo=1, cipher-algo=aes256');
