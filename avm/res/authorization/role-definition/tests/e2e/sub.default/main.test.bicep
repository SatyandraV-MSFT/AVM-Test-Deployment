targetScope = 'subscription'

// ========== //
// Parameters //
// ========== //

@description('Optional. A short identifier for the kind of deployment. Should be kept short to not run into resource-name length-constraints.')
param serviceShort string = 'ardsubcom'

@description('Optional. A token to inject into the name of each resource.')
param namePrefix string = '[[namePrefix]]'

// ============== //
// Test Execution //
// ============== //

module testDeployment '../../../subscription/main.bicep' = {
  name: '${uniqueString(deployment().name)}-test-${serviceShort}'
  params: {
    roleName: '${namePrefix}-testRole-${serviceShort}'
    actions: [
      'Microsoft.Compute/galleries/*'
      'Microsoft.Network/virtualNetworks/read'
    ]
    assignableScopes: [
      subscription().id
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
