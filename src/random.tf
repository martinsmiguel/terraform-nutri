resource "random_pet" "bucket_suffix" {
  length    = 5
  separator = "-"
}