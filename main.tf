provider "google" {
  credentials = "key.json"
  region      = "us-central1" 
}

terraform {
  backend "gcs" {
    bucket = "vivesh"
  }
}
module "pubsub_topic" {
  source = "https://github.com/574n13y/Google-Pub-Subtopic?ref=v0.1.2"
  name = "pub-sub-topic"
  project     = "vivesh-405513"

}


variable "topic_name" {
  description = "The name of the Pub/Sub topic"
  type        = string
}

resource "google_pubsub_topic" "pubsub_topic" {
  name = var.topic_name
  labels = {
    foo = "bar"
  }

  message_retention_duration = "86600s"
}
