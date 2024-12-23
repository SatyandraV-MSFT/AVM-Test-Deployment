# Role Definitions (All scopes) `[Microsoft.Authorization/roleDefinitions]`

This module deploys a Role Definition at a Management Group, Subscription or Resource Group scope.

## Navigation

- [Resource Types](#Resource-Types)
- [Usage examples](#Usage-examples)
- [Parameters](#Parameters)
- [Outputs](#Outputs)
- [Data Collection](#Data-Collection)

## Resource Types

| Resource Type | API Version |
| :-- | :-- |
| `Microsoft.Authorization/roleDefinitions` | [2022-04-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Authorization/2022-04-01/roleDefinitions) |

## Usage examples

The following section provides usage examples for the module, which were used to validate and deploy the module successfully. For a full reference, please review the module's test folder in its repository.

>**Note**: Each example lists all the required parameters first, followed by the rest - each in alphabetical order.

>**Note**: To reference the module, please use the following syntax `br/public:avm/res/authorization/role-definition:<version>`.

- [Defaults](#example-1-defaults)
- [Mg.Default](#example-2-mgdefault)
- [Rg.Default](#example-3-rgdefault)
- [Sub.Default](#example-4-subdefault)
- [Waf-Aligned](#example-5-waf-aligned)

### Example 1: _Defaults_

<details>

<summary>via Bicep module</summary>

```bicep
module roleDefinition 'br/public:avm/res/authorization/role-definition:<version>' = {
  name: 'roleDefinitionDeployment'
  params: {
    // Required parameters
    // Non-required parameters
    location: '<location>'
    name: 'arddef001'
  }
}
```

</details>
<p>

<details>

<summary>via JSON parameters file</summary>

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    // Required parameters
    "location": {
      "value": "<location>"
    },
    // Non-required parameters
    "name": {
      "value": "arddef001"
    }
  }
}
```

</details>
<p>

<details>

<summary>via Bicep parameters file</summary>

```bicep-params
using 'br/public:avm/res/authorization/role-definition:<version>'

// Required parameters
// Non-required parameters
param location = '<location>'
param name = 'arddef001'
```

</details>
<p>

### Example 2: _Mg.Default_

<details>

<summary>via Bicep module</summary>

```bicep
module roleDefinition 'br/public:avm/res/authorization/role-definition:<version>' = {
  name: 'roleDefinitionDeployment'
  params: {
    // Required parameters
    roleName: 'testRole-ardmgcom'
    // Non-required parameters
    actions: [
      'Microsoft.Compute/galleries/*'
      'Microsoft.Network/virtualNetworks/read'
    ]
    assignableScopes: [
      '<id>'
    ]
    description: 'Test Custom Role Definition Standard (management group scope)'
    notActions: [
      'Microsoft.Compute/images/delete'
      'Microsoft.Compute/images/write'
      'Microsoft.Network/virtualNetworks/subnets/join/action'
    ]
  }
}
```

</details>
<p>

<details>

<summary>via JSON parameters file</summary>

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    // Required parameters
    "roleName": {
      "value": "testRole-ardmgcom"
    },
    // Non-required parameters
    "actions": {
      "value": [
        "Microsoft.Compute/galleries/*",
        "Microsoft.Network/virtualNetworks/read"
      ]
    },
    "assignableScopes": {
      "value": [
        "<id>"
      ]
    },
    "description": {
      "value": "Test Custom Role Definition Standard (management group scope)"
    },
    "notActions": {
      "value": [
        "Microsoft.Compute/images/delete",
        "Microsoft.Compute/images/write",
        "Microsoft.Network/virtualNetworks/subnets/join/action"
      ]
    }
  }
}
```

</details>
<p>

<details>

<summary>via Bicep parameters file</summary>

```bicep-params
using 'br/public:avm/res/authorization/role-definition:<version>'

// Required parameters
param roleName = 'testRole-ardmgcom'
// Non-required parameters
param actions = [
  'Microsoft.Compute/galleries/*'
  'Microsoft.Network/virtualNetworks/read'
]
param assignableScopes = [
  '<id>'
]
param description = 'Test Custom Role Definition Standard (management group scope)'
param notActions = [
  'Microsoft.Compute/images/delete'
  'Microsoft.Compute/images/write'
  'Microsoft.Network/virtualNetworks/subnets/join/action'
]
```

</details>
<p>

### Example 3: _Rg.Default_

<details>

<summary>via Bicep module</summary>

```bicep
module roleDefinition 'br/public:avm/res/authorization/role-definition:<version>' = {
  name: 'roleDefinitionDeployment'
  params: {
    // Required parameters
    roleName: 'testRole-kvvmin'
    // Non-required parameters
    actions: [
      'Microsoft.Compute/galleries/*'
      'Microsoft.Network/virtualNetworks/read'
    ]
    assignableScopes: [
      '<id>'
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
```

</details>
<p>

<details>

<summary>via JSON parameters file</summary>

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    // Required parameters
    "roleName": {
      "value": "testRole-kvvmin"
    },
    // Non-required parameters
    "actions": {
      "value": [
        "Microsoft.Compute/galleries/*",
        "Microsoft.Network/virtualNetworks/read"
      ]
    },
    "assignableScopes": {
      "value": [
        "<id>"
      ]
    },
    "dataActions": {
      "value": [
        "Microsoft.Storage/storageAccounts/blobServices/*/read"
      ]
    },
    "description": {
      "value": "Test Custom Role Definition Standard (resource group scope)"
    },
    "notActions": {
      "value": [
        "Microsoft.Compute/images/delete",
        "Microsoft.Compute/images/write",
        "Microsoft.Network/virtualNetworks/subnets/join/action"
      ]
    },
    "notDataActions": {
      "value": [
        "Microsoft.Storage/storageAccounts/blobServices/containers/blobs/read"
      ]
    }
  }
}
```

</details>
<p>

<details>

<summary>via Bicep parameters file</summary>

```bicep-params
using 'br/public:avm/res/authorization/role-definition:<version>'

// Required parameters
param roleName = 'testRole-kvvmin'
// Non-required parameters
param actions = [
  'Microsoft.Compute/galleries/*'
  'Microsoft.Network/virtualNetworks/read'
]
param assignableScopes = [
  '<id>'
]
param dataActions = [
  'Microsoft.Storage/storageAccounts/blobServices/*/read'
]
param description = 'Test Custom Role Definition Standard (resource group scope)'
param notActions = [
  'Microsoft.Compute/images/delete'
  'Microsoft.Compute/images/write'
  'Microsoft.Network/virtualNetworks/subnets/join/action'
]
param notDataActions = [
  'Microsoft.Storage/storageAccounts/blobServices/containers/blobs/read'
]
```

</details>
<p>

### Example 4: _Sub.Default_

<details>

<summary>via Bicep module</summary>

```bicep
module roleDefinition 'br/public:avm/res/authorization/role-definition:<version>' = {
  name: 'roleDefinitionDeployment'
  params: {
    // Required parameters
    roleName: 'testRole-ardsubcom'
    // Non-required parameters
    actions: [
      'Microsoft.Compute/galleries/*'
      'Microsoft.Network/virtualNetworks/read'
    ]
    assignableScopes: [
      '<id>'
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
```

</details>
<p>

<details>

<summary>via JSON parameters file</summary>

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    // Required parameters
    "roleName": {
      "value": "testRole-ardsubcom"
    },
    // Non-required parameters
    "actions": {
      "value": [
        "Microsoft.Compute/galleries/*",
        "Microsoft.Network/virtualNetworks/read"
      ]
    },
    "assignableScopes": {
      "value": [
        "<id>"
      ]
    },
    "dataActions": {
      "value": [
        "Microsoft.Storage/storageAccounts/blobServices/*/read"
      ]
    },
    "description": {
      "value": "Test Custom Role Definition Standard (subscription scope)"
    },
    "notActions": {
      "value": [
        "Microsoft.Compute/images/delete",
        "Microsoft.Compute/images/write",
        "Microsoft.Network/virtualNetworks/subnets/join/action"
      ]
    },
    "notDataActions": {
      "value": [
        "Microsoft.Storage/storageAccounts/blobServices/containers/blobs/read"
      ]
    }
  }
}
```

</details>
<p>

<details>

<summary>via Bicep parameters file</summary>

```bicep-params
using 'br/public:avm/res/authorization/role-definition:<version>'

// Required parameters
param roleName = 'testRole-ardsubcom'
// Non-required parameters
param actions = [
  'Microsoft.Compute/galleries/*'
  'Microsoft.Network/virtualNetworks/read'
]
param assignableScopes = [
  '<id>'
]
param dataActions = [
  'Microsoft.Storage/storageAccounts/blobServices/*/read'
]
param description = 'Test Custom Role Definition Standard (subscription scope)'
param notActions = [
  'Microsoft.Compute/images/delete'
  'Microsoft.Compute/images/write'
  'Microsoft.Network/virtualNetworks/subnets/join/action'
]
param notDataActions = [
  'Microsoft.Storage/storageAccounts/blobServices/containers/blobs/read'
]
```

</details>
<p>

### Example 5: _Waf-Aligned_

<details>

<summary>via Bicep module</summary>

```bicep
module roleDefinition 'br/public:avm/res/authorization/role-definition:<version>' = {
  name: 'roleDefinitionDeployment'
  params: {
    // Required parameters
    // Non-required parameters
    location: '<location>'
    name: 'ardwaf001'
  }
}
```

</details>
<p>

<details>

<summary>via JSON parameters file</summary>

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    // Required parameters
    "location": {
      "value": "<location>"
    },
    // Non-required parameters
    "name": {
      "value": "ardwaf001"
    }
  }
}
```

</details>
<p>

<details>

<summary>via Bicep parameters file</summary>

```bicep-params
using 'br/public:avm/res/authorization/role-definition:<version>'

// Required parameters
// Non-required parameters
param location = '<location>'
param name = 'ardwaf001'
```

</details>
<p>

## Parameters

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`roleName`](#parameter-rolename) | string | Name of the custom RBAC role to be created. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`actions`](#parameter-actions) | array | List of allowed actions. |
| [`assignableScopes`](#parameter-assignablescopes) | array | Role definition assignable scopes. If not provided, will use the current scope provided. |
| [`dataActions`](#parameter-dataactions) | array | List of allowed data actions. This is not supported if the assignableScopes contains Management Group Scopes. |
| [`description`](#parameter-description) | string | Description of the custom RBAC role to be created. |
| [`enableTelemetry`](#parameter-enabletelemetry) | bool | Enable/Disable usage telemetry for module. |
| [`location`](#parameter-location) | string | Location deployment metadata. |
| [`managementGroupId`](#parameter-managementgroupid) | string | The group ID of the Management Group where the Role Definition and Target Scope will be applied to. If not provided, will use the current scope for deployment. |
| [`notActions`](#parameter-notactions) | array | List of denied actions. |
| [`notDataActions`](#parameter-notdataactions) | array | List of denied data actions. This is not supported if the assignableScopes contains Management Group Scopes. |
| [`resourceGroupName`](#parameter-resourcegroupname) | string | The name of the Resource Group where the Role Definition and Target Scope will be applied to. |
| [`subscriptionId`](#parameter-subscriptionid) | string | The subscription ID where the Role Definition and Target Scope will be applied to. Use for both Subscription level and Resource Group Level. |

### Parameter: `roleName`

Name of the custom RBAC role to be created.

- Required: Yes
- Type: string

### Parameter: `actions`

List of allowed actions.

- Required: No
- Type: array
- Default: `[]`

### Parameter: `assignableScopes`

Role definition assignable scopes. If not provided, will use the current scope provided.

- Required: No
- Type: array
- Default: `[]`

### Parameter: `dataActions`

List of allowed data actions. This is not supported if the assignableScopes contains Management Group Scopes.

- Required: No
- Type: array
- Default: `[]`

### Parameter: `description`

Description of the custom RBAC role to be created.

- Required: No
- Type: string
- Default: `''`

### Parameter: `enableTelemetry`

Enable/Disable usage telemetry for module.

- Required: No
- Type: bool
- Default: `True`

### Parameter: `location`

Location deployment metadata.

- Required: No
- Type: string
- Default: `[deployment().location]`

### Parameter: `managementGroupId`

The group ID of the Management Group where the Role Definition and Target Scope will be applied to. If not provided, will use the current scope for deployment.

- Required: No
- Type: string
- Default: `[managementGroup().name]`

### Parameter: `notActions`

List of denied actions.

- Required: No
- Type: array
- Default: `[]`

### Parameter: `notDataActions`

List of denied data actions. This is not supported if the assignableScopes contains Management Group Scopes.

- Required: No
- Type: array
- Default: `[]`

### Parameter: `resourceGroupName`

The name of the Resource Group where the Role Definition and Target Scope will be applied to.

- Required: No
- Type: string
- Default: `''`

### Parameter: `subscriptionId`

The subscription ID where the Role Definition and Target Scope will be applied to. Use for both Subscription level and Resource Group Level.

- Required: No
- Type: string
- Default: `''`

## Outputs

| Output | Type | Description |
| :-- | :-- | :-- |
| `name` | string | The GUID of the Role Definition. |
| `resourceId` | string | The resource ID of the Role Definition. |
| `scope` | string | The scope this Role Definition applies to. |

## Data Collection

The software may collect information about you and your use of the software and send it to Microsoft. Microsoft may use this information to provide services and improve our products and services. You may turn off the telemetry as described in the [repository](https://aka.ms/avm/telemetry). There are also some features in the software that may enable you and Microsoft to collect data from users of your applications. If you use these features, you must comply with applicable law, including providing appropriate notices to users of your applications together with a copy of Microsoft’s privacy statement. Our privacy statement is located at <https://go.microsoft.com/fwlink/?LinkID=824704>. You can learn more about data collection and use in the help documentation and our privacy statement. Your use of the software operates as your consent to these practices.
