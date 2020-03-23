# set default region and get de credentials
provider "aws" {
  region                  = "sa-east-1"
  shared_credentials_file = "~/.aws/credentials" 
}

