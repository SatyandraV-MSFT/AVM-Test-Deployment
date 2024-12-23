metadata name = 'Role Definitions (Management Group)'
metadata description = 'This module deploys a Role Definition at a Management Group scope.'
metadata owner = 'Azure/module-maintainers'

targetScope = 'managementGroup'

@sys.description('Required. Name of the custom RBAC role to be created.')
param roleName string

@sys.description('Optional. Description of the custom RBAC role to be created.')
param description string = ''

@sys.description('Optional. List of allowed actions.')
param actions array = []

@sys.description('Optional. List of denied actions.')
param notActions array = []

@sys.description('Optional. The group ID of the Management Group where the Role Definition and Target Scope will be applied to. If not provided, will use the current scope for deployment.')
param managementGroupId string = managementGroup().name

@sys.description('Optional. Role definition assignable scopes. If not provided, will use the current scope provided.')
param assignableScopes array = []

@sys.description('Optional. Enable/Disable usage telemetry for module.')
param enableTelemetry bool = true

#disable-next-line no-deployments-resources
resource avmTelemetry 'Microsoft.Resources/deployments@2024-03-01' = if (enableTelemetry) {
  name: '46d3xbcp.res.authorization-roledefinition.${replace('-..--..-', '.', '-')}.${substring(uniqueString(deployment().name, managementGroupId), 0, 4)}'
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

module roleDefinition_mg 'management-group/main.bicep' = {
  name: '${uniqueString(deployment().name, roleName, managementGroupId)}-RoleDefinition-MG-Module'
  scope: managementGroup(managementGroupId)
  params: {
    roleName: roleName
    description: !empty(description) ? description : ''
    actions: !empty(actions) ? actions : []
    notActions: !empty(notActions) ? notActions : []
    assignableScopes: !empty(assignableScopes) ? assignableScopes : []
    managementGroupId: managementGroupId
  }
}

@sys.description('The GUID of the Role Definition.')
output name string = roleDefinition_mg.outputs.name
@sys.description('The resource ID of the Role Definition.')
output resourceId string = roleDefinition_mg.outputs.resourceId
@sys.description('The scope this Role Definition applies to.')
output scope string = roleDefinition_mg.outputs.scope

