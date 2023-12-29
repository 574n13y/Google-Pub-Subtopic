provider "google" {
  credentials = "key.json"
  project     = "vivesh"
  region      = "us-central1"    

}

module "pubsub_topic" {
 source  = "sysdiglabs/secure-for-cloud/google"
  version = "0.9.11"

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

