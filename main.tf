provider "google" {
  credentials = "key.json"
  project     = "vivesh"
  region      = "us-central1"    

}

module "terraform-google-pubsub-topic" {
  source = "github.com/mineiros-io/terraform-google-pubsub-topic?ref=v0.1.2"

  name    = "pub-sub-topic-name"
 project     = "vivesh"
}


variable "topic_name" {
  description = "Customer"
  type        = string
}

resource "google_pubsub_topic" "pubsub_topic" {
  name = var.topic_name
  labels = {
    foo = "bar"
  }

  message_retention_duration = "86600s"

}

