provider "google" {
  credentials = "key.json"
  project     = "vivesh-405513"
  region      = "us-central1" 
}

module "pubsub_topic" {
  source = "github.com/mineiros-io/terraform-google-pubsub-topic?ref=v0.1.2"
  name = "pub-sub-topic"

}


variable "topic_name" {
  description = "The name of the Pub/Sub topic"
  type        = string
}

resource "google_pubsub_topic" "pubsub_topic" {
  name = var.topic_name
}
