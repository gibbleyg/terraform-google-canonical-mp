/**
 * Copyright 2021 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

module "canonical_mp" {
  source = "../.."

  project_id           = var.project_id
  name                 = "wordpress-simple"
  zone                 = "us-west1-a"
  source_image         = "wordpress-v20220821"
  source_image_project = "click-to-deploy-images"
  machine_type         = "n2-standard-4"
  boot_disk_type       = "pd-standard"
  boot_disk_size       = "100"
  enable_logging       = true
  enable_monitoring    = true
  ip_source_ranges = {
    80  = "0.0.0.0/0"
    443 = "0.0.0.0/0"
  }
  wp_admin_email        = "malik.awais@gmail.com"
  wp_https_enabled      = true
  wp_install_phpmyadmin = true
  network_interfaces = [
    {
      network     = "default"
      subnetwork  = "default"
      external_ip = "Ephemeral"
    },
  ]
}
