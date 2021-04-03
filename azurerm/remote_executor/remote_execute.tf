resource "null_resource" "install-extensions" {

  provisioner "local-exec" {
    # here is your CLI command to create the ML
    command = "az upgrade && az extension add --name azure-cli-ml && /opt/az/bin/python3 -m pip install azureml-dataprep --upgrade"
  }
}

resource "null_resource" "compute-cluster" {

  provisioner "local-exec" {
    # here is your CLI command to create the ML
    command = "az ml computetarget create amlcompute -n ps-cpu-cluster --max-nodes 4 --vm-size Standard_D2_V2 --resource-group ${var.rg} --workspace-name ${var.azureml_workspace_name}"
  }
}

resource "null_resource" "compute-instance" {

  provisioner "local-exec" {
    # here is your CLI command to create the ML
    command = "az ml computetarget create computeinstance -n ps-cpu-notebook --vm-size Standard_D2_V2 --resource-group ${var.rg} --workspace-name ${var.azureml_workspace_name}"
  }
}