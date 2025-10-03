# Katapult VM Module
Module for deploying Katapult VM with/without security group

## Usage

```hcl
module "katapult_vm" {
  source = "git@github.com:krystal-managed/tfm-katapult-vm.git"

  name = "db1-2"
  group_id = "Database servers"
  package = "rock-3"
  disk_template = "Ubuntu 24.04"
  public_ips = 2

  disks = [
    {
        name = "System"
        size = 50
    },
    {
        name = "Data"
        size = 100
    }
  ]
  
  rules_in = [
    {
        ports = 3306
        targets = ["1.2.3.4/32"]
        notes = "SQL access for the ladz"
    },
    {
        protocol = "ICMP"
        targets = [
            "5.6.7.8/32",
            "5.4.3.2/32"
        ]
        notes = "Pingaling"
    }
  ]

  rules_out = [
    {
        ports = 25
        targets = ["10.11.12.13/32"]
        notes = "SMTP out"
    }
  ]
}
```
# Inputs

| Name            | Description                                                  | Type          | Default | Required |
|-----------------|--------------------------------------------------------------|---------------|---------|----------|
| `name`          | Name of VM being created                                     | `string`      |         | **Yes**  |
| `package`       | Type of VM to create                                         | `string`      |         | **Yes**  |
| `disk_tamplate` | OS of VM being created (see below for accepted values)       | `string`      |         | **Yes**  |
| `group_id`      | VM group to add server to                                    | `string`      |         | No       |
| `public_ips`    | Number of public IPs to assign to VM                         | `number`      | `1`     | No       |
| `disks`         | List of disks to be created, first disk will be assigned as the system disk (must include name and size as shown above), if not specified will use disk_template default | `list`  |      | No       |
| `create_sg`     | Specifies whether or not to create a security group and assign to VM | `bool`        | `true` | No       |

Accepted values for disk_template:
`AlmaLinux 8`
`AlmaLinux 9`
`CentOS 7.7`
`CentOS 7.9`
`CentOS 8.4`
`Debian 10.2`
`Debian 11`
`Debian 12`
`Debian 9.11`
`Fedora 32`
`OpenBSD 7.6`
`OpenBSD 7.7`
`SmartOS 20240208T000334Z`
`Ubuntu 18.04`
`Ubuntu 20.04`
`Ubuntu 22.04`
`Ubuntu 24.04`

# Security Group Variables

# Inputs

| Name            | Description                                                  | Type          | Default | Required |
|-----------------|--------------------------------------------------------------|---------------|---------|----------|
| `enable_web`    | Enable Web traffic (all ipv4/ipv6 http/https)                | `bool`        | `false` | No       |
| `enable_krystal` | Enable SSH access from Krystal hosts                        | `bool`        | `true`  | No       |
| `enable_zabbix` | Enable Zabbix access from Krystal hosts                      | `bool`        | `true`  | No       |
| `rules_in`      | Create bespoke inbound rules (see below table for more info) | `list`        | `false` | No       |
| `rules_out`     | Create bespoke outbound rules (see below table for more info) | `list`       | `false` | No       |

Common rules can be created automatically using the various `enable_*` variables listed above, for creating bespoke rules see below.

# Rules
When creating rules, use the following variables:
| Name             | Description                                                         | Type           | Default                | Required |
|------------------|---------------------------------------------------------------------|----------------|------------------------|----------|
| `notes`          | Description for rule being created                                  | `string`       |                        | **Yes**  |
| `ports`          | Specifies port(s)                                                   | `string`       | `"0"` (All ports)      | No       |
| `protocol`       | Specify protocol of the rule                                        | `string`       | `"TCP"`                | No       |
| `targets`        | IPs/address lists rule should be applied to                         | `list(string)` |                        | No       |

The module will by default allow all outbound traffic, this can be overwritten by using the rules_out variable.
