metadata name = 'Role Definitions (Resource Group)'
metadata description = 'This module deploys a Role Definition at a Resource Group scope.'
metadata owner = 'Azure/module-maintainers'

@sys.description('Required. Name of the custom RBAC role to be created.')
param roleName string

@sys.description('Optional. Description of the custom RBAC role to be created.')
param description string = ''

@sys.description('Optional. List of allowed actions.')
param actions array = []

@sys.description('Optional. List of denied actions.')
param notActions array = []

@sys.description('Optional. List of allowed data actions. This is not supported if the assignableScopes contains Management Group Scopes.')
param dataActions array = []

@sys.description('Optional. List of denied data actions. This is not supported if the assignableScopes contains Management Group Scopes.')
param notDataActions array = []

@sys.description('Optional. The subscription ID where the Role Definition and Target Scope will be applied to. Use for both Subscription level and Resource Group Level.')
param subscriptionId string = ''

@sys.description('Optional. The name of the Resource Group where the Role Definition and Target Scope will be applied to.')
param resourceGroupName string = ''


@sys.description('Optional. Role definition assignable scopes. If not provided, will use the current scope provided.')
param assignableScopes array = []

@sys.description('Optional. Enable/Disable usage telemetry for module.')
param enableTelemetry bool = true

#disable-next-line no-deployments-resources
resource avmTelemetry 'Microsoft.Resources/deployments@2024-03-01' = if (enableTelemetry) {
  name: '46d3xbcp.res.authorization-roledefinition.${replace('-..--..-', '.', '-')}.${substring(uniqueString(deployment().name, roleName, subscriptionId), 0, 4)}'
  properties: {
    mode: 'Incremental'
    template: {
      '$schema': 'https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#'
      contentVersion: '1.0.0.0'
      resources: []
      outputs: {
        telemetry: {
          type: 'String'
          value: 'For more information, see https://aka.ms/avm/TelemetryInfo'
        }
      }
    }
  }
}

module roleDefinition_rg 'resource-group/main.bicep' = {
  name: '${uniqueString(deployment().name, roleName, subscriptionId)}-RoleDefinition-RG-Module'
  scope: resourceGroup(subscriptionId, resourceGroupName)
  params: {
    roleName: roleName
    description: !empty(description) ? description : ''
    actions: !empty(actions) ? actions : []
    notActions: !empty(notActions) ? notActions : []
    dataActions: !empty(dataActions) ? dataActions : []
    notDataActions: !empty(notDataActions) ? notDataActions : []
    assignableScopes: !empty(assignableScopes) ? assignableScopes : []
    subscriptionId: subscriptionId
    resourceGroupName: resourceGroupName
  }
}

@sys.description('The GUID of the Role Definition.')
output name string = roleDefinition_rg.outputs.name
@sys.description('The resource ID of the Role Definition.')
output resourceId string = roleDefinition_rg.outputs.resourceId
@sys.description('The scope this Role Definition applies to.')
output scope string = roleDefinition_rg.outputs.scope
