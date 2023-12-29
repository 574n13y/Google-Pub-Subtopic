provider "google" {
  credentials = "key.json"
  project     = "vivesh"
  region      = "us-central1"    

}

variable "topic_name" {
  description = "Customer"
  type        = string
}

resource "google_pubsub_topic" "my_pub_sub" {
  name         = "Customer-topic"
  kms_key_name = google_kms_crypto_key.crypto_key.id
}

resource "google_kms_crypto_key" "crypto_key" {
  name     = "Customer-key"
  key_ring = google_kms_key_ring.key_ring.id
}

resource "google_kms_key_ring" "key_ring" {
  name     = "Customer-keyring"
  location = "global"
}
