provider "google" {
  credentials = "key.json"
  region      = "us-central1" 
   
}

terraform {
  backend "gcs" {
    bucket = "vivesh"
  }
}
# module "pubsub_topic" {
# source = "github.com/mineiros-io/terraform-google-pubsub-topic?ref=v0.1.2"
#  name = "pub-sub-topic"
#  project     = "vivesh-405513"

# }
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

