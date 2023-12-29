provider "google" {
  credentials = "key.json"
  project     = "vivesh"
  region      = "us-central1"    

}

variable "topic_name" {
  description = "Customer"
  type        = string
}

resource "google_pubsub_topic" "pubsub_topic" {
  name = "pubsub_topic_test"
  labels = {
    foo = "bar"
  }

  message_retention_duration = "86600s"

}

