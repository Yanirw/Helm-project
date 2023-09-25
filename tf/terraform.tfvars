gcp_project_name = "demo-project"
project_id = "atomic-airship-393617"
region = "us-east1"
vpc_name = "gke-vpc"
subnet_name = "private-subnet"
gke_cluster_name = "cluster-1"
zones = ["us-east1-a", "us-east1-b", "us-east1-f"]
ip_range_pods = "10.0.0.0/24"
ip_range_services = "10.0.1.0/24"
subnet_cidr  = "10.0.1.0/24"

node_pools = [
  {
    name               = "default-node-pool"
    machine_type       = "n1-standard-4"
    node_locations     = "us-east1-b, us-east1-c"
    min_count          = 1
    max_count          = 10
    local_ssd_count    = 0
    spot               = false
    disk_size_gb       = 100
    disk_type          = "pd-standard"
    image_type         = "COS_CONTAINERD"
    enable_gcfs        = false
    enable_gvnic       = false
    logging_variant    = "DEFAULT"
    auto_repair        = true
    auto_upgrade       = true
    service_account    = "project-service-account@your-project-id.iam.gserviceaccount.com"
    preemptible        = false
    initial_node_count = 2
  },
]
