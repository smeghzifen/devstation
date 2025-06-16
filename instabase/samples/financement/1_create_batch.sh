curl --location 'https://specific-host.aihub.instabase.com/api/v2/batches' \
--header 'Ib-Context:  xxxxxxxxx' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer TOKEN_ID' \
--data '{
  "name": "financement-validation"
}'