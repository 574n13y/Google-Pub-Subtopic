provider "google" {
  credentials = "key.json"
  project     = "vivesh-405513"
  region      = "us-central1" 
}

module "pubsub_topic" {
  source = "./modules/pubsub-topic"

  topic_name = "example-topic"
}


variable "topic_name" {
  description = "The name of the Pub/Sub topic"
  type        = string
}

resource "google_pubsub_topic" "pubsub_topic" {
  name = var.topic_name
}
