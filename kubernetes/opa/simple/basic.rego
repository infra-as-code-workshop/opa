package kube

deny[msg] {
  input.kind = "Deployment"
  not input.spec.template.spec.securityContext.runAsNonRoot = true
  msg = "Containers must not run as root"
}

default violated = false

violated = true {
  some container
  input_containers[container]
  contains(container.image, ":latest") # image tag is latest
}

violated = true {
  some container
  input_containers[container]
  not contains(container.image, ":") # This is a naked image
}

input_containers[container] {
  container := input.spec.template.spec.containers[_]
}

deny[msg] {
  input.kind = "Deployment"
  violated
  msg = "Containers uses images that are tagged latest or images with no tags"
}
