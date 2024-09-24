# Azure Kubernetes Service (AKS) Terraform Deployment

This repository contains a Terraform configuration to deploy an Azure Kubernetes Service (AKS) cluster, along with its supporting infrastructure, including a virtual network and a subnet.

## Overview

The infrastructure deployed by this configuration includes:

- **Resource Group:** To contain all the resources for the AKS cluster.
- **Virtual Network (VNet):** A network for the AKS cluster to operate within.
- **Subnet:** A subnet dedicated to the AKS cluster within the virtual network.
- **Azure Kubernetes Service (AKS):** A managed Kubernetes cluster with a default node pool and system-assigned identity.
Resources
- **azurerm_resource_group:** Defines the Azure Resource Group to hold the infrastructure.
- **azurerm_virtual_network:** Creates the virtual network for the AKS cluster.
- **azurerm_subnet:** Defines a subnet within the virtual network for the AKS cluster.
- **azurerm_kubernetes_cluster:** Provisions the Azure Kubernetes Service cluster with a default node pool.

## Prerequisites
Before running this Terraform configuration, ensure the following are set up:

- Terraform installed on your local machine.
- Azure CLI for authentication to your Azure account.
- An existing Azure subscription where resources will be deployed.

## Variables
The following variables must be provided:

- **resource_group_location:** The Azure region where the resources will be deployed.
- **resource_group:** The name of the resource group.
- **virtual_network_name:** The name of the virtual network.
- **subnet_name:** The name of the subnet.
- **cluster_name:** The name of the AKS cluster.
- **dns_prefix:** A unique DNS prefix for the AKS cluster.
- **kubernetes_version:** The version of Kubernetes to use for the AKS cluster.
- **node_count:** The number of nodes in the default node pool.

## Usage

Initialize the Terraform environment:

```console
terraform init
```

Review the execution plan:

```console
terraform plan
```

Apply the configuration to create the resources:

```console
terraform apply
```

After deployment, you can connect to your AKS cluster using kubectl:

```console
az aks get-credentials --resource-group <resource_group_name> --name <cluster_name>
```

## Notes

- The vm_size for the node pool is set to "Standard_B2pls_v2". You can modify this according to your workload requirements.
- The cluster is using the SystemAssigned identity type for its managed identity.
- The network plugin used is azure, and the load balancer SKU is set to standard.

## Cleanup
To remove all resources created by this Terraform configuration, run:

```console
terraform destroy
```