output "node_pool_name" {
  description = "Name of the GPU node pool"
  value       = google_container_node_pool.gpu_nodes.name
}

