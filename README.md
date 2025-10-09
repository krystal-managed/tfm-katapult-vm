# Katapult VM Module
Module for deploying Katapult VM with/without VM Group

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
}
```
# Inputs

| Name            | Description                                                  | Type          | Default | Required |
|-----------------|--------------------------------------------------------------|---------------|---------|----------|
| `name`          | Name of VM being created                                     | `string`      |         | **Yes**  |
| `package`       | Type of VM to create                                         | `string`      |         | **Yes**  |
| `disk_template` | OS of VM being created (see below for accepted values)       | `string`      |         | **Yes**  |
| `hostname`      | Name of VM being created                                     | `string`      |         | **No**   |
| `group_id`      | VM group to add server to                                    | `string`      |         | **No**   |
| `public_ips`    | Number of public IPs to assign to VM                         | `number`      | `1`     | **No**   |
| `disks`         | List of disks to be created, first disk will be assigned as the system disk (must include name and size as shown above), if not specified will use disk_template default | `list`  |      | **No**       |

These are the current accepted values for disk_template based on Katapult Distributions and whether they are supported:
- `AlmaLinux 8`
- `AlmaLinux 9`
- `Debian 11`
- `Debian 12`
- `Ubuntu 22.04`
- `Ubuntu 24.04`

For specific accounts such as Krystal Enterprise there are also specific ISO's that can be used as well such as the following:

- `OpenBSD 7.6`
- `OpenBSD 7.7`
- `SmartOS 20240208T000334Z`
