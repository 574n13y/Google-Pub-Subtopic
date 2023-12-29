provider "google" {
  credentials = "key.json"
  project     = "vivesh-405513"
  region      = "us-central1"    

}

variable "topic_name" {
  description = "Customer"
  type        = string
}

resource "google_pubsub_topic" "mypub" {
  name = "mypubsub-topic"

  labels = {
    foo = "bar"
  }
  message_retention_duration = "900000s"
}


resource "google_pubsub_topic" "vivesh" {
  name = "demo-topic"
}

resource "google_pubsub_subscription" "my_sub" {
  name  = "demo-subscription"
  topic = google_pubsub_topic.vivesh.name

  ack_deadline_seconds = 20

  labels = {
    foo = "bar"
  }

  push_config {
    push_endpoint = "https://example.com/push"

    attributes = {
      x-goog-version = "v1"
    }
  }
}
