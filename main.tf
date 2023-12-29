provider "google" {
  credentials = "key.json"
  region      = "us-central1"    
}

terraform {
  backend "gcs" {
    bucket = "vivesh"
  }
}
 module "secure-for-cloud" {
  source  = "sysdiglabs/secure-for-cloud/google"
  version = "0.9.11"
  name = "pub-sub-topic"

 }
variable "topic_name" {
  description = "The name of the Pub/Sub topic"
  type        = string
}

resource "google_pubsub_topic" "my_pubsub_topic" {
  name = "pub-sub-topic"
  labels = {
    foo = "bar"
  }

  message_retention_duration = "86600s"
}

