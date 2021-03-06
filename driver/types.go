package driver

import (
	"time"
)

type jsonLogLine struct {
	Docker_ContainerId   string            `json:"container_id"`
	Docker_ContainerName string            `json:"container_name"`
	Docker_StackName     string            `json:"stack_name"`
	Docker_ServiceName   string            `json:"service_name"`
	Docker_ImageId       string            `json:"image_id"`
	Docker_ImageName     string            `json:"image_name"`
	Docker_Tag           string            `json:"tag"`
	Host          string            `json:"host"`
	Timestamp     time.Time         `json:"timestamp"`
}
