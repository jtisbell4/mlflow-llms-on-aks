az acr create --resource-group taylors-llm-rg --name taylorscontainerregistry --sku Standard
az acr update --name taylorscontainerregistry --resource-group taylors-llm-rg --anonymous-pull-enabled