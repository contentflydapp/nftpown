#!/bin/bash

# Upgrade Canisters
DFX_IDENTITY_PRINCIPAL=$(dfx identity get-principal)
TOKEN_ID="CFO"
TOKEN_NAME="Content Fly Pown NFT"

CANISTER_CAP_ID="$CANISTER_CAP_ID"
CANISTER_CAP_LOCAL_ID="$CANISTER_CAP_LOCAL_ID"

printf "Deploying the CF Pown NFT Canister\n"
printf "TOKEN_ID=$TOKEN_ID\n"
printf "TOKEN_NAME=$TOKEN_NAME\n"
printf "DFX_IDENTITY_PRINCIPAL=$DFX_IDENTITY_PRINCIPAL\n"

upgradeicdev() {
  printf "CANISTER_CAP_ID=$CANISTER_CAP_ID\n"
  printf "\n\n"

  dfx build --network ic nft
  dfx canister --network ic install nft --mode upgrade --argument "(principal \"$DFX_IDENTITY_PRINCIPAL\", \"$TOKEN_ID\", \"$TOKEN_NAME\", principal \"$CANISTER_CAP_ID\", record {
    logo_type=\"image/jpg\";
    data=\"\";
  })"
}

upgradelocal() {
  printf "CANISTER_CAP_LOCAL_ID=$CANISTER_CAP_LOCAL_ID\n"
  printf "\n\n"

  dfx build nft
  dfx canister install nft --mode upgrade --argument "(principal \"$DFX_IDENTITY_PRINCIPAL\", \"$TOKEN_ID\", \"$TOKEN_NAME\", principal \"$CANISTER_CAP_LOCAL_ID\", record {
    logo_type=\"image/jpg\";
    data=\"\";
  })"
}

upgradelocal
