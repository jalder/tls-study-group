#!/bin/bash

# CA

openssl genrsa -des3 -out myCA.key 2048

openssl req -x509 -new -nodes -key myCA.key -sha256 -days 1825 -out myCA.pem

# Server

openssl genrsa -out server.key 2048

openssl req -config server.ext -new -key server.key -out server.csr

openssl x509 -req -in server.csr -CA myCA.pem -CAkey myCA.key -CAcreateserial -out server.crt -days 825 -sha256 -extensions server_extensions -extfile server.ext

cat server.crt server.key > server.pem

# Client

openssl genrsa -out client.key 2048

openssl req -config client.ext -new -key client.key -out client.csr

openssl x509 -req -in client.csr -CA myCA.pem -CAkey myCA.key -CAcreateserial -out client.crt -days 825 -sha256 -extensions client_extensions -extfile client.ext

cat client.crt client.key > client.pem

