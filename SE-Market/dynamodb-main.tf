resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "Marketpalce-terraform"
  billing_mode   = "PROVISIONED"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "UserId"
  range_key      = "UserTitle"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "UserTitle"
    type = "S"
  }

  attribute {
    name = "TopScore"
    type = "N"
  }

  ttl {
    attribute_name = "TimeToExist"
    enabled        = false
  }

  global_secondary_index {
    name               = "UserTitleIndex"
    hash_key           = "UserTitle"
    range_key          = "TopScore"
    write_capacity     = 1
    read_capacity      = 1
    projection_type    = "INCLUDE"
    non_key_attributes = ["UserId"]
  }

  tags = {
    Name        = "dynamodb-table-1"
    Environment = "dev"
  }
}