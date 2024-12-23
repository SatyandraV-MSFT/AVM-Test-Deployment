targetScope = 'managementGroup'

// ========== //
// Parameters //
// ========== //

@description('Optional. A short identifier for the kind of deployment. Should be kept short to not run into resource-name length-constraints.')
param serviceShort string = 'ard'

@description('Optional. A token to inject into the name of each resource.')
param namePrefix string = '[[namePrefix]]'

@description('Optional. The location to deploy resources to.')
param resourceLocation string = deployment().location

@sys.description('Optional. The subscription ID where the Role Definition and Target Scope will be applied to. If not provided, will use the current scope for deployment.')
param subscriptionId string = ''

@sys.description('Optional. The group ID of the Management Group where the Role Definition and Target Scope will be applied to. If not provided, will use the current scope for deployment.')
param managementGroupId string = managementGroup().name

@description('Optional. The name of the resource group to deploy for testing purposes.')
@maxLength(90)
param resourceGroupName string = 'dep-${namePrefix}-authorization.role-definition-${serviceShort}-rg'

// ============== //
// Test Execution Scope: Management Group //
// ============== //

module testDeployment_mg '../../../management-group/main.bicep' = {
  name: '${uniqueString(deployment().name)}-test-${serviceShort}-mg'
  scope: managementGroup(managementGroupId)
  params: {
    roleName: '${namePrefix}-testRole-${serviceShort}-mg'
    actions: [
      'Microsoft.Compute/galleries/*'
      'Microsoft.Network/virtualNetworks/read'
    ]
    assignableScopes: [
      managementGroup().id
    ]
    description: 'Test Custom Role Definition Standard (management group scope)'
    notActions: [
      'Microsoft.Compute/images/delete'
      'Microsoft.Compute/images/write'
      'Microsoft.Network/virtualNetworks/subnets/join/action'
    ]
  }
}

// ============== //
// Test Execution Scope: Subscription //
// ============== //

module testDeployment_sub '../../../subscription/main.bicep'  = if (!empty(subscriptionId)) {
  name: '${uniqueString(deployment().name)}-test-${serviceShort}-sub'
  scope: subscription(subscriptionId)
  params: {
    roleName: '${namePrefix}-testRole-${serviceShort}-sub'
    actions: [
      'Microsoft.Compute/galleries/*'
      'Microsoft.Network/virtualNetworks/read'
    ]
    assignableScopes: [
      subscriptionId
    ]
    dataActions: [
      'Microsoft.Storage/storageAccounts/blobServices/*/read'
    ]
    description: 'Test Custom Role Definition Standard (subscription scope)'
    notActions: [
      'Microsoft.Compute/images/delete'
      'Microsoft.Compute/images/write'
      'Microsoft.Network/virtualNetworks/subnets/join/action'
    ]
    notDataActions: [
      'Microsoft.Storage/storageAccounts/blobServices/containers/blobs/read'
    ]
  }
}

// General resources
// =================

module resourceGroup 'br/public:avm/res/resources/resource-group:0.4.0' = {
  name: 'dep-${uniqueString(deployment().name)}-test-${serviceShort}-rg'
  scope: subscription(subscriptionId)
  params: {
    name: resourceGroupName
    location: resourceLocation
  }
}

// ============== //
// Test Execution Scope: Resource Group //
// ============== //

module testDeployment '../../../resource-group/main.bicep' = {
  scope: resourceGroupName
  name: '${uniqueString(deployment().name)}-test-${serviceShort}-rg'
  params: {
    roleName: '${namePrefix}-testRole-${serviceShort}-sub'
    actions: [
      'Microsoft.Compute/galleries/*'
      'Microsoft.Network/virtualNetworks/read'
    ]
    assignableScopes: [
      resourceGroup.id
    ]
    dataActions: [
      'Microsoft.Storage/storageAccounts/blobServices/*/read'
    ]
    description: 'Test Custom Role Definition Standard (resource group scope)'
    notActions: [
      'Microsoft.Compute/images/delete'
      'Microsoft.Compute/images/write'
      'Microsoft.Network/virtualNetworks/subnets/join/action'
    ]
    notDataActions: [
      'Microsoft.Storage/storageAccounts/blobServices/containers/blobs/read'
    ]
  }
}
