#!/bin/sh

geth init --datadir /db /config/genesis.json
#geth init --datadir /db /config/geth-genesis.json

# geth won't start when --eip4844 is specified:
# Fatal: Failed to register the Ethereum service: database contains incompatible genesis (have 37d4fce0f355f3e872cb63b6fa9b7b1a0a628f675c068af1fdc34869224bcbd6, new 879f5ee46274b55b2428bdf5ea0d1f27a3cee5b405762bc563f5a0edd0e
exec geth \
  --datadir /db \
  --networkid 4844001004 \
  --nodiscover \
  --syncmode=full \
  --verbosity 3 \
  --authrpc.jwtsecret /config/jwtsecret \
  --authrpc.vhosts="*" \
  --authrpc.addr=0.0.0.0 \
  --bootnodes "enode://8488a57c323d5e5bef1c40c5cb2330cb0bd75d900afad5e7f50a47ecc1ae7683fb664f509908c6b978633b9af75788e943f26e9b64989504d189ae7b3278ede3@161.35.91.184:30303,enode://aaae89afb5fbb38c39d12ea57bc42da5f93b68bcf820fdaccd5169084770cf7c13f4b67102312cb564e69b31fff32c0cdc934c962498a4fde69a310e68d06ba2@164.92.211.204:30303,enode://468e0b9086a5b36f00167a1fba0e01a8b80a1ffcee23a4f66dc22774828ca995d63f8c6f01ccadc455c69d5f0d8f745db29e7c88b4e3b0fffc2c7ff33a2aa121@161.35.91.165:30303,enode://7dfd6afc83ce698e72e7ce0a7b6143790f83084981fc75a812eaafbc7e663ed4bf6a6c4e6113af2a064fe3573766b37821b5d6120588adc8cd0b591d1410c397@164.92.155.224:30303,enode://c602624d0574a09eb8419503cfc51279677bbf08d116b992ef7b5f7fed1209cb65daef9f88d1c1ed4b56bb5c66757ee27c35bc37557c4b4f4575b9536782eafc@64.225.74.231:30303,enode://f54e2fabfa21d8c7f3b0ac405b0e853419634aa0181218ac9cba809d43fd00f5942cfeecc4f9e5871d983ae39125290d7ad9e041df00f8303f1d87dc49ea0d76@164.92.159.59:30303,enode://c44742e76163896da03a3ba280c0f46624f861a0f7b838056e3b001c3bf740fe156217cfbc407b93e09010fc55cbf982aba903f26c35afd038b8928c854284da@161.35.90.140:30303" \
  --authrpc.port 8551 \
  --http \
  --http.addr 0.0.0.0 \
  --http.port 8545 \
  --http.api=db,eth,net,web3,admin
