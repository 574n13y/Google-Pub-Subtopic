# Google-Pub-Subtopic
Develop Terraform code for creating and managing Google Pub/Subtopic.

## GCP 
 - Create a GCP account in case you don't have one.
 - Once GCP account is created -> Create Project
 - Navigate  to "IAM & Admin" -> click on service account
   ![iam](https://github.com/574n13y/Google-Pub-Subtopic/assets/35293085/70f40fa7-df9f-4383-a4c4-fd0529864667)
  
 - Create a service account -> Give nessary permission's as per your requirement.
   ![iam 1](https://github.com/574n13y/Google-Pub-Subtopic/assets/35293085/a3b4e7a2-0c6d-4fd5-a3ed-23b8d08a40bb)
   
 - Click on Created (in my case i have created terraform service account) service account navigate to "key" -> click on "ADD KEY"
   ![iam 2](https://github.com/574n13y/Google-Pub-Subtopic/assets/35293085/f508fb6b-26e7-41f4-b03c-6d0b3e584880)

 - Click on create new key -> Select json file  - Click on create.
   ![iam 3](https://github.com/574n13y/Google-Pub-Subtopic/assets/35293085/201b3b4e-9c50-4ab7-9b8a-0d3ed46f3daf)

 - Once key is created, private key will be downloaded in you local pc, rename it to key.json
   ![iam 4](https://github.com/574n13y/Google-Pub-Subtopic/assets/35293085/42c0b942-ea79-4044-87fe-196818889846)
   ![iam 5](https://github.com/574n13y/Google-Pub-Subtopic/assets/35293085/13520d82-8e83-4d44-9fa6-d70499d4e306)

 - Before starting with the terraform code make sure to 'enable' pub/sub service from marketplace

## Github
  - Create a Repo
  - Write a code for creating and managing Google Pub/Subtopic.
  - Here is the demo code i created,  you can use this  or you can use my code [main.tf]()
    ```
    # main.tf

    provider "google" {
    credentials = file("<path-to-service-account-key>")
    project     = "<your-project-id>"
     region      = "us-central1"  # Update with your desired region
    }

    module "pubsub_topic" {
     source = "./modules/pubsub-topic"

      topic_name = "example-topic"
    }



     # modules/pubsub-topic/main.tf

    variable "topic_name" {
     description = "The name of the Pub/Sub topic"
     type        = string
     }

    resource "google_pubsub_topic" "pubsub_topic" {
     name = var.topic_name
    }

    ```
    ![main](https://github.com/574n13y/Google-Pub-Subtopic/assets/35293085/5ede0542-37ee-4425-86b0-3b8298b34813)
    ![Github](https://github.com/574n13y/Google-Pub-Subtopic/assets/35293085/f0017deb-04ac-4162-a4e8-9f1e4b9562f4)

   - upload the key.json
     ![service account key](https://github.com/574n13y/Google-Pub-Subtopic/assets/35293085/8a4d09be-b4cc-4beb-be36-856feb71cb63)

    

## Terraform cloud 
  - [Login to Terraform cloud](https://app.terraform.io/session?redirect_to=%2Fapp%2Fgetting-started)
    ![terra 0](https://github.com/574n13y/Google-Pub-Subtopic/assets/35293085/34517a87-55f5-4579-9596-77631601f2f0)

  - Create a workspace
    ![terra 1](https://github.com/574n13y/Google-Pub-Subtopic/assets/35293085/5113c6f1-436f-4dcf-b2e7-64502abe4f2b)

  - Click on Version control -> select github ->  authenticate it with your github account -> select github repo -> Click on Create
    ![terra](https://github.com/574n13y/Google-Pub-Subtopic/assets/35293085/45eb4230-c38e-47ea-8fa1-1a406231ff74)

  - Once workspace is created Add variable value and save it.
     ![terra 2](https://github.com/574n13y/Google-Pub-Subtopic/assets/35293085/ed32d306-cd64-4b42-bd0b-89da263a0563)
    
  - Click on Start new Plan
    ![terra 3](https://github.com/574n13y/Google-Pub-Subtopic/assets/35293085/ef3f7d3b-128d-4d05-bf94-2949aeee6a06)

  - Terraform cloud will run the plan and show to the ouptup for the same.
    ![terraformcloud plan](https://github.com/574n13y/Google-Pub-Subtopic/assets/35293085/407d701d-f03f-48b1-871b-9eb2a02e4fd9)

  - Now cick on apply to make changes -> it will create a pubsub topic.
    ![applyper](https://github.com/574n13y/Google-Pub-Subtopic/assets/35293085/a503ac01-6e3e-4428-b58c-1b8434bebae0)
    ![apply](https://github.com/574n13y/Google-Pub-Subtopic/assets/35293085/67356d69-047f-4dc7-8bba-8956e7f27721)

## Valiadtion 

  - Plan
    ![plan 1](https://github.com/574n13y/Google-Pub-Subtopic/assets/35293085/38da78ba-1177-4c9b-9a5d-175c3c33bc71)
    ![plan 2](https://github.com/574n13y/Google-Pub-Subtopic/assets/35293085/51071ff6-25df-41e3-bf81-bbc7d12a74f8)
    ![plan 3](https://github.com/574n13y/Google-Pub-Subtopic/assets/35293085/bbf8ffab-c433-4ab3-b11e-fa35a700546b)
    
  - Apply
    ![apply 1](https://github.com/574n13y/Google-Pub-Subtopic/assets/35293085/fa6887f7-f355-48b4-a3d6-def93018cd97)
    ![apply 2](https://github.com/574n13y/Google-Pub-Subtopic/assets/35293085/10c7b5e0-6d12-49d5-b7b1-f0ab875d0c51)
    ![apply 3](https://github.com/574n13y/Google-Pub-Subtopic/assets/35293085/c36df16b-6dfc-433a-86c2-5825d9570600)
    
  - topics
    ![top](https://github.com/574n13y/Google-Pub-Subtopic/assets/35293085/1230c276-8d70-454b-9143-9960f9e81f86)
    ![top-details](https://github.com/574n13y/Google-Pub-Subtopic/assets/35293085/3858fbc4-01c6-4c8e-8dc4-5e58329d7872)
    ![topics](https://github.com/574n13y/Google-Pub-Subtopic/assets/35293085/1f6ce694-9dc2-4d6c-a878-4f9f6006ca86)
    ![ps request](https://github.com/574n13y/Google-Pub-Subtopic/assets/35293085/cf9c0e12-6e62-454a-957f-5600bac894e8)
    ![ps](https://github.com/574n13y/Google-Pub-Subtopic/assets/35293085/715cccf2-ea22-4578-bedd-b1c0e6876143)

  - Subscriptions
    ![subscriptions](https://github.com/574n13y/Google-Pub-Subtopic/assets/35293085/0a8d38e0-fe9c-43a3-af16-000c835abe75)
    ![sub details](https://github.com/574n13y/Google-Pub-Subtopic/assets/35293085/237ad58a-7569-453f-af38-7043ddc8df76)


                                    ********



    
   
