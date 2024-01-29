variable "env" {
  description = "Environment name"
}

variable "schedule_expression" {
  description = "see https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/ScheduledEvents.html"
}

variable "cpu" {
  description = "The CPU limit for this container definition"
  default     = "64"
}

variable "memory" {
  description = "The memory limit for this container definition"
  default     = "256"
}

variable "cluster_name" {
  description = "Name of the cluster to start the task in"
  default = "default"
}

variable "command" {
  description = "The command that is passed to the container"
  type        = list(string)
  default     = []
}

variable "platform_config" {
  description = "Platform configuration"
  type        = map(string)
  default     = {}
}

variable "release" {
  type        = map(string)
  description = "Metadata about the release"
}

variable "image_id" {
  type        = string
  description = "image for the task def"
}

variable "secrets" {
  type        = map(string)
  description = "Secret credentials fetched using credstash"
  default     = {}
}

variable "application_secrets" {
  type    = list(string)
  default = []
}

variable "platform_secrets" {
  type    = list(string)
  default = []
}

variable "name_suffix" {
  description = "Set a suffix that will be applied to the name in order that a component can have multiple services per environment"
  type        = string
  default     = ""
}

variable "task_role_policy" {
  description = "IAM policy document to apply to the tasks via a task role"
  type        = string

  default = <<END
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "*",
      "Effect": "Deny",
      "Resource": "*"
    }
  ]
}
END

}

variable "common_application_environment" {
  description = "Environment parameters passed to the container for all environments"
  type        = map(string)
  default     = {}
}

variable "application_environment" {
  description = "Environment specific parameters passed to the container"
  type        = map(string)
  default     = {}
}

