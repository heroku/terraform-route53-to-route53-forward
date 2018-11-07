# Child aws account, in which the new zone will be created.
provider "aws" {
  alias = "child"
}

# AWS account containing the root zone, in which NS records delegating to the new zone will be created.
provider "aws" {
  alias = "root"
}
